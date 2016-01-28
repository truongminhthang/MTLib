//
//  Utils.swift
//  timeInterval
//
//  Created by Trương Thắng on 1/27/16.
//  Copyright © 2016 Trương Thắng. All rights reserved.
//

import Foundation

extension tm {
    
    func second() -> Int32 {
        return self.tm_sec
    }
    
    func minute() -> Int32 {
        return self.tm_min
    }
    
    func hour() -> Int32 {
        return self.tm_hour
    }
    
    func date() -> Int32 {
        return self.tm_mday
    }
    
    func weekDayEnglish() -> String {
        switch self.tm_wday {
        case 0:
            return "Sunday"
        case 1:
            return "Monday"
        case 2:
            return "Tuesday"
        case 3:
            return "Wednesday"
        case 4:
            return "Thurday"
        case 5:
            return "Friday"
        case 6:
            return "Saturday"
        default:
            return "error"
        }
    }
    
    func weekDayJapanese() -> String {
        switch self.tm_wday {
        case 0:
            return "日"; // Sunday
        case 1:
            return "月"; // Monday
        case 2:
            return "火"; // Tuesday
        case 3:
            return "水"; // Wednesday
        case 4:
            return "木"; // Thursday
        case 5:
            return "金"; // Friday
        case 6:
            return "土"; // Saturday
        default:
            return "error"
        }
    }
    
    func monthDay() -> Int32 {
        return self.tm_mday
    }
    
    func yearDay() -> Int32 {
        return self.tm_yday
    }
    
    func monthNumber() -> Int32 {
        return self.tm_mon + 1
    }
    
    func monthEnglishName() -> String {
        switch self.tm_mon {
        case 0:
            return "January"
        case 1:
            return "February"
        case 2:
            return "March"
        case 3:
            return "April"
        case 4:
            return "May"
        case 5:
            return "June"
        case 6:
            return "July"
        case 7:
            return "August"
        case 8:
            return "September"
        case 9:
            return "Octorber"
        case 10:
            return "November"
        case 11:
            return "December"
        default:
            return "Error"
        }
    }
    
    func toMonthJapaneseName() -> String {
        switch self.tm_mon {
        case 0:
            return "一月"
        case 1:
            return "二月"
        case 2:
            return "三月"
        case 3:
            return "四月"
        case 4:
            return "五月"
        case 5:
            return "六月"
        case 6:
            return "七月"
        case 7:
            return "八月"
        case 8:
            return "九月"
        case 9:
            return "十月"
        case 10:
            return "十一月"
        case 11:
            return "十二月"
        default:
            return "Error"
        }
    }
    
    func year() -> Int32 {
        return self.tm_year + 1900
    }
    
    func timeFromTimeInterval(timeInterval: Double) -> tm {
        var timeInfo = tm()
        var t : time_t = Int(timeInterval)
        gmtime_r(&t, &timeInfo)
        return timeInfo
    }
    
}

struct Utils {
    func dispatchMainAsyncSafe (block: dispatch_block_t) {
        if NSThread.isMainThread() {
            block()
        } else {
            dispatch_async(dispatch_get_main_queue(), block)
        }
    }
    
    func dispatchMainSyncSafe (block: dispatch_block_t) {
        if NSThread.isMainThread() {
            block()
        } else {
            dispatch_sync(dispatch_get_main_queue(), block)
        }
    }
}

extension String {
    func rangeOfSubstring(searchString: String, searchOption: NSStringCompareOptions) -> Range<Index>?{
        let aRange = self.rangeOfString(searchString, options: searchOption, range: self.startIndex ..< self.endIndex, locale: nil)
        return aRange
    }
    
    func rangeInString(compairedString: String, searchOption: NSStringCompareOptions) -> Range<Index>? {
        return compairedString.rangeOfString(self, options: searchOption, range: self.startIndex ..< self.endIndex, locale: nil)
    }
    
