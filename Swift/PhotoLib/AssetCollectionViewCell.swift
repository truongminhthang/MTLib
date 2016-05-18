//
//  AssetCollectionViewCell.swift
//  PhotoLib
//
//  Created by Admin on 5/4/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class AssetCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var livePhotoBadgeImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        livePhotoBadgeImageView.contentMode = UIViewContentMode.ScaleAspectFit

    }
    
    var thumbnailImage : UIImage? {
        didSet {
            imageView.image = thumbnailImage
        }
    }
    
    var livePhotoBadgeImage: UIImage? {
        didSet {
            livePhotoBadgeImageView.image = livePhotoBadgeImage
        }
    }
    var representedAssetIdentifier: String = ""
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        livePhotoBadgeImageView.image = nil
    }
    
}
