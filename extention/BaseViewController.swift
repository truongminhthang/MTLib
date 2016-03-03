//
//  ViewController.swift
//  ManToManRedo
//
//  Created by Trương Thắng on 1/1/16.
//  Copyright © 2016 Trương Thắng. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    lazy var appSetting = AppSettings()
    lazy var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let mainColor = UIColor.redColor()
    let mainBackgroundColor = UIColor.cyanColor()
    let secondaryColor = UIColor.redColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.dynamicType)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mt_customBarButton(isBackButton isBackButton: Bool, imageFile: String, title: String, handle: String) -> UIBarButtonItem {
        let button = UIButton(type: UIButtonType.Custom)
        button.setTitle(title, forState: UIControlState.Normal)
        button.setImage(UIImage(named: imageFile), forState: UIControlState.Normal)
        button.addTarget(self, action: Selector(handle), forControlEvents: UIControlEvents.TouchUpInside)
        button.sizeToFit()
        let customBarButton = UIBarButtonItem(customView: button)
        if isBackButton {
            navigationItem.leftBarButtonItem = customBarButton
        } else {
            navigationItem.rightBarButtonItem = customBarButton
            
        }
        return customBarButton
    }
    
    func mt_createDefaultButton(title: String, target: String) -> UIButton{
        let button = UIButton()
        button.setTitle(title, forState: UIControlState.Normal)
        button.addTarget(self, action: Selector(target), forControlEvents: UIControlEvents.TouchUpInside)
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        button.setTitleColor(UIColor.cyanColor().colorWithAlphaComponent(0.5), forState: UIControlState.Selected)
        button.titleLabel?.numberOfLines = 0
        //        button.roundCorner()
        return button
    }
    
    func mt_createDefaultLabel() -> UILabel {
        let label = UILabel()
        
        return label
    }
    
    
}

