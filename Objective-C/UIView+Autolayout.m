//
//  UIView+Autolayout.m
//  MT_Autolayout_ObjC
//
//  Created by Admin on 8/6/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "UIView+Autolayout.h"

typedef NS_ENUM(NSInteger, PinInnerPosition) {
    PinInnerPositionHighLeft,
    PinInnerPositionHighCenter,
    PinInnerPositionHighRight,
    PinInnerPositionMidLeft,
    PinInnerPositionMidRight,
    PinInnerPositionLowLeft,
    PinInnerPositionLowCenter,
    PinInnerPositionLowRight,
};

typedef NS_ENUM(NSInteger, PinOuterPosition) {
    PinOuterPositionBottomLeft,
    PinOuterPositionLowerLeft,
    PinOuterPositionLeft,
    PinOuterPositionHigherLeft,
    PinOuterPositionTopLeft,
    PinOuterPositionLefterTop,
    PinOuterPositionTop,
    PinOuterPositionRighterTop,
    PinOuterPositionTopRight,
    PinOuterPositionHigherRight,
    PinOuterPositionRight,
    PinOuterPositionLowerRight,
    PinOuterPositionBottomRight,
    PinOuterPositionRighterBottom,
    PinOuterPositionBottom,
    PinOuterPositionLefterBottom,
};

#define EQUAL_WIDTH             = "EqualWidth"
#define EQUAL_HEIGHT            = "EqualHeight"
#define INNER_TOP_TO_TOP        = "innerTopToTop"
#define INNER_TRAIL_TO_TRAIL    = "innerTrailToTrail"
#define INNER_BOTTOM_TO_BOTTOM  = "innerBottomToBottom"
#define INNER_LEAD_TO_LEAD      = "innerLeadToLead"
#define CENTER_X_TO_CENTER_X    = "CenterXToCenterX"
#define CENTER_Y_TO_CENTER_Y    = "CenterYToCenterY"
#define OUTER_TOP_TO_TOP        = "outerTopToTop"
#define OUTER_TRAIL_TO_TRAIL    = "outerTrailToTrail"
#define OUTER_BOTTOM_TO_BOTTOM  = "outerBottomToBottom"
#define OUTER_LEAD_TO_LEAD      = "outerLeadToLead"

@implementation UIView (Autolayout)

- (NSLayoutConstraint *)leadToLead:(UIView *)toView space:(CGFloat *)space priority:(CGFloat *)priority {
    if (self.translatesAutoresizingMaskIntoConstraints == true) {
        self.translatesAutoresizingMaskIntoConstraints = false;
    }
    NSLayoutConstraint *constraint;
    if (toView == nil) {
        // Constraint with superview
        
    }
    return constraint;
}

@end
