//
//  NSIndexSetExtension.swift
//  PhotoLib
//
//  Created by Admin on 5/4/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

extension NSIndexSet {
    func getIndexPathsFromIndexesWithSection(section: Int) -> [NSIndexPath] {
        var indexPaths: [NSIndexPath] = []
        for (index, _) in self.enumerate() {
            indexPaths += [NSIndexPath(forItem: index, inSection: section)]
        }
        return indexPaths
    }
}