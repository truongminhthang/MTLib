//
//  MTManualLayout.swift
//  Note
//
//  Created by Trương Thắng on 1/8/16.
//  Copyright © 2016 Trương Thắng. All rights reserved.
//

import UIKit
extension UIView {
    
    func mt_innerAlignManual(left: CGFloat, top: CGFloat, right: CGFloat, bottom: CGFloat) {
        self.leadToLead(left)
        print(self.frame)
        self.topToTop(top)
                print(self.frame)
        self.trailToTrail(right)
                print(self.frame)
        self.bottomToBottom(bottom)
                print(self.frame)
    }
    func mt_innerAlignManual(pinTo: PinPosition, space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) {
        switch pinTo {
        case PinPosition.HighLeft:
            return hightLeft(space: space, size: size, offset: offset)
        case PinPosition.HighCenter:
            return hightCenter(space: space, size: size, offset: offset)
        case PinPosition.HighRight:
            return hightRight(space: space, size: size, offset: offset)
        case PinPosition.MidLeft:
            return midLeft(space: space, size: size, offset: offset)
        case PinPosition.MidRight:
            return midRight(space: space, size: size, offset: offset)
        case PinPosition.LowLeft:
            return lowLeft(space: space, size: size, offset: offset)
        case PinPosition.LowCenter:
            return lowCenter(space: space, size: size, offset: offset)
        case PinPosition.LowRight:
            return lowRight(space: space, size: size, offset: offset)
        default:
            break
        }

    }

    
    private func leadToLead(space: CGFloat){
        self.frame.origin.x = space
    }
    
    private func trailToTrail (space: CGFloat) {
        let x = self.frame.origin.x
        self.frame.size.width = superview!.frame.size.width - space - x
    }
    
    private func topToTop (space: CGFloat) {
        self.frame.origin.y = space
    }
    
    private func bottomToBottom (space: CGFloat) {
        let y = self.frame.origin.y
        self.frame.size.height = superview!.frame.height - y - space
    }
    
    private func hightLeft (space space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) {
        self.leadToLead(space + offset.horizontal)
        self.topToTop(space + offset.vertical)
        self.frame.size = size
    }
    
    private func hightCenter (space space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) {
        let x = (superview!.frame.width - size.width) * 0.5
        self.leadToLead(x + offset.horizontal)
        self.topToTop(space + offset.vertical)
        self.frame.size = size
    }
    
    private func hightRight (space space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) {
        let x = superview!.frame.width - size.width - space
        self.leadToLead(x + offset.horizontal)
        self.topToTop(space + offset.vertical)
        self.frame.size = size
    }
    
    private func midLeft (space space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) {
        self.leadToLead(space + offset.horizontal)
        let y = (superview!.frame.height - size.height ) * 0.5
        self.topToTop(y + offset.vertical)
        self.frame.size = size
    }
    
    private func center (size: CGSize, offset: UIOffset = UIOffsetZero) {
        let x = (superview!.frame.width - size.width ) * 0.5
        let y = (superview!.frame.height - size.height) * 0.5
        self.leadToLead(x + offset.horizontal)
        self.topToTop(y + offset.vertical)
            self.frame.size = size
    }
    
    private func midRight (space space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) {
        let x = superview!.frame.width - size.width - space
        self.leadToLead(x + offset.horizontal)
        let y = (superview!.frame.height - size.height ) * 0.5
        self.topToTop(y + offset.vertical)
        self.frame.size = size
    }

    
    private func lowLeft(space space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) {
        self.leadToLead(space + offset.horizontal)
        let y = superview!.frame.height - space - size.height
        self.topToTop(y + offset.vertical)
        self.frame.size = size
    }
    
    private func lowCenter (space space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) {
        let x = (superview!.frame.width - size.width) * 0.5
        let y = (superview!.frame.height - size.height - space)
        self.leadToLead(x + offset.horizontal)
        self.topToTop(y + offset.vertical)
        self.frame.size = size
    }
    
    private func lowRight (space space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) {
        let x = superview!.frame.width - space - size.width
        self.leadToLead(x + offset.horizontal)
        let y = (superview!.frame.height - size.height - space)
        self.topToTop(y + offset.vertical)
        self.frame.size = size
    }
    
