//
//  YRVideoPlayer.h
//  iCareer
//
//  Created by YANGRui on 14-6-26.
//  Copyright (c) 2014年 LJLD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YRVideoPlayer : NSObject
- (id)initWithURL:(id)url;
- (void)playInViewController:(UIViewController *)vc;
@end
