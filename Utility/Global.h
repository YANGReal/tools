//
//  Global.h
//  iCareer
//
//  Created by YANGRui on 14-2-27.
//  Copyright (c) 2014年 LJLD. All rights reserved.
//

#ifndef iCareer_Global_h
#define iCareer_Global_h

#pragma mark --导入头文件
#import "AppUtility.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "NSDictionary+JSON.h"
#import "MBProgressHUD.h"
#import "UIColor+HexString.h"
#import "RegexKitLite.h"
#import "UIImage+Loader.h"
#import "UIView+Border.h"
#import "UIView+Joggle.h"
#import "UIView+ModifyFrame.h"
#import "NBNetworkEngine.h"
#import "DBTileButton.h"
#import "NBLoginViewController.h"
#import "NZAlertView.h"
#import "MSDynamicsDrawerViewController.h"
#import "MSDynamicsDrawerStyler.h"
#import "NBAppDelegate.h"
#import "NBNavigationController.h"
#import "MMLocationManager.h"
#import "DXAlertView.h"
#import "ETActivityIndicatorView.h"
#import "UIView+Flip.h"
#import "JSONKit.h"
#import "interfaceFromAndy.h"
#import "YRLoadingIndicator.h"
#import "AttributedLabel.h"
#import "NBCallAlbumOrCamera.h"
#import "PECropViewController.h"
#import "URLInterface.h"
#import "KxMenu.h"
#import "NBTextReplyView.h"
#import "HMSideMenu.h"
#import "NBCallAlbumOrCamera.h"
#import "UINavigationController+SGProgress.h"
#import "NSString+Encoding.h"
#import "MJRefresh/MJRefresh.h"
#import "JSBadgeView.h"
#import "UIImageView+LBBlurredImage.h"
#import "UIView+Rotate.h"
#import "YRVideoPlayer.h"
#pragma mark --定义常用宏

#define IS_FIRST_USE @"is_first_use"
#define REMEMBER_PASS_WORD @"remember_password"
#define USER_NAME @"username"
#define PASS_WORD @"password"
#define UID @"uid"
#define USER_LEVEL @"user_level"
#define USER_SCORE @"user_score"

#define AREA_ID @"areaId"
#define USER_SEX @"user_sex"
#define USER_BIRTH_DATE @"user_birth_date"
#define USER_PHONE_NUMBER @"user_phone_number"
#define USER_EMAIL @"user_email"
#define USER_QQ @"user_qq"
#define USER_REAL_NAME @"user_real_name"

#define USER_COMPANY_NAME  @"user_company_name"
#define USER_INDUSTRY_NAME @"user_industry_name"
#define USER_INDUSTYR_ID   @"user_industry_id"
#define USER_POSITION_NAME @"user_position_name"
#define USER_NICK_NAME     @"user_nick_name"
#define USER_AREA_NAME     @"user_area_name"


/*通知名*/
#define UserDidRegisterNotification  @"UserDidRegisterNotification"
#define UserDidLoginNotification     @"UserDidLoginNotification"
#define UserDidLogoutNotification    @"UserDidLogoutNotification"
/*********************
 几何尺寸
 *********************/
#define ISIP5 ([UIScreen mainScreen].bounds.size.height == 568 ? YES : NO)
#define IP5ORIP4FRAME [UIScreen mainScreen].bounds.size.height == 568 ? CGRectMake(0.0, 0.0, 320.0, 568.0) : CGRectMake(0.0, 0.0, 320.0, 480.0)
#define RECT(x,y,w,h) CGRectMake(x,y,w,h)
#define POINT(x,y) CGPointMake(x,y)
#define NBValue(x,y) [NSValue valueWithCGPoint:CGPointMake(x, y)]
#define SIZE(x,y)   CGSizeMake(x,y)

#define DEVICE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define DEVICE_WIDTH [UIScreen mainScreen].bounds.size.width

#define NAV_HEIGHT 64

#define TABBAR_HEIGHT 49

#define ANIMATION_DURATION 0.2  //动画时长

/*********************
 常用颜色
 *********************/
#define WHITE_COLOR      [UIColor whiteColor]                    //白色
#define BLACK_COLOR      [UIColor blackColor]                    //黑色
#define CLEAR_COLOR      [UIColor clearColor]                    //透明色
#define LIGHT_GRAY       [UIColor colorWithHexString:@"#BFC7DA"] //浅灰色
#define THIN_GRAY        [UIColor colorWithHexString:@"#e4e4e4"] //淡灰色
#define DEEP_GREEN       [UIColor colorWithHexString:@"#0CCABE"] //深绿色
#define LIGHT_GREEN      [UIColor colorWithHexString:@"#20E6D9"] //浅绿色
#define THIN_GREEN       [UIColor colorWithHexString:@"#ebfffe"] //淡绿色
#define ORANGE_COLOR     [UIColor colorWithHexString:@"#f4794f"] //橘黄色
#define LIGHT_ORANGE     [UIColor colorWithHexString:@"#F8A88C"] //浅橘黄色
#define DEEP_BLACK       [UIColor colorWithHexString:@"#354656"] //标题颜色
#define LIGHT_BLACK      [UIColor colorWithHexString:@"#5C6976"] //正文颜色
#define RED_COLOR        [UIColor colorWithHexString:@"#fe6560"] //粉红色

#define TITLE_COLOR      [UIColor colorWithHexString:@"#1f3333"]
#define PLACE_HOLDER_COLOR  [UIColor colorWithHexString:@"#bfc7da"]
#define SUB_TITLE_COLOR     [UIColor colorWithHexString:@"#a1abac"]
#define TEXT_COLOR       [UIColor colorWithHexString:@"#545c5c"]
#define PROMPT_COLOR     [UIColor colorWithHexString:@"#9aa7a8"]
#define BLUE_COLOR       [UIColor colorWithHexString:@"#2c4484"]
//#define TITLE_FONT []

#pragma mark - 数据类型转换

#define IntToString(num)   [NSString stringWithFormat:@"%d",num]
#define FloatToString(num) [NSString stringWithFormat:@"%f",num]





#pragma mark -- 定义APP沙盒路径
/******************************
 定义APP沙盒路径
 ******************************/
#define DOCUMENTPATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define TMPPATH NSTemporaryDirectory()
#define CACHPATH [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define CACH_DOCUMENTS_PATH(fileName) [CACHPATH stringByAppendingPathComponent:fileName]//缓存文件路径
#define DOCUMENTS_PATH(fileName) [DOCUMENTPATH stringByAppendingPathComponent:fileName]//Documents文件夹路径

#pragma mark --定义颜色
/******************************
 定义RGB颜色
 ******************************/
#define RGBColor(r,g,b,a)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a*1.0]


#pragma mark --定义日志输出
/******************************
 定义日志输出模式
 DLog is almost a drop-in replacement for NSLog
 DLog();
 DLog(@"here");
 DLog(@"value: %d", x);
 Unfortunately this doesn't work DLog(aStringVariable); you have to do this instead DLog(@"%@", aStringVariable);
 ******************************/
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#   define ELog(err) {if(err) DLog(@"%@", err)}
#else
#   define DLog(...)
#endif

// ALog always displays output regardless of the DEBUG setting
#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);


#endif
