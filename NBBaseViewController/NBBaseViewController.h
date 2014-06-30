//
//  NBBaseViewController.h
//  iCareer
//
//  Created by YANGRui on 14-2-27.
//  Copyright (c) 2014年 LJLD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NBBaseViewController : UIViewController
- (void)back;

- (void)showMBLoding;
- (void)hideMBLoding;

- (void)showMBLodingWithMessage:(NSString *)msg;

//- (void)showMBCompleteWithMessage:(NSString *)msg;

@end