    //MARK: - OUTER
    func mt_OuterAlignManual(pinTo: PinOuterPosition, toView v: UIView,space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero){
        switch pinTo {
        case .BottomLeft:
            return bottomLeftFromView(toView: v, gap: space, size: size, offset: offset)
        case .LowerLeft:
            return lowerLeftFromView(toView: v, gap: space, size: size, offset: offset)
        case .Left:
            return leftFromView(toView: v, gap: space, size: size, offset:  offset)
        case .HigherLeft:
            return higherLeftFromView(toView: v, gap: space, size: size, offset: offset)
        case .TopLeft:
            return topLeftFromView(toView: v, gap: space, size: size, offset: offset)
        case .LefterTop:
            return lefterTopFromView(toView: v, gap: space, size: size, offset: offset)
        case .Top:
            return topFromView(toView: v, gap: space, size: size, offset: offset)
        case . RighterTop:
            return righterTopFromView(toView: v, gap: space, size: size, offset: offset)
        case .TopRight:
            return topRightFromView(toView: v, gap: space, size: size, offset: offset)
        case .HigherRight:
            return higherRightFromView(toView: v, gap: space, size: size, offset: offset)
        case .Right:
            return rightFromView(toView: v, gap: space, size: size, offset: offset)
        case .LowerRight:
            return lowerRightFromView(toView: v, gap: space, size: size, offset: offset)
        case .BottomRight:
            return bottomRightFromView(toView: v, gap: space, size: size, offset: offset)
        case .LefterBottom:
            return lefterBottomFromView(toView: v, gap: space, size: size, offset: offset)
        case .Bottom:
            return bottomFromView(toView: v, gap: space, size: size, offset: offset)
        case .RighterBottom:
            return righterBottomFromView(toView: v, gap: space, size: size, offset: offset)
        }
    }
    
    //MARK: - BASE POSITION OUTER
    
    private func bottomLeftFromView (toView v: UIView, gap: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = trailToLead(toView: v, space: -gap + offset.horizontal)
        let constraint2 = topToBottom(toView: v, space: gap + offset.vertical)
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
    }
    
    private func lowerLeftFromView  (toView v: UIView, gap: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = trailToLead(toView: v, space: -gap + offset.horizontal)
        let constraint2 = bottomToBottom(toView: v, space: -gap + offset.vertical)
        
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }
    
    private func leftFromView  (toView v: UIView, gap: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = trailToLead(toView: v, space: -gap + offset.horizontal)
        let constraint2 = centerYToCenterY(toView: v, space: offset.vertical)
        
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        
        return dict
    }
    
    private func higherLeftFromView  (toView v: UIView, gap: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = trailToLead(toView: v, space: -gap + offset.horizontal)
        let constraint2 = topToTop(toView: v, space: gap + offset.vertical)
        
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }
    //MARK: TOP
    private func topLeftFromView  (toView v: UIView, gap: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = trailToLead(toView: v, space: -gap + offset.horizontal)
        let constraint2 = bottomToTop(toView: v, space: -gap + offset.vertical)
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }
    
    private func lefterTopFromView  (toView v: UIView, gap: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = leadToLead(toView: v, space: gap + offset.horizontal)
        let constraint2 = bottomToTop(toView: v, space: -gap + offset.vertical)
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        
        return dict
    }
    
    private func topFromView  (toView v: UIView, gap: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = bottomToTop(toView: v, space: -gap + offset.vertical)
        let constraint2 = centerXToCenterX(toView: v, space: offset.horizontal)
        
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        
        return dict
    }
    private func righterTopFromView  (toView v: UIView, gap: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = trailToTrail(toView: v, space: -gap + offset.horizontal)
        let constraint2 = bottomToTop(toView: v, space: -gap + offset.vertical)
        
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        
        return dict
    }
    //MARK: RIGHT
    private func topRightFromView  (toView v: UIView, gap: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = leadToTrail(toView: v, space: gap + offset.horizontal)
        let constraint2 = bottomToTop(toView: v, space: -gap + offset.vertical)
        
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        
        return dict
    }
    
    private func higherRightFromView  (toView v: UIView, gap: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = leadToTrail(toView: v, space: gap + offset.horizontal)
        let constraint2 = topToTop(toView: v, space: gap + offset.vertical)
        
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        
        return dict
    }
    
    private func rightFromView  (toView v: UIView, gap: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = leadToTrail(toView: v, space: gap + offset.horizontal)
        let constraint2 = centerYToCenterY(toView: v, space: offset.vertical)
        
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        
        return dict
    }
    
