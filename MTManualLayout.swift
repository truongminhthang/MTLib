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
    
    func alignCenter (size: CGSize, offset: UIOffset = UIOffsetZero) {
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
        let x = v.frame.origin.x - gap - size.width + offset.horizontal
        let y = v.frame.origin.y + v.frame.height + gap + offset.vertical
        self.frame.origin = CGPoint(x: x, y: y)
        self.frame.size = size
    }
    
    private func lowerLeftFromView  (toView v: UIView, gap: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)
    {
        let x = v.frame.origin.x - gap - size.width + offset.horizontal
        let y = v.frame.height + v.frame.origin.y - gap - size.height + offset.vertical
        self.frame.origin = CGPoint(x: x, y: y)
        self.frame.size = size
    }
    
    private func leftFromView  (toView v: UIView, gap: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)
    {
        let x = v.frame.origin.x - gap - size.width + offset.horizontal
        let y = (v.frame.height - size.height ) * 0.5 + v.frame.origin.y + offset.vertical
        self.frame.origin = CGPoint(x: x, y: y)
        self.frame.size = size
    }
    
    private func higherLeftFromView  (toView v: UIView, gap: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)
    {
        let x = v.frame.origin.x - gap - size.width + offset.horizontal
        let y = v.frame.origin.y + gap + offset.vertical
        self.frame.origin = CGPoint(x: x, y: y)
        self.frame.size = size
        
    }
    //MARK: TOP
    private func topLeftFromView  (toView v: UIView, gap: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)
    {
        let x = v.frame.origin.x - gap - size.width + offset.horizontal
        let y = v.frame.origin.y - gap - size.height + offset.vertical
        self.frame.origin = CGPoint(x: x, y: y)
        self.frame.size = size
    }
    
    private func lefterTopFromView  (toView v: UIView, gap: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)
    {
        let x = v.frame.origin.x + gap + offset.horizontal
        let y = v.frame.origin.y - gap - size.height + offset.vertical
        self.frame.origin = CGPoint(x: x, y: y)
        self.frame.size = size

    }
    
    private func topFromView  (toView v: UIView, gap: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)
    {
        let x = (v.frame.width - size.width) * 0.5 + v.frame.origin.x + offset.horizontal
        let y = v.frame.origin.y - gap - size.height + offset.vertical
        self.frame.origin = CGPoint(x: x, y: y)
        self.frame.size = size
    }
    
    private func righterTopFromView  (toView v: UIView, gap: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)
    {
        let x = (v.frame.width + v.frame.origin.x) - gap - size.width + offset.horizontal
        let y = v.frame.origin.y - gap - size.height + offset.vertical
        self.frame.origin = CGPoint(x: x, y: y)
        self.frame.size = size
    }
    //MARK: RIGHT
    private func topRightFromView  (toView v: UIView, gap: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)
    {
        let x = (v.frame.width + v.frame.origin.x) + gap + offset.horizontal
        let y = v.frame.origin.y - gap - size.height + offset.vertical
        self.frame.origin = CGPoint(x: x, y: y)
        self.frame.size = size
       
    }
    
    private func higherRightFromView  (toView v: UIView, gap: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)
    {
        let x = (v.frame.width + v.frame.origin.x) + gap + offset.horizontal
        let y = v.frame.origin.y + gap + offset.vertical
        self.frame.origin = CGPoint(x: x, y: y)
        self.frame.size = size

    }
    
    private func rightFromView  (toView v: UIView, gap: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)
    {
        let x = (v.frame.width + v.frame.origin.x) + gap + offset.horizontal
        let y = v.frame.origin.y + (v.frame.height - size.height) * 0.5 + offset.vertical
        self.frame.origin = CGPoint(x: x, y: y)
        self.frame.size = size

    }
    
    private func lowerRightFromView  (toView v: UIView, gap: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)
    {
        let x = (v.frame.width + v.frame.origin.x) + gap + offset.horizontal
        let y = v.frame.origin.y + (v.frame.height - size.height - gap) + offset.vertical
        self.frame.origin = CGPoint(x: x, y: y)
        self.frame.size = size
    }
    
    // MARK: BOTTOM
    
    private func bottomRightFromView  (toView v: UIView, gap: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)
    {
        let x = (v.frame.width + v.frame.origin.x) + gap + offset.horizontal
        let y = v.frame.origin.y + (v.frame.height + gap) + offset.vertical
        self.frame.origin = CGPoint(x: x, y: y)
        self.frame.size = size

    }
    
    private func righterBottomFromView  (toView v: UIView, gap: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)
    {
        let x = (v.frame.width + v.frame.origin.x) - gap - size.width + offset.horizontal
        let y = v.frame.origin.y + (v.frame.height + gap) + offset.vertical
        self.frame.origin = CGPoint(x: x, y: y)
        self.frame.size = size

    }
    
    private func bottomFromView  (toView v: UIView, gap: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)
    {
        let x = (v.frame.width - size.width) * 0.5 + v.frame.origin.x + offset.horizontal
        let y = v.frame.origin.y + (v.frame.height + gap) + offset.vertical
        self.frame.origin = CGPoint(x: x, y: y)
        self.frame.size = size
    }
    
    
    private func lefterBottomFromView  (toView v: UIView, gap: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)
    {
        let x = v.frame.origin.x + gap + offset.horizontal
        let y = v.frame.origin.y + (v.frame.height + gap) + offset.vertical
        self.frame.origin = CGPoint(x: x, y: y)
        self.frame.size = size
    }
    
    
}