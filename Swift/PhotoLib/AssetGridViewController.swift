//
//  AssetGridViewController.swift
//  PhotoLib
//
//  Created by Admin on 5/3/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit
import Photos
import PhotosUI

private let reuseIdentifier = "AssetCollectionViewCell"
private let kMinInteritemSpacing  : CGFloat = 0
private let kMinimumLineSpacing   : CGFloat = 0
private let kEdgeInset                      = UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0)

class AssetGridViewController: UICollectionViewController {
    
    @IBOutlet var addButton: UIBarButtonItem!
    
    var assetsFetchResults  : PHFetchResult!
    var assetCollection     : PHAssetCollection!
    var imageManager        : PHCachingImageManager!
    /*
     Một đối tượng PHCachingImageManager lấy về hoặc tạo ra các dữ liệu cho các nội dung hình ảnh hoặc video. Để đạt hiệu quả về mặt hiệu năng khi làm việc với nhiều nội dung. Một bộ quản lý hình ảnh bộ nhớ đẹm (PHCachingImageManager) có thể chuẩn bị những hình ảnh ở background theo thứ tự để loại bỏ sự chậm trễ khi bạn yêu cầu những ảnh riêng biệt. Ví dụ, khi bạn muốn duyệt một collectionView hoặc một UI đơn giản với ảnh thumbnails của các nội dung photo và video
     */
    var previousPreheatRect : CGRect!
    private var isPortrait            : Bool         = true
    private var numberOfItemInRow     : CGFloat  {
        return isPortrait ? 4 : 6
    }
    
    private var itemSize              : CGSize  {
        
        let width = UIScreen.mainScreen().bounds.width
        let itemWidth = (width - kEdgeInset.left - kEdgeInset.right - (numberOfItemInRow - 1) * kMinInteritemSpacing ) / numberOfItemInRow
        let itemHeight = itemWidth
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    private var assetGridThumbnailSize : CGSize {
        
        let scale = UIScreen.mainScreen().scale
        return itemSize * scale
    }
    
    override func awakeFromNib() {
        
        assert(assetsFetchResults == nil, "assetFetchResults phải có trước khi sử dụng")
        imageManager = PHCachingImageManager()
        resetCachedAssets()
        PHPhotoLibrary.sharedPhotoLibrary().registerChangeObserver(self)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(deviceDidRotate), name: UIDeviceOrientationDidChangeNotification, object: nil)
    }
    
    func deviceDidRotate(notification: NSNotification) {
        
        let orientation = UIDevice.currentDevice().orientation
        if orientation == UIDeviceOrientation.Portrait || orientation == UIDeviceOrientation.PortraitUpsideDown {
            isPortrait = true
            collectionView?.reloadData()
        } else {
            isPortrait = false
            collectionView?.reloadData()
        }
    }
    
