//
//  YRIndicator.m
//  sayburg
//
//  Created by YANGReal on 13-11-21.
//  Copyright (c) 2013年 somilk. All rights reserved.
//

#import "YRIndicator.h"

@interface YRIndicator ()
{
    IBOutlet UIImageView *circleView;
}
@end

@implementation YRIndicator

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(void)startRotateAnimation
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 2;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = NSIntegerMax;
    [circleView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}
-(void)stopRotateAnimation
{
    [circleView.layer removeAnimationForKey:@"rotationAnimation"];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
