//
//  ActionSheet.swift
//  MP_ARWedding
//
//  Created by Trương Thắng on 2/25/16.
//  Copyright © 2016 MyPrint. All rights reserved.
//

import UIKit

@objc protocol ActionSheetDelegate: class {
    func onClickActionSheetCancel (sender: AnyObject?)
    func onClickActionSheetDone(sender: AnyObject?)
    func actionSheetWillShow(sender: AnyObject?)
    func actionSheetDidHide(sender: AnyObject?)
}

class ActionSheet: UIView {
    
    private var hasBackgroundButton      : Bool         = false
    private var hasToolBar               : Bool         = false
    private var isActive                 : Bool         = false
    private var bodySize                 : CGSize       = CGSizeZero
    private var backgroundButton         : UIButton!
    private var bodyView                 : UIView       = UIView()
    private var toolBar                  : UIToolbar!
    
    private var pluginView                      : UIView         = UIView()
    weak var delegate                    : ActionSheetDelegate?
    static let windowBounds        = AppDelegate.shareInstance.window!.bounds
    static let kToolBarHeight           : CGFloat      = 40
    
    static func getActionSheetSize(hasBackgroundButton: Bool, bodySize: CGSize) -> CGRect {
        
        if hasBackgroundButton {
            return AppDelegate.shareInstance.window!.bounds
        } else {
            let w = windowBounds.width
            let h = bodySize.height
            
            return windowBounds.mt_getCGRectInner(PinPosition.LowCenter, space: 0, size: CGSize(width: w, height: h))
        }
    }
    
    static func getBodySize(hasBackgroundButton: Bool, hasToolBar: Bool, pluginView: UIView) -> CGSize {
        var w       : CGFloat
        var h       : CGFloat
        if hasBackgroundButton {
            w          = windowBounds.size.width - 8
        } else {
            w           = windowBounds.size.width
        }
        
        if hasToolBar {
            h           = pluginView.frame.height + kToolBarHeight
        } else {
            h           = pluginView.frame.height
        }
        return CGSize(width: w, height: h)
    }
    
    init(hasBackgroundButton: Bool, hasToolBar: Bool, pluginView: UIView, delegate: ActionSheetDelegate?)
    {
        self.hasBackgroundButton        = hasBackgroundButton
        self.hasToolBar                 = hasToolBar
        self.pluginView                 = pluginView
        self.delegate                   = delegate
        self.bodySize                   = ActionSheet.getBodySize(hasBackgroundButton, hasToolBar: hasToolBar, pluginView: pluginView)
        let actionSheetBounds           = ActionSheet.getActionSheetSize(hasBackgroundButton, bodySize: bodySize)
        super.init(frame: actionSheetBounds)
        layoutBackgroundButtonIfneed()
        layoutBodyActionSheet()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutBackgroundButtonIfneed() {
        guard hasBackgroundButton else {
            print("\(self.dynamicType):Action sheet has no background button")
            return
        }
        backgroundButton                    = UIButton()
        backgroundButton.backgroundColor    = UIColor.grayColor().colorWithAlphaComponent(0.5)
        backgroundButton.addTarget(self, action: "hide", forControlEvents: UIControlEvents.TouchUpInside)
        backgroundButton.frame              = self.bounds
        self.addSubview(backgroundButton)
        
    }
    
    private func layoutBodyActionSheet() {
        bodyView.backgroundColor            = UIColor.whiteColor()
        bodyView.frame                      = self.bounds.mt_getCGRectInner(PinPosition.LowCenter, space: -(bodySize.height + 5) , size: bodySize)
        bodyView.roundCorners([UIRectCorner.TopLeft, UIRectCorner.TopRight])
        self.addSubview(bodyView)
        layoutToolBarIfNeed()
        layoutPluginView()
    }
    
    private func layoutToolBarIfNeed() {
        guard hasToolBar else {
            print("\(self.dynamicType):Action sheet has no toolBar")
            return
        }
        
        toolBar = UIToolbar()
        let flextToolBarButton  = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: self, action: nil)
        
        let leftToolBarButton   = UIBarButtonItem(title: "   Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("onClickCancel"))
        
        let rightToolBarButton  = UIBarButtonItem(title: "Done   " , style: UIBarButtonItemStyle.Plain, target: self, action: Selector("onClickDone"))
        
        toolBar.items           = []
        toolBar.items           = [leftToolBarButton,flextToolBarButton,rightToolBarButton]
        toolBar.frame           = bodyView.frame.mt_getCGRectInner(PinPosition.HighCenter, space: 0, size: CGSize(width: bodyView.frame.width, height: ActionSheet.kToolBarHeight))
        
        bodyView.addSubview(toolBar)
        bodyView.clipsToBounds  = true
    }
    
    func layoutPluginView() {
        bodyView.addSubview(pluginView)
        pluginView.mt_innerAlignManual(PinPosition.LowCenter, space: 0, size: CGSize(width: bodyView.frame.width, height: pluginView.bounds.height))
        
    }
}

// MARK: - handle action

extension ActionSheet {
    
    func willShow() {
        delegate?.actionSheetWillShow(self)
    }
    
    func show() {
        guard !isActive else {
            return
        }
        AppDelegate.shareInstance.window?.addSubview(self)
        UIView.animateWithDuration(0.35, animations: showAnimationTranslateTo, completion: showAnimationDidComplete)
    }
    
    func hide() {
        guard isActive else {
            return
        }
        
        UIView.animateWithDuration(0.35, animations: hideAnimationTranslateTo, completion: hideAnimationDidComplete)
    }
    
    func onClickCancel() {
        hide()
        delegate?.onClickActionSheetCancel(self)
    }
    
    func onClickDone() {
        hide()
        delegate?.onClickActionSheetDone(self)
    }
    
    private func showAnimationTranslateTo() {
        bodyView.mt_innerAlignManual(PinPosition.LowCenter, space: 0 , size: bodySize)
    }
    
    private func showAnimationDidComplete(hasCompeleted: Bool) {
        isActive = !isActive
    }
    
    
    
    private func hideAnimationTranslateTo() {
        bodyView.mt_innerAlignManual(PinPosition.LowCenter, space: -(bodySize.height + 5) , size: bodySize)
    }
    
    private func hideAnimationDidComplete(hasCompeleted: Bool) {
        isActive = !isActive
        delegate?.actionSheetDidHide(self)
        self.removeFromSuperview()
    }
}



    