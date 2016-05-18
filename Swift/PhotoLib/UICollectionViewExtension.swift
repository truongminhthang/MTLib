//
//  UICollectionViewExtension.swift
//  PhotoLib
//
//  Created by Admin on 5/7/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

extension UICollectionView {
    func mt_getIndexPathsForElementsInRect(rect: CGRect) -> [NSIndexPath]{
        let allLayoutAttributes = collectionViewLayout.layoutAttributesForElementsInRect(rect)
        guard allLayoutAttributes == nil else {
            return []
        }
        if allLayoutAttributes?.count == 0 {
            return []
        }
        var result : [NSIndexPath] = []
        for item in allLayoutAttributes! {
            result += [item.indexPath]
        }
        return result
    }
}