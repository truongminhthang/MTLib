//
//  RadioButton.swift
//  MtoM
//
//  Created by ThangTm on 11/17/15.
//  Copyright © 2015 Framgia. All rights reserved.
//

import UIKit



class RadioButton: UIButton {
    var willHidden : Bool = false
    var otherButton: [RadioButton]?
    weak var delegate : RadioButtonProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init(hiddenFlag: Bool) {
        self.init()
        willHidden = hiddenFlag
    }
    
    var image : UIImage? {
        get{
            if isActive {
                return  UIImage(named: "radioActive")
            } else {
                return UIImage(named: "radioInactive")
            }
        }
    }
    var isActive: Bool = false
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        createImage()
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 35, bottom: 0, right: 0)
        self.layoutIfNeeded()
    }
    
    func createImage() {
        if (self.willHidden == true) {
            return;
        }
        let imageSize = CGSize(width: 25, height: 25)
        let originX =  (frame.height - imageSize.width) * 0.5
        
        if let theImage = image{
            let imageRect = CGRect(origin: CGPoint(x: 0, y: originX), size: imageSize)
            theImage.drawInRect(imageRect)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        
        if delegate?.defaultButtonOrder == nil {
            toggleStage()
            delegate?.didSelectRadioButtonAtFirstTime(self)
        } else {
            if !self.isActive {
                toggleStage()
                
                otherButton?.forEach({ (btn) -> () in
                    if btn.isActive == true {
                        btn.toggleStage()
                    }
                })
                delegate?.didSelectRadioButton(self)
            }
        }
    }
    
    func toggleStage() {
        self.isActive = !self.isActive
        self.setNeedsDisplay()
        
    }
}
