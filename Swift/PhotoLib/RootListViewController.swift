//
//  RootListViewController.swift
//  PhotoLib
//
//  Created by Admin on 5/3/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Photos

enum SectionType: Int {
    case AllPhotos = 0
    case SmartAlbums
    case Albums
}


class RootListViewController: UITableViewController {
    
    private let reuseIdentifier_allPhoto = "AllPhotosCell"
    private let reuseIdentifier_collection = "CollectionCell"
    
    private let segue_allPhotos = "showAllPhotos"
    private let segue_collection = "showCollection"

    var sectionFetchResults : [PHFetchResult] = []
    var sectionLocaizedTitles : [String] = []
    
    override func awakeFromNib() {
        let sortOptions = PHFetchOptions()
        let sortDescriptiors = NSSortDescriptor(key: "creationDate", ascending: true)
        sortOptions.sortDescriptors = [sortDescriptiors]
        let allPhotos = PHAsset.fetchAssetsWithOptions(sortOptions)
        
        let smartAlbums = PHAssetCollection.fetchAssetCollectionsWithType(PHAssetCollectionType.SmartAlbum, subtype: PHAssetCollectionSubtype.AlbumRegular, options: nil)
        
        let toplevelUserCollections = PHCollectionList.fetchTopLevelUserCollectionsWithOptions(nil)
        // Store the PHFetchResult objects and localized titles for each section.
        sectionFetchResults = [allPhotos, smartAlbums, toplevelUserCollections]
        sectionLocaizedTitles = ["", NSLocalizedString("Smart Albums", comment: ""),  NSLocalizedString("Albums", comment: "")]
        PHPhotoLibrary.sharedPhotoLibrary().registerChangeObserver(self)
    }
    
    deinit {
        PHPhotoLibrary.sharedPhotoLibrary().unregisterChangeObserver(self)
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return self.sectionFetchResults.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case SectionType.AllPhotos.rawValue:
            return 1
        default:
            return sectionFetchResults[section].count
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell
        switch indexPath.section {
        case SectionType.AllPhotos.rawValue:
            cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier_allPhoto, forIndexPath: indexPath)
            cell.textLabel?.text = NSLocalizedString("All Photos", comment: "")
        default:
            let fetchResult = sectionFetchResults[indexPath.section]
            let collection = fetchResult[indexPath.row]
            
            cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier_collection, forIndexPath: indexPath)
            cell.textLabel?.text = collection.localizedTitle
        }
        return cell
        
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionLocaizedTitles[section]
    }
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        guard segue.destinationViewController.isKindOfClass(AssetGridViewController)  else {
            return
        }
        
        guard sender!.isKindOfClass(UITableViewCell) else {
            return
        }
        
        let assetGridViewController = segue.destinationViewController as! AssetGridViewController
        let cell = sender! as! UITableViewCell
        assetGridViewController.title = cell.textLabel?.text
        let indexPath = tableView.indexPathForCell(cell)!
        let fetchResult = sectionFetchResults[indexPath.section]
        
        switch segue.identifier ?? "" {
        case segue_allPhotos:
            assetGridViewController.assetsFetchResults = fetchResult
        case segue_collection:
            let assetCollection = fetchResult[indexPath.row] as! PHAssetCollection
            let assetFetchResult = PHAsset.fetchAssetsInAssetCollection(assetCollection, options: nil)
            assetGridViewController.assetsFetchResults = assetFetchResult
            assetGridViewController.assetCollection = assetCollection
        default:
            break
        }
    }
}


// MARK: - PHPhotoLibraryChangeObserver

extension RootListViewController: PHPhotoLibraryChangeObserver {
    func photoLibraryDidChange(changeInstance: PHChange) {
        dispatch_async(dispatch_get_main_queue()) { 
            var updateSectionFetchResults = self.sectionFetchResults
            var reloadRequired = false
            for (index, value) in self.sectionFetchResults.enumerate() {
                let changeDetails = changeInstance.changeDetailsForFetchResult(value)
                if let changeDetails = changeDetails {
                    updateSectionFetchResults[index] = changeDetails.fetchResultAfterChanges
                    reloadRequired = true
                }
            }
            
            if reloadRequired {
                self.sectionFetchResults = updateSectionFetchResults
                self.tableView.reloadData()
            }
        }
    }
}
