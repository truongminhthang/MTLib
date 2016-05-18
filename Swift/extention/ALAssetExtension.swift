//
//  ALAssetExtension.swift
//  MP_ARWedding
//
//  Created by Trương Thắng on 2/22/16.
//  Copyright © 2016 MyPrint. All rights reserved.
//

import AssetsLibrary

extension ALAsset {
    var duration: NSTimeInterval {
        get {
            return self.valueForProperty(ALAssetPropertyDuration).doubleValue
        }
    }
    
    var dimensions: CGSize {
        get {
            return self.defaultRepresentation().dimensions()
        }
    }
}