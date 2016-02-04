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
    case updateUser = "user/edit"
    case masterArea = "master/area"
    case pref = "master/pref"
    case areaCount = "job_info/area_count"
    case searchJob = "job_info/search"
    case getJobTypeList = "master/job_code"
    case getSubJobTypeList = "master/job_type_code"
    case getSalaryTypeList = "master/salary_type"
    case getSalaryRangeList = "master/salary_range"
    case downloadPhoto = "photo/"
    case getJobDetail = "job_info/detail/"
    case getListMessages = "chat/receive/"
    case sendMessage = "chat/send"
    case reviewCheck = "review/check/"
    case reviewAction = "review/action/"
}

struct AppSettings {
    var baseUrl : String {
        get {
            return "http://test1.pattoput.com/";
            #if DEBUG
                return "http://test1.pattoput.com/"
            #else
                return "http://mtmap28.xsrv.jp/"
            #endif
        }
    }
    
    func apiUrl(subUrl : SubRequestUrl) -> String {
        print("requesting url:  \(baseUrl + subUrl.rawValue)")
        return baseUrl + subUrl.rawValue
    }
}

extension Double {
    func saveToUserDefaults(withKey key: String) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(self, forKey: key)
        defaults.synchronize()
    }
    static func loadFromUserDefaults(withKey key: String) -> Double {
        let defaults = NSUserDefaults.standardUserDefaults()
        return defaults.doubleForKey(key)
    }
    
}

extension Float {
    func saveToUserDefaults(withKey key: String) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setFloat(self, forKey: key)
        defaults.synchronize()
    }
    static func loadFromUserDefaults(withKey key: String) -> Float {
        let defaults = NSUserDefaults.standardUserDefaults()
        return defaults.floatForKey(key)
    }
}

extension Bool {
    func saveToUserDefaults(withKey key: String) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(self, forKey: key)
        defaults.synchronize()
    }
    static func loadFromUserDefaults(withKey key: String) -> Bool {
        let defaults = NSUserDefaults.standardUserDefaults()
        return defaults.boolForKey(key)
    }
}

extension String {
    func saveToUserDefaults(withKey key: String) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(self, forKey: key)
        defaults.synchronize()
    }
    static func loadFromUserDefaults(withKey key: String) -> String {
        let defaults = NSUserDefaults.standardUserDefaults()
        return defaults.stringForKey(key) ?? ""
    }
    
}

extension NSURL {
    func saveToUserDefaults(withKey key: String) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setURL(self, forKey: key)
        defaults.synchronize()
    }
    static func loadFromUserDefaults(withKey key: String) -> NSURL? {
        let defaults = NSUserDefaults.standardUserDefaults()
        return defaults.URLForKey(key)
    }
    
}

extension NSData {
    func saveToUserDefaults(withKey key: String) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(self, forKey: key)
        defaults.synchronize()
    }
    static func loadFromUserDefaults(withKey key: String) -> NSData? {
        let defaults = NSUserDefaults.standardUserDefaults()
        return defaults.dataForKey(key)
    }
}

extension Int {
    func saveToUserDefaults(withKey key: String) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(self, forKey: key)
        defaults.synchronize()
    }
    static func loadFromUserDefaults(withKey key: String) -> Int {
        let defaults = NSUserDefaults.standardUserDefaults()
        return defaults.integerForKey(key)
    }
}
