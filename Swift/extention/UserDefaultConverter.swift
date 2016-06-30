//
//  UserDefaultConverter.swift
//  MP_ARWedding
//
//  Created by Trương Thắng on 2/20/16.
//  Copyright © 2016 MyPrint. All rights reserved.
//

import Foundation

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
        if String.loadFromUserDefaults(withKey: key) != "" {
            defaults.setObject(nil, forKey: key)
        }
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