    deinit {
        PHPhotoLibrary.sharedPhotoLibrary().unregisterChangeObserver(self)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if (assetCollection == nil) ||  assetCollection.canPerformEditOperation(PHCollectionEditOperation.AddContent) {
            navigationItem.rightBarButtonItem = addButton
        } else {
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        updateCachedAssets()
    }
    
    func resetCachedAssets() {
        
        imageManager.stopCachingImagesForAllAssets()
        previousPreheatRect = CGRectZero
    }
    
    func updateCachedAssets() {
        
        let isViewVisible = isViewLoaded() && view.window == nil
        guard isViewVisible else {
            return
        }
        let collectionViewBounds = self.collectionView?.bounds ?? CGRectZero
        let preheatRect = CGRectInset(collectionViewBounds, 0 , -0.5 * collectionViewBounds.height)
        
        let delta = abs(CGRectGetMidY(preheatRect) - CGRectGetMidY(previousPreheatRect))
        if delta > collectionViewBounds.height / 3.0 {
            var addedIndexPaths : [NSIndexPath] = []
            var removedIndexPaths : [NSIndexPath] = []
            
            computeDifferenceBetweenRect(previousPreheatRect, andRect: preheatRect, removedHandler: {
                (removedRect) in
                
                let indexpaths = self.collectionView!.mt_getIndexPathsForElementsInRect(removedRect)
                removedIndexPaths += indexpaths
                }, addedHandler: { (addedRect) in
                    
                    let indexPaths = self.collectionView!.mt_getIndexPathsForElementsInRect(addedRect)
                    addedIndexPaths += indexPaths
                    
            })
            
            let assetToStartCaching = getAssetsAtIndexPaths(addedIndexPaths)
            let assetToStopCaching = getAssetsAtIndexPaths(removedIndexPaths)
            
            imageManager.startCachingImagesForAssets(assetToStartCaching, targetSize: assetGridThumbnailSize, contentMode: PHImageContentMode.AspectFill, options: nil)
            
            imageManager.stopCachingImagesForAssets(assetToStopCaching, targetSize: assetGridThumbnailSize, contentMode: PHImageContentMode.AspectFill, options: nil)
            self.previousPreheatRect = preheatRect;
        }
    }
    
    func getAssetsAtIndexPaths (indexPaths: [NSIndexPath]) -> [PHAsset] {
        
        guard indexPaths.count != 0  else {
            return []
        }
        var assets : [PHAsset] = []
        for indexPath in indexPaths {
            let asset = self.assetsFetchResults[indexPath.item] as! PHAsset
            assets.append(asset)
        }
        return assets;
    }
    
    func computeDifferenceBetweenRect (oldRect: CGRect, andRect newRect: CGRect, removedHandler: (removedRect: CGRect) -> Void, addedHandler: (addedRect: CGRect) -> Void) {
        if (CGRectIntersectsRect(newRect, oldRect)) {
            let oldMaxY = CGRectGetMaxY(oldRect)
            let oldMinY = CGRectGetMinY(oldRect)
            let newMaxY = CGRectGetMaxY(newRect)
            let newMinY = CGRectGetMinY(newRect)
            
            if (newMaxY > oldMaxY) {
                let rectToAdd = CGRectMake(newRect.origin.x, oldMaxY, newRect.size.width, (newMaxY - oldMaxY));
                addedHandler(addedRect: rectToAdd);
            }
            
            if (oldMinY > newMinY) {
                let rectToAdd = CGRectMake(newRect.origin.x, newMinY, newRect.size.width, (oldMinY - newMinY));
                addedHandler(addedRect: rectToAdd);
            }
            
            if (newMaxY < oldMaxY) {
                let rectToRemove = CGRectMake(newRect.origin.x, newMaxY, newRect.size.width, (oldMaxY - newMaxY));
                removedHandler(removedRect: rectToRemove);
            }
            
            if (oldMinY < newMinY) {
                let rectToRemove = CGRectMake(newRect.origin.x, oldMinY, newRect.size.width, (newMinY - oldMinY));
                removedHandler(removedRect: rectToRemove);
            }
        } else {
            addedHandler(addedRect: newRect);
            removedHandler(removedRect: oldRect);
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK:  
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return assetsFetchResults.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let asset = assetsFetchResults[indexPath.item] as! PHAsset
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! AssetCollectionViewCell
        cell.representedAssetIdentifier = asset.localIdentifier
        
        if asset.mediaType == .Video {
            cell.livePhotoBadgeImage = UIImage(named: "video_call")
        }
        
        if asset.mediaSubtypes == .PhotoLive {
            let bagdeImage = PHLivePhotoView.livePhotoBadgeImageWithOptions(PHLivePhotoBadgeOptions.OverContent)
            cell.livePhotoBadgeImage = bagdeImage
        }
        
        // request an image for the asset from the PHCachingImageManager
        imageManager.requestImageForAsset(asset, targetSize: assetGridThumbnailSize, contentMode: PHImageContentMode.AspectFill , options: nil) { (result, info) in
            if cell.representedAssetIdentifier == asset.localIdentifier {
                cell.thumbnailImage = result
            }
        }
        return cell
    }
}

// MARK: - UIScrollViewDelegate

extension AssetGridViewController {
    override func scrollViewDidZoom(scrollView: UIScrollView) {
        updateCachedAssets()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension AssetGridViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return kEdgeInset
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return itemSize
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return kMinInteritemSpacing
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return kMinimumLineSpacing
    }
}

// MARK: - PHPhotoLibraryChangeObserver

extension AssetGridViewController: PHPhotoLibraryChangeObserver {
    
    func photoLibraryDidChange(changeInstance: PHChange) {
        let collectionChanges: PHFetchResultChangeDetails! = changeInstance.changeDetailsForFetchResult(self.assetsFetchResults)
        
        guard collectionChanges != nil else {
            return
        }
        
        dispatch_async(dispatch_get_main_queue()) {
            self.assetsFetchResults = collectionChanges.fetchResultAfterChanges
            weak var collectionview = self.collectionView
            if (!collectionChanges.hasIncrementalChanges||collectionChanges.hasMoves) {
                collectionview!.reloadData()
            } else {
                /*
                 Thông báo với collectionView để hoạt hình hóa việc thêm và xóa nếu chúng ta có những sự thay đổi
                 */
                collectionview!.performBatchUpdates({
                    if let removedIndexes = collectionChanges.removedIndexes where removedIndexes.count > 0 {
                            collectionview!.deleteItemsAtIndexPaths(removedIndexes.getIndexPathsFromIndexesWithSection(0))
                    }
                    
                    if let insertedIndexes = collectionChanges.insertedIndexes where insertedIndexes.count > 0 {
                            collectionview!.insertItemsAtIndexPaths(insertedIndexes.getIndexPathsFromIndexesWithSection(0))
                    }
                    
                    if let changedIndexes = collectionChanges.changedIndexes where changedIndexes.count > 0 {
                            collectionview!.reloadItemsAtIndexPaths(changedIndexes.getIndexPathsFromIndexesWithSection(0))
                    }
                    }, completion: nil)
            }
            self.resetCachedAssets()
        }
    }
}

func * (left: CGSize, right: CGFloat) -> CGSize {
    return CGSize (width: left.width * right , height: left.height * right)
}