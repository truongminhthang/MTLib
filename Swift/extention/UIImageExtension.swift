//
//  UIImageExtension.swift
//  MP_ARWedding
//
//  Created by Trương Thắng on 2/20/16.
//  Copyright © 2016 MyPrint. All rights reserved.
//

import UIKit

extension UIImage {
    
    func crop(frame: CGRect) -> UIImage? {
        let imageRef = CGImageCreateWithImageInRect(self.CGImage, frame)
        if let imageRef = imageRef {
            let croppedImage = UIImage(CGImage: imageRef)
            return croppedImage
        }
        return nil
    }
    
    func resize(size: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size)
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        self.drawInRect(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}