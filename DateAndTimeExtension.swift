//
//  DateAndTimeExtension.swift
//  MP_ARWedding
//
//  Created by Trương Thắng on 2/20/16.
//  Copyright © 2016 MyPrint. All rights reserved.
//

import Foundation

extension tm {
    
    func second() -> Int32 {
        return self.tm_sec
    }
    
    func minute() -> Int32 {
        return self.tm_min
    }
    
    func minuteAndSecond() -> String {
        
        return "\(self.minute() < 10 ? "0\(self.minute())" : "\(self.minute())" ):\(self.second() < 10 ? "0\(self.second())" : "\(self.second())")"
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
    
    func timeInfoFromTimeInterval(timeInterval: Double) -> tm {
        var timeInfo = tm()
        var t : time_t = Int(timeInterval)
        gmtime_r(&t, &timeInfo)
        return timeInfo
    }
    
}

extension NSDateFormatter {
    
    class func dateFormatterForFormat(format: String) -> NSDateFormatter {
        let r = NSDateFormatter()
        r.dateFormat = format
        return r
    }
    
    class func onlyYear() -> NSDateFormatter {
        return dateFormatterForFormat("yyyy")
    }
    
    class func YYYMMdd() -> NSDateFormatter {
        return dateFormatterForFormat("yyyy-MM-dd")
    }
    
    class func fulldatetime() -> NSDateFormatter {
        return dateFormatterForFormat("yyyy-MM-dd HH:mm:ss")
    }
}
