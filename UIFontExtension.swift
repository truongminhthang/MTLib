//
//  UIFontExtension.swift
//  MP_ARNewYearIOS
//
//  Created by Tuan Truong on 9/30/15.
//  Copyright © 2015 com.framgia. All rights reserved.
//

import UIKit

extension UIFont {
    func sizeOfString(string: String, constraintedToWidth width: CGFloat) -> CGSize {
        let options = unsafeBitCast(NSStringDrawingOptions.UsesLineFragmentOrigin.rawValue |
            NSStringDrawingOptions.UsesFontLeading.rawValue,
            NSStringDrawingOptions.self)
        
        return NSString(string: string).boundingRectWithSize(CGSize(width: width, height: CGFloat.max),
            options: options,
            attributes: [NSFontAttributeName: self],
            context: nil).size
    }
    
    func sizeOfString(string: String) -> CGSize {
        let options = unsafeBitCast(NSStringDrawingOptions.UsesLineFragmentOrigin.rawValue |
            NSStringDrawingOptions.UsesFontLeading.rawValue,
            NSStringDrawingOptions.self)
        
        return NSString(string: string).boundingRectWithSize(CGSize(width: CGFloat.max, height: CGFloat.max),
            options: options,
            attributes: [NSFontAttributeName: self],
            context: nil).size
    }
    
    func fontSizeThatFitsWidth(width: CGFloat, string: String, minimumFontSize: CGFloat) -> CGFloat? {
        if self.sizeOfString(string).width <= width {
            return self.pointSize
        }
        var font = UIFont(name: self.fontName, size: minimumFontSize)!
        if font.sizeOfString(string).width > width {
            return nil
        }
        else {
            let size = (self.pointSize + minimumFontSize) / 2
            font = UIFont(name: self.fontName, size: size)!
            if font.sizeOfString(string).width < width {
                return size
            }
            else {
                return font.fontSizeThatFitsWidth(width, string: string, minimumFontSize: minimumFontSize)
            }
        }
    }
    
    class func HiraganoKakuProNW3(size:CGFloat)-> UIFont {
        return UIFont(name: "HiraKakuProN-W3", size: size)!
    }
    
    class func HiraganoKakuProNW6(size:CGFloat)-> UIFont {
        return UIFont(name: "HiraKakuProN-W6", size: size)!
    }
}