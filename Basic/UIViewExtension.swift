//
//  UIViewExtension.swift
//  MP_ARWedding
//
//  Created by Trương Thắng on 2/20/16.
//  Copyright © 2016 MyPrint. All rights reserved.
//
import UIKit

extension UIView {
    
    func convertToImage() -> UIImage {
        UIGraphicsBeginImageContext(self.bounds.size)
        self.drawViewHierarchyInRect(self.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    func roundCorner(cornerRadius: CGFloat = 4) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat = 6) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.CGPath
        self.layer.mask = mask
        self.layer.masksToBounds = true
    }
    
    func setBorder(lineWidth: CGFloat = 1, color: UIColor = UIColor.colorFromHex(0xBDB4A5, alpha: 1)){
        self.layer.borderWidth = lineWidth
        self.layer.borderColor = color.CGColor
    }
    
    func sortSubviewsByOrder(subviews: UIView...) {
        var subviewsActual = [UIView]()
        for item in subviews {
            if self.subviews == item {
                subviewsActual += [item]
            }
        }
        
        for item in subviewsActual {
            self.addSubview(item)
        }
    }
    
    func addSubviews(views: UIView...) {
        for i in views {
            addSubview(i)
        }
    }
}