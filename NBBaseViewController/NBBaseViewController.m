//
//  NBBaseViewController.m
//  iCareer
//
//  Created by YANGRui on 14-2-27.
//  Copyright (c) 2014年 LJLD. All rights reserved.
//

#import "NBBaseViewController.h"

@interface NBBaseViewController ()<MBProgressHUDDelegate>

@end

@implementation NBBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = IP5ORIP4FRAME;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f9f8fd"];
    [self setupLeftBarButtonItem];

    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
}


- (void)setupLeftBarButtonItem
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = RECT(0, 0, 40, 40);
    //[btn setTitle:@"返回" forState:UIControlStateNormal];
//    [btn setBackgroundImage:[UIImage imageFromMainBundleFile:@"back.png"] forState:UIControlStateNormal];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:RECT(0, 8, 24, 24)];
    [imageView setImage:[UIImage imageFromMainBundleFile:@"left_arrow.png"]];

    [btn addSubview:imageView];
    
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)showMBLoding
{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:window];
    hud.animationType = MBProgressHUDAnimationZoom;
    hud.tag = -10001;
    hud.delegate = self;
    hud.darkBlur = YES;
    hud.mode = MBProgressHUDModeIndeterminate;
   // UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:hud];
    [hud show:YES];
}

- (void)hideMBLoding
{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    MBProgressHUD *hud = (MBProgressHUD *)[window viewWithTag:-10001];
    [hud hide:YES];
    //[hud removeFromSuperview];
}

- (void)showMBLodingWithMessage:(NSString *)msg
{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:window];
    hud.animationType = MBProgressHUDAnimationZoom;
    hud.tag = -10001;
    hud.delegate = self;
    hud.darkBlur = YES;
    hud.mode = MBProgressHUDModeText;
    hud.labelText = msg;
    [window addSubview:hud];
    [hud show:YES];
    [hud hide:YES afterDelay:2.0];

}

- (void)showMBCompleteWithMessage:(NSString *)msg
{
    
}

#pragma mark -MBProgressHUDDelegate method

- (void)hudWasHidden:(MBProgressHUD *)hud
{
    [hud removeFromSuperview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