    func isValidEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z][A-Z0-9a-z._%+-]*@[A-Za-z0-9][A-Za-z0-9.-]*\\.[A-Za-z]{2,6}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        var aRange : Range<Index>?
        if emailTest.evaluateWithObject(self) {
            aRange = self.rangeOfString(".", options: NSStringCompareOptions.BackwardsSearch, range: self.startIndex ..< self.endIndex, locale: nil)
            if let aRange = aRange {
                let topLevelDomain = self.substringFromIndex(aRange.startIndex).lowercaseString
                var topLevelDomainExample : Set = [
                 ".aero",  ".asia",  ".biz",  ".cat",  ".com",  ".coop",  ".edu",  ".gov",  ".info",  ".int",  ".jobs",  ".mil",  ".mobi",  ".museum",  ".name",  ".net",  ".org",  ".pro",  ".tel",  ".travel",  ".ac",  ".ad",  ".ae",  ".af",  ".ag",  ".ai",  ".al",  ".am",  ".an",  ".ao",  ".aq",  ".ar",  ".as",  ".at",  ".au",  ".aw",  ".ax",  ".az",  ".ba",  ".bb",  ".bd",  ".be",  ".bf",  ".bg",  ".bh",  ".bi",  ".bj",  ".bm",  ".bn",  ".bo",  ".br",  ".bs",  ".bt",  ".bv",  ".bw",  ".by",  ".bz",  ".ca",  ".cc",  ".cd",  ".cf",  ".cg",  ".ch",  ".ci",  ".ck",  ".cl",  ".cm",  ".cn",  ".co",  ".cr",  ".cu",  ".cv",  ".cx",  ".cy",  ".cz",  ".de",  ".dj",  ".dk",  ".dm",  ".do",  ".dz",  ".ec",  ".ee",  ".eg",  ".er",  ".es",  ".et",  ".eu",  ".fi",  ".fj",  ".fk",  ".fm",  ".fo",  ".fr",  ".ga",  ".gb",  ".gd",  ".ge",  ".gf",  ".gg",  ".gh",  ".gi",  ".gl",  ".gm",  ".gn",  ".gp",  ".gq",  ".gr",  ".gs",  ".gt",  ".gu",  ".gw",  ".gy",  ".hk",  ".hm",  ".hn",  ".hr",  ".ht",  ".hu",  ".id",  ".ie",  " No",  ".il",  ".im",  ".in",  ".io",  ".iq",  ".ir",  ".is",  ".it",  ".je",  ".jm",  ".jo",  ".jp",  ".ke",  ".kg",  ".kh",  ".ki",  ".km",  ".kn",  ".kp",  ".kr",  ".kw",  ".ky",  ".kz",  ".la",  ".lb",  ".lc",  ".li",  ".lk",  ".lr",  ".ls",  ".lt",  ".lu",  ".lv",  ".ly",  ".ma",  ".mc",  ".md",  ".me",  ".mg",  ".mh",  ".mk",  ".ml",  ".mm",  ".mn",  ".mo",  ".mp",  ".mq",  ".mr",  ".ms",  ".mt",  ".mu",  ".mv",  ".mw",  ".mx",  ".my",  ".mz",  ".na",  ".nc",  ".ne",  ".nf",  ".ng",  ".ni",  ".nl",  ".no",  ".np",  ".nr",  ".nu",  ".nz",  ".om",  ".pa",  ".pe",  ".pf",  ".pg", ".ph", ".pk", ".pl", ".pm", ".pn", ".pr", ".ps", ".pt", ".pw", ".py", ".qa", ".re", ".ro", ".rs", ".ru", ".rw", ".sa", ".sb", ".sc", ".sd", ".se", ".sg", ".sh", ".si", ".sj", ".sk", ".sl", ".sm", ".sn", ".so", ".sr", ".st", ".su", ".sv", ".sy", ".sz", ".tc", ".td", ".tf", ".tg", ".th", ".tj", ".tk", ".tl", ".tm", ".tn", ".to", ".tp", ".tr", ".tt", ".tv", ".tw", ".tz", ".ua", ".ug", ".uk", ".us", ".uy", ".uz", ".va", ".vc", ".ve", ".vg", ".vi", ".vn", ".vu", ".wf", ".ws", ".ye", ".yt", ".za", ".zm", ".zw"]
                
                if topLevelDomainExample.contains(topLevelDomain) {
                    return true
                }
            }
        }
        return false
    }
    
    
}
