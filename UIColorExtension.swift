//
//  UIColorExtension.swift
//  MP_ARWedding
//
//  Created by Trương Thắng on 2/20/16.
//  Copyright © 2016 MyPrint. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func mainBackgroundColor() -> UIColor {
        return UIColor.colorFromHex(0xC21905, alpha: 1)
    }
    
    class func colorFromHex(hex: UInt32, alpha: CGFloat) -> UIColor {
        let division = CGFloat (255)
        let red =  CGFloat((hex & 0xFF0000) >> 16   ) / division
        let green = CGFloat((hex & 0x00FF00) >> 8   ) / division
        let blue = CGFloat(hex & 0x0000FF           ) / division
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
    }
}