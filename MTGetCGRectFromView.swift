//
//  MTGetCGRectFromView.swift
//  ManualLayout
//
//  Created by Trương Thắng on 1/18/16.
//  Copyright © 2016 Trương Thắng. All rights reserved.
//

import UIKit

extension CGRect {
    func mt_getCGRectInner(pinTo: PinPosition, space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) -> CGRect {
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
            return CGRectZero
        }
    }
    
    func mt_getCGRectCenter (size: CGSize, offset: UIOffset = UIOffsetZero) -> CGRect  {
        let x = (self.width - size.width) * 0.5 + offset.horizontal
        let y = (self.height - size.height) * 0.5 + offset.vertical
        return CGRect(origin: CGPoint(x: x, y: y), size: size)
    }
    
    func mt_getCGRectInner (left: CGFloat, top: CGFloat, right: CGFloat, bottom: CGFloat) -> CGRect {
        let x = left
        let y = top
        return CGRect(origin: CGPoint(x: x, y: y), size: CGSize(width: self.width - left - right, height: self.height - top - bottom ))
    }
    
    private func hightLeft(space space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) -> CGRect {
        let x = space + offset.horizontal
        let y = space + offset.vertical
        return CGRect(origin: CGPoint(x: x, y: y), size: size)
    }
    
    private func hightCenter(space space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) -> CGRect {
        let x = (self.width - size.width) * 0.5 + offset.horizontal
        let y = space + offset.vertical
        return CGRect(origin: CGPoint(x: x, y: y), size: size)
    }
    
    private func hightRight(space space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) -> CGRect {
        let x = self.width - size.width - space + offset.horizontal
        let y = space + offset.vertical
        return CGRect(origin: CGPoint(x: x, y: y), size: size)
        
    }
    
    private func midLeft(space space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) -> CGRect {
        let x = space + offset.horizontal
        let y = (self.height - size.height) * 0.5 + offset.vertical
        return CGRect(origin: CGPoint(x: x, y: y), size: size)
    }
    
    private func midRight(space space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) -> CGRect {
        let x = self.width - size.width - space + offset.horizontal
        let y = (self.height - size.height) * 0.5 + offset.vertical
        return CGRect(origin: CGPoint(x: x, y: y), size: size)
    }
    
    private func lowLeft(space space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) -> CGRect {
        let x = space + offset.horizontal
        let y = self.height - size.height - space + offset.vertical
        return CGRect(origin: CGPoint(x: x, y: y), size: size)
        
    }
    
    private func lowCenter(space space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) -> CGRect {
        let x = (self.width - size.width) * 0.5 + offset.horizontal
        let y = self.height - size.height - space + offset.vertical
        return CGRect(origin: CGPoint(x: x, y: y), size: size)
    }
    
    private func lowRight(space space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) -> CGRect {
        let x = self.width - size.width - space + offset.horizontal
        let y = self.height - size.height - space + offset.vertical
        return CGRect(origin: CGPoint(x: x, y: y), size: size)
    }
    
}

extension CGRect {
    func mt_getCGRectOuter(pinTo: PinOuterPosition, space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) -> CGRect {
        switch pinTo {
        case .BottomLeft:
            return bottomLeftFromView( space, size: size, offset: offset)
        case .LowerLeft:
            return lowerLeftFromView( space, size: size, offset: offset)
        case .Left:
            return leftFromView( space, size: size, offset:  offset)
        case .HigherLeft:
            return higherLeftFromView( space, size: size, offset: offset)
        case .TopLeft:
            return topLeftFromView( space, size: size, offset: offset)
        case .LefterTop:
            return lefterTopFromView( space, size: size, offset: offset)
        case .Top:
            return topFromView( space, size: size, offset: offset)
        case . RighterTop:
            return righterTopFromView( space, size: size, offset: offset)
        case .TopRight:
            return topRightFromView( space, size: size, offset: offset)
        case .HigherRight:
            return higherRightFromView( space, size: size, offset: offset)
        case .Right:
            return rightFromView( space, size: size, offset: offset)
        case .LowerRight:
            return lowerRightFromView( space, size: size, offset: offset)
        case .BottomRight:
            return bottomRightFromView( space, size: size, offset: offset)
        case .LefterBottom:
            return lefterBottomFromView( space, size: size, offset: offset)
        case .Bottom:
            return bottomFromView( space, size: size, offset: offset)
        case .RighterBottom:
            return righterBottomFromView( space, size: size, offset: offset)
        }
    }
    
    private func bottomLeftFromView ( space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) -> CGRect
    {
        let x = self.origin.x - space - size.width
        let y = self.origin.y + self.size.height + space
        return CGRect(origin: CGPoint(x: x, y: y), size: size)
        
    }
    
    private func lowerLeftFromView  ( space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) -> CGRect
    {
        let x = self.origin.x - space - size.width
        let y = self.origin.y + self.height - size.height - space + offset.vertical
        return CGRect(origin: CGPoint(x: x, y: y), size: size)
        
    }
    
    private func leftFromView  ( space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero)  -> CGRect
    {
        let x = self.origin.x - space - size.width
        let y = self.origin.y + (self.height - size.height) * 0.5 + offset.vertical
        return CGRect(origin: CGPoint(x: x, y: y), size: size)
        
    }
    
    private func higherLeftFromView  ( space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) -> CGRect
    {
        let x = self.origin.x - space - size.width
        let y = self.origin.y + space + offset.vertical
        return CGRect(origin: CGPoint(x: x, y: y), size: size)
    }
    //MARK: TOP
    private func topLeftFromView  ( space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) -> CGRect
    {
        let x = self.origin.x - space - size.width
        let y = self.origin.y - size.height - space
        return CGRect(origin: CGPoint(x: x, y: y), size: size)
    }
    
    private func lefterTopFromView  ( space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) -> CGRect
    {
        let x = self.origin.x + space + offset.horizontal
        let y = self.origin.y - size.height - space
        return CGRect(origin: CGPoint(x: x, y: y), size: size)
        
    }
    
    private func topFromView  ( space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) -> CGRect
    {
        let x = self.origin.x + (self.size.width - size.width) * 0.5
        let y = self.origin.y - size.height - space
        return CGRect(origin: CGPoint(x: x, y: y), size: size)
        
    }
    
    private func righterTopFromView  ( space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) -> CGRect
    {
        let x = self.origin.x + self.width - size.width - space
        
        let y = self.origin.y - size.height - space
        return CGRect(origin: CGPoint(x: x, y: y), size: size)
        
    }
    //MARK: RIGHT
    private func topRightFromView  ( space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) -> CGRect
    {
        let x = self.origin.x + self.size.width + space
        let y = self.origin.y - size.height - space
        return CGRect(origin: CGPoint(x: x, y: y), size: size)
        
        
    }
    
    private func higherRightFromView  ( space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) -> CGRect
    {
        let x = self.origin.x + self.size.width + space
        let y = self.origin.y + space + offset.vertical
        return CGRect(origin: CGPoint(x: x, y: y), size: size)
        
        
    }
    
    private func rightFromView  ( space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) -> CGRect
    {
        let x = self.origin.x + self.size.width + space
        let y = self.origin.y + (self.height - size.height) * 0.5 + offset.vertical
        return CGRect(origin: CGPoint(x: x, y: y), size: size)
        
    }
    
    private func lowerRightFromView  ( space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) -> CGRect
    {
        let x = self.origin.x + self.size.width + space
        let y = self.origin.y + self.height - size.height - space + offset.vertical
        return CGRect(origin: CGPoint(x: x, y: y), size: size)
        
    }
    
    // MARK: BOTTOM
    
    private func bottomRightFromView  (space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) -> CGRect
    {
        let x = self.origin.x + self.size.width + space
        let y = self.origin.y + self.size.height + space
        return CGRect(origin: CGPoint(x: x, y: y), size: size)
        
    }
    
    private func righterBottomFromView  ( space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) -> CGRect
    {
        let x = self.origin.x + self.width - size.width - space
        
        let y = self.origin.y + self.size.height + space
        return CGRect(origin: CGPoint(x: x, y: y), size: size)
        
    }
    
    private func bottomFromView  ( space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) -> CGRect
    {
        let x = self.origin.x + (self.size.width - size.width) * 0.5
        let y = self.origin.y + self.size.height + space
        return CGRect(origin: CGPoint(x: x, y: y), size: size)
        
    }
    
    
    private func lefterBottomFromView  ( space: CGFloat, size: CGSize, offset: UIOffset = UIOffsetZero) -> CGRect
    {
        let x = self.origin.x + space + offset.horizontal
        
        let y = self.origin.y + self.size.height + space
        return CGRect(origin: CGPoint(x: x, y: y), size: size)
        
    }
    
}
