//
//  UIStoryboardSegueExtension.swift
//  MP_ARWedding
//
//  Created by Trương Thắng on 2/25/16.
//  Copyright © 2016 MyPrint. All rights reserved.
//

import UIKit

extension UIStoryboardSegue {
    var destinationViewControllerIfHaveNavigation: AnyObject {
        get {
            if self.destinationViewController is UINavigationController {
                return (self.destinationViewController as! UINavigationController).topViewController!
            }
            else {
                return self.destinationViewController
            }
        }
    }
}