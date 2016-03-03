//
//  NSURLExtention.swift
//  MP_ARWedding
//
//  Created by Trương Thắng on 2/22/16.
//  Copyright © 2016 MyPrint. All rights reserved.
//

import Foundation

extension NSURL {
    static func getVideoPath(fileName: String) -> NSURL? {
        return NSURL(string: fileName.resourcePath)
    }
    static var documentDirectoryURL: NSURL? {
        return try? NSFileManager().URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
    }

}
