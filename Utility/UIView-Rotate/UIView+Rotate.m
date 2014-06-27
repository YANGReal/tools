//
//  UIView+Rotate.m
//  iCareer
//
//  Created by andy on 14-6-6.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#import "UIView+Rotate.h"

@implementation UIView (Rotate)


-(void)startRotateAnimation
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 4;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = NSIntegerMax;
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];

}

-(void)stopRotateAnimation
{
      [self.layer removeAnimationForKey:@"rotationAnimation"];
}

@end
