//
//  YRLoadingIndicator.m
//  sayburg
//
//  Created by YANGReal on 13-11-21.
//  Copyright (c) 2013年 Sayburg. All rights reserved.
//

#import "NBAppDelegate.h"
#import "YRLoadingIndicator.h"
#import "YRIndicator.h"
@implementation YRLoadingIndicator


+(void)showLoadingIndicator
{
    NBAppDelegate *app = [[UIApplication sharedApplication] delegate];
    UIWindow *window = app.window;
    UIView *bgView = [[UIView alloc] initWithFrame:window.bounds];
    bgView.backgroundColor = BLACK_COLOR;
    bgView.alpha = 0.7;
    bgView.tag = -112;
    [window addSubview:bgView];
    
    YRIndicator *indicator = [[[NSBundle mainBundle] loadNibNamed:@"YRIndicator" owner:self options:nil] lastObject];
    indicator.tag = -113;
    indicator.center = bgView.center;
    [window addSubview:indicator];
    [indicator startAnimation];
    
    
}
+(void)dismissLoadingIndicator
{
    
    NBAppDelegate *app = [[UIApplication sharedApplication] delegate];
    UIWindow *window = app.window;

    UIView *bgView = [window viewWithTag:-112];
    [bgView removeFromSuperview];
    YRIndicator *indicator = (YRIndicator *)[window viewWithTag:-113];
    [indicator stopAnimation];
    [indicator removeFromSuperview];
    bgView = nil;
    indicator = nil;
}

@end
