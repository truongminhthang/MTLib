//
//  AVPlayerExtension.swift
//  MP_ARWedding
//
//  Created by Trương Thắng on 2/20/16.
//  Copyright © 2016 MyPrint. All rights reserved.
//

import Foundation
import AVFoundation
import AssetsLibrary

extension AVPlayer {
    static func fromALAsset(asset: ALAsset) -> AVPlayer {
        let url = asset.defaultRepresentation().url()
        return AVPlayer(URL: url)
        
    }
}