    private func lowerRightFromView  (toView v: UIView, gap: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = leadToTrail(toView: v, space: gap + offset.horizontal)
        let constraint2 = bottomToBottom(toView: v, space: -gap + offset.vertical)
        
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }
    
    // MARK: BOTTOM
    
    private func bottomRightFromView  (toView v: UIView, gap: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = leadToTrail(toView: v, space: gap + offset.horizontal)
        let constraint2 = topToBottom(toView: v, space: gap + offset.vertical)
        
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }
    
    private func righterBottomFromView  (toView v: UIView, gap: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = trailToTrail(toView: v, space: -gap + offset.horizontal)
        let constraint2 = topToBottom(toView: v, space: gap + offset.vertical)
        
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }
    
    private func bottomFromView  (toView v: UIView, gap: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = topToBottom(toView: v, space: gap + offset.vertical)
        let constraint2 = centerXToCenterX(toView: v, space: offset.horizontal)
        
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }
    
    
    private func lefterBottomFromView  (toView v: UIView, gap: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = leadToLead(toView: v, space: gap + offset.horizontal)
        let constraint2 = topToBottom(toView: v, space: gap + offset.vertical)
        
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }
    
    
    //MARK: - BASE CONSTRAINT
    private func trailToLead (toView v: UIView? = nil, space: CGFloat,priority: Float = 1000) -> NSLayoutConstraint {
        if self.translatesAutoresizingMaskIntoConstraints == true {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        let constraint :NSLayoutConstraint!
        if let theV = v{
            constraint = NSLayoutConstraint(item: self,
                attribute: NSLayoutAttribute.Trailing,
                relatedBy: NSLayoutRelation.Equal,
                toItem: theV,
                attribute: NSLayoutAttribute.Leading,
                multiplier: 1,
                constant: space)
            constraint.identifier = kConstraintType.outerTrailToLead
        } else {
            constraint = NSLayoutConstraint(item: self,
                attribute: NSLayoutAttribute.Trailing,
                relatedBy: NSLayoutRelation.Equal,
                toItem: superview!,
                attribute: NSLayoutAttribute.Leading,
                multiplier: 1,
                constant: space)
            constraint.identifier = kConstraintType.innerTrailToLead
        }
        
        
        constraint.priority = priority
        superview?.addConstraint(constraint)
        return constraint
    }
    
    private func leadToTrail (toView v: UIView? = nil, space: CGFloat,priority: Float = 1000) -> NSLayoutConstraint {
        if self.translatesAutoresizingMaskIntoConstraints == true {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        let constraint :NSLayoutConstraint!
        if let theV = v{
            constraint = NSLayoutConstraint(item: self,
                attribute: NSLayoutAttribute.Leading,
                relatedBy: NSLayoutRelation.Equal,
                toItem: theV,
                attribute: NSLayoutAttribute.Trailing,
                multiplier: 1,
                constant: space)
            constraint.identifier = kConstraintType.outerLeadToTrail
        } else {
            constraint = NSLayoutConstraint(item: self,
                attribute: NSLayoutAttribute.Leading,
                relatedBy: NSLayoutRelation.Equal,
                toItem: superview!,
                attribute: NSLayoutAttribute.Trailing,
                multiplier: 1,
                constant: space)
            constraint.identifier = kConstraintType.innerLeadToTrail
        }
        
        
        constraint.priority = priority
        superview?.addConstraint(constraint)
        return constraint
    }
    
    private func topToBottom (toView v: UIView? = nil, space: CGFloat, priority: Float = 1000) -> NSLayoutConstraint {
        if self.translatesAutoresizingMaskIntoConstraints == true {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        let constraint :NSLayoutConstraint!
        if let theV = v{
            constraint = NSLayoutConstraint(item: self,
                attribute: NSLayoutAttribute.Top,
                relatedBy: NSLayoutRelation.Equal,
                toItem: theV,
                attribute: NSLayoutAttribute.Bottom,
                multiplier: 1,
                constant: space)
            constraint.identifier = kConstraintType.outerTopToBottom
        } else {
            constraint = NSLayoutConstraint(item: self,
                attribute: NSLayoutAttribute.Top,
                relatedBy: NSLayoutRelation.Equal,
                toItem: superview!,
                attribute: NSLayoutAttribute.Bottom,
                multiplier: 1,
                constant: space)
            constraint.identifier = kConstraintType.innerTopToBottom
        }
        
        constraint.priority = priority
        superview?.addConstraint(constraint)
        return constraint
        
    }
    
    
    private func bottomToTop (toView v: UIView? = nil, space: CGFloat, priority: Float = 1000) -> NSLayoutConstraint {
        if self.translatesAutoresizingMaskIntoConstraints == true {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        let constraint :NSLayoutConstraint!
        if let theV = v{
            constraint = NSLayoutConstraint(item: self,
                attribute: NSLayoutAttribute.Bottom,
                relatedBy: NSLayoutRelation.Equal,
                toItem: theV,
                attribute: NSLayoutAttribute.Top,
                multiplier: 1,
                constant: space)
            constraint.identifier = kConstraintType.outerBottomToTop
        } else {
            constraint = NSLayoutConstraint(item: self,
                attribute: NSLayoutAttribute.Bottom,
                relatedBy: NSLayoutRelation.Equal,
                toItem: superview!,
                attribute: NSLayoutAttribute.Top,
                multiplier: 1,
                constant: space)
            constraint.identifier = kConstraintType.innerBottomToTop
        }
        
        constraint.priority = priority
        superview?.addConstraint(constraint)
        return constraint
    }
    // MARK: - SPLIT VIEW
    func mt_splitVerticallyByViews (views: [UIView], edge: UIEdgeInsets, gap: CGFloat) {
        let container = UIView()
        self.addSubview(container)
        
        container.mt_InnerAlign(edge: edge)
        
        for  v in views {
            container.addSubview(v)
        }
        
        views[0].mt_innerAlign(left: 0, top: 0, right: nil, bottom: 0)
        
        for (i,v) in views.enumerate() {
            if i > 0 {
                v.mt_SetSizeFromView(toView: views[0])
                v.mt_OuterAlign(PinOuterPosition.Right, toView: views[i-1], space: gap, size: nil)
            }
        }
        views.last!.mt_BasicConstraint(BasicConstraintType.TrailToTrail, toView: nil, space: 0)
    }
    
    func mt_splitHorizontallyByViews(views: [UIView], edge: UIEdgeInsets, gap: CGFloat) {
        let container = UIView()
        self.addSubview(container)
        container.mt_InnerAlign(edge: edge)
        for  v in views {
            container.addSubview(v)
        }
        
        views[0].mt_innerAlign(left: 0, top: 0, right: 0, bottom: nil)
        
        for (i,v) in views.enumerate() {
            if i > 0 {
                v.mt_SetSizeFromView(toView: views[0])
                v.mt_OuterAlign(PinOuterPosition.Bottom, toView: views[i-1], space: gap, size: nil)
            }
        }
        views.last!.mt_innerAlign(left: nil, top: nil, right: nil, bottom: 0)
    }
    
    func mt_createVerticalMenu(views: [UIView], edge: UIEdgeInsets, gap: CGFloat, seperateColor: UIColor) {
        func createSeperateView() -> UIView {
            let seperateView = UIView()
            seperateView.backgroundColor = UIColor.clearColor()
            
            let seperateLine = UIView()
            seperateLine.backgroundColor = seperateColor
            
            seperateView.addSubview(seperateLine)
            seperateLine.mt_InnerAlign(PinPosition.Center, space: 0, size: CGSize(width: 2, height: 40))
            return seperateView
        }
        var seperateViews = [UIView]()
        
        let container = UIView()
        self.addSubview(container)
        
        container.mt_InnerAlign(edge: edge)
        
        for  v in views {
            
            container.addSubview(v)
            let seperateView = createSeperateView()
            seperateViews += [seperateView]
            container.addSubview(seperateView)
        }
        seperateViews.last?.removeFromSuperview()
        
        views[0].mt_innerAlign(left: 0, top: 0, right: nil, bottom: 0)
        
        for (i,v) in views.enumerate() {
            if i > 0 {
                v.mt_SetSizeFromView(toView: views[0])
                v.mt_OuterAlign(PinOuterPosition.Right, toView: views[i-1], space: gap, size: nil)
            }
        }
        views.last!.mt_BasicConstraint(BasicConstraintType.TrailToTrail, toView: nil, space: 0)
        
        for index in 0 ..< seperateViews.count - 1 {
            seperateViews[index].mt_innerAlign(left: (0, views[index]), top: (-edge.top, nil), right: (0, views[index + 1]), bottom: (0, nil))
        }
    }
}