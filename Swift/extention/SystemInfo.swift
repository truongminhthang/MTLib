//
//  SystemInfo.swift
//  MP_ARWedding
//
//  Created by Trương Thắng on 2/20/16.
//  Copyright © 2016 MyPrint. All rights reserved.
//
import UIKit
import Foundation

struct SystemInfo {
    func systemVersionEqualTo(version: NSString) -> Bool {
        return UIDevice.currentDevice().systemVersion.compare(version as String,
            options: NSStringCompareOptions.NumericSearch) == NSComparisonResult.OrderedSame
    }
    
    func systemVersionGreaterThan(version: NSString) -> Bool {
        return UIDevice.currentDevice().systemVersion.compare(version as String,
            options: NSStringCompareOptions.NumericSearch) == NSComparisonResult.OrderedDescending
    }
    
    func systemVersionGreaterThanOrEqualTo(version: NSString) -> Bool {
        return UIDevice.currentDevice().systemVersion.compare(version as String,
            options: NSStringCompareOptions.NumericSearch) != NSComparisonResult.OrderedAscending
    }
    
    func systemVersionLessThan(version: NSString) -> Bool {
        return UIDevice.currentDevice().systemVersion.compare(version as String,
            options: NSStringCompareOptions.NumericSearch) == NSComparisonResult.OrderedAscending
    }
    
    func systemVersionLessThanOrEqualTo(version: NSString) -> Bool {
        return UIDevice.currentDevice().systemVersion.compare(version as String,
            options: NSStringCompareOptions.NumericSearch) != NSComparisonResult.OrderedDescending
    }
    
    func systemVersion() -> Int {
        return Int(UIDevice.currentDevice().systemVersion)!
    }
    
    /*func cameraPermission() throws -> Bool {
        let authStatus = AVCaptureDevice.authorizationStatusForMediaType(AVMediaTypeVideo)
        guard authStatus == AVAuthorizationStatus.Denied else {
            throw CameraPermissionError.Denied
        }
        
        guard authStatus == AVAuthorizationStatus.Restricted else {
            throw CameraPermissionError.Restricted
        }
        return true
    }*/
}

/*enum CameraPermissionError: ErrorType {
    case Denied
    case Restricted
}*/
