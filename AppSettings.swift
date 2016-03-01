//
//  AppSetting.swift
//  timeInterval
//
//  Created by Trương Thắng on 1/29/16.
//  Copyright © 2016 Trương Thắng. All rights reserved.
//

import Foundation

enum SubRequestUrl : String {
    case registerUser = "user/add"
}

class AppSettings {
    var baseUrl : String {
        get {
            return "http://myprint.framgia.vn";
        }
    }
    
    func apiUrl(subUrl : SubRequestUrl) -> String {
        print("requesting url:  \(baseUrl + subUrl.rawValue)")
        return baseUrl + subUrl.rawValue
    }
    
    var accessToken : String {
        get {
            return String.loadFromUserDefaults(withKey: "accessToken")
        }
        
        set {
            accessToken.saveToUserDefaults(withKey: "accessToken")
        }
    }
}



