//
//  StringExtension.swift
//  MP_ARWedding
//
//  Created by Trương Thắng on 2/20/16.
//  Copyright © 2016 MyPrint. All rights reserved.
//
import UIKit

extension String {
    func rangeOfSubstring(searchString: String, searchOption: NSStringCompareOptions) -> Range<Index>?{
        let aRange = self.rangeOfString(searchString, options: searchOption, range: self.startIndex ..< self.endIndex, locale: nil)
        return aRange
    }
    
    func rangeInString(compairedString: String, searchOption: NSStringCompareOptions) -> Range<Index>? {
        return compairedString.rangeOfString(self, options: searchOption, range: self.startIndex ..< self.endIndex, locale: nil)
    }
    
    func isValidEmail() -> Bool {
        let emailRegex : String = "[A-Z0-9a-z][A-Z0-9a-z._%+-]*@[A-Za-z0-9][A-Za-z0-9.-]*\\.[A-Za-z]{2,6}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        var aRange : Range<Index>?
        if emailTest.evaluateWithObject(self) {
            aRange = self.rangeOfString(".", options: NSStringCompareOptions.BackwardsSearch, range: self.startIndex ..< self.endIndex, locale: nil)
            if let aRange = aRange {
                let topLevelDomain = self.substringFromIndex(aRange.startIndex).lowercaseString
                let topLevelDomainExample : Set = [
                    ".aero",  ".asia",  ".biz",  ".cat",  ".com",  ".coop",  ".edu",  ".gov",  ".info",  ".int",  ".jobs",  ".mil",  ".mobi",  ".museum",  ".name",  ".net",  ".org",  ".pro",  ".tel",  ".travel",  ".ac",  ".ad",  ".ae",  ".af",  ".ag",  ".ai",  ".al",  ".am",  ".an",  ".ao",  ".aq",  ".ar",  ".as",  ".at",  ".au",  ".aw",  ".ax",  ".az",  ".ba",  ".bb",  ".bd",  ".be",  ".bf",  ".bg",  ".bh",  ".bi",  ".bj",  ".bm",  ".bn",  ".bo",  ".br",  ".bs",  ".bt",  ".bv",  ".bw",  ".by",  ".bz",  ".ca",  ".cc",  ".cd",  ".cf",  ".cg",  ".ch",  ".ci",  ".ck",  ".cl",  ".cm",  ".cn",  ".co",  ".cr",  ".cu",  ".cv",  ".cx",  ".cy",  ".cz",  ".de",  ".dj",  ".dk",  ".dm",  ".do",  ".dz",  ".ec",  ".ee",  ".eg",  ".er",  ".es",  ".et",  ".eu",  ".fi",  ".fj",  ".fk",  ".fm",  ".fo",  ".fr",  ".ga",  ".gb",  ".gd",  ".ge",  ".gf",  ".gg",  ".gh",  ".gi",  ".gl",  ".gm",  ".gn",  ".gp",  ".gq",  ".gr",  ".gs",  ".gt",  ".gu",  ".gw",  ".gy",  ".hk",  ".hm",  ".hn",  ".hr",  ".ht",  ".hu",  ".id",  ".ie",  " No",  ".il",  ".im",  ".in",  ".io",  ".iq",  ".ir",  ".is",  ".it",  ".je",  ".jm",  ".jo",  ".jp",  ".ke",  ".kg",  ".kh",  ".ki",  ".km",  ".kn",  ".kp",  ".kr",  ".kw",  ".ky",  ".kz",  ".la",  ".lb",  ".lc",  ".li",  ".lk",  ".lr",  ".ls",  ".lt",  ".lu",  ".lv",  ".ly",  ".ma",  ".mc",  ".md",  ".me",  ".mg",  ".mh",  ".mk",  ".ml",  ".mm",  ".mn",  ".mo",  ".mp",  ".mq",  ".mr",  ".ms",  ".mt",  ".mu",  ".mv",  ".mw",  ".mx",  ".my",  ".mz",  ".na",  ".nc",  ".ne",  ".nf",  ".ng",  ".ni",  ".nl",  ".no",  ".np",  ".nr",  ".nu",  ".nz",  ".om",  ".pa",  ".pe",  ".pf",  ".pg", ".ph", ".pk", ".pl", ".pm", ".pn", ".pr", ".ps", ".pt", ".pw", ".py", ".qa", ".re", ".ro", ".rs", ".ru", ".rw", ".sa", ".sb", ".sc", ".sd", ".se", ".sg", ".sh", ".si", ".sj", ".sk", ".sl", ".sm", ".sn", ".so", ".sr", ".st", ".su", ".sv", ".sy", ".sz", ".tc", ".td", ".tf", ".tg", ".th", ".tj", ".tk", ".tl", ".tm", ".tn", ".to", ".tp", ".tr", ".tt", ".tv", ".tw", ".tz", ".ua", ".ug", ".uk", ".us", ".uy", ".uz", ".va", ".vc", ".ve", ".vg", ".vi", ".vn", ".vu", ".wf", ".ws", ".ye", ".yt", ".za", ".zm", ".zw"]
                
                if topLevelDomainExample.contains(topLevelDomain) {
                    return true
                }
            }
        }
        return false
    }
    
    func substringWithTruncateString() {
        
    }
    
    static func isNilOrEmpty(string: String?) -> Bool {
        if let s = string {
            if !s.trim().isEmpty {
                return false
            }
        }
        return true
    }
    
    func trim() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
    
    func uriEncode() -> String {
        let allowedCharacterSet = NSMutableCharacterSet.alphanumericCharacterSet()
        return self.stringByAddingPercentEncodingWithAllowedCharacters(allowedCharacterSet)!
    }
    
    
    
    /**
     Trả về độ cao của String với chiều rộng xác định
     
     - parameter maxWidth: Độ rộng tối đa
     - parameter option: __UsesLineFragmentOrigin__ cho String có nhiều Font trong cùng 1 đoạn ;
     __UsesFontLeading__ sử dụng cho String sử dụng duy nhất 1 font ;
     __UsesDeviceMetrics__ sử dụng trong trường hợp String sử dụng ảnh để thay cho chữ;
     __TruncatesLastVisibleLine__  cắt bớt và thêm dấu ba chấm vào dòng hiển thị cuối cùng nếu. Nếu đoạn chữ không vừa với bounds nào đó. Được bỏ qua nếu LineFragmentOrigin cũng không được set.
     
     */
    
    func height (maxWidth: CGFloat, attributes: [String: AnyObject]) -> CGFloat {
        let sizeOrigin = CGSize(width: maxWidth, height: CGFloat.max)
        
        let attString = NSMutableAttributedString(string: self, attributes: attributes)
        return attString.boundingRectWithSize(sizeOrigin, options: NSStringDrawingOptions.UsesLineFragmentOrigin, context: nil).height
    }
    /**
     Phương thức lấy độ cao tiện dụng
     
     - parameter maxWidth: Độ rộng tối đa
     - parameter fontSize: kích thước của font
     - parameter fontName: tên của font
     
     */
    func height (maxWidth: CGFloat, fontSize: CGFloat, fontName: String) -> CGFloat {
        let font = UIFont(name: fontName, size: fontSize)
        
        if let font = font {
            return self.height(maxWidth, attributes: [NSFontAttributeName : font])
        }
        
        return 0
    }
    
    func height (maxWidth: CGFloat, font: UIFont) -> CGFloat {
        return self.height(maxWidth, attributes: [NSFontAttributeName : font])
    }
    
}

typealias LocalizableString = String

extension LocalizableString {
    func localizableString() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
