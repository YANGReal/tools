//
//  AppUtility.h
//  iCareer
//
//  Created by YANGRui on 14-3-6.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NZAlertView.h"
@interface AppUtility : NSObject

/*根据ViewController获得对应xib的文件名*/
+ (NSString *)getNibNameFromViewController:(NSString *)vc;

/*验证邮箱*/
+ (BOOL)isValidateEmail:(NSString *)email;

/*验证手机号*/
+ (BOOL)isValidateMobile:(NSString *)mobile;

/*验证密码位数*/
+ (BOOL)isValidatePWD:(NSString *) password;

/*计算但当前时间加上多少天后的时间*/
+ (NSDate *)dateAfterDay:(int)day;

/*计算当前时间*/
+ (NSString *)curentDate;

/*从UserDefault获取数据*/
+ (id)getObjectForKey:(NSString *)key;

/*向UserDefault写入数据*/
+ (void)storeObject:(id)obj forKey:(NSString *)key;

/*从UserDefault删除数据*/
+ (void)removeObjectForkey:(NSString *)key;

/*计算给定字符串的高度*/
+ (CGSize)getLabelSizeWithText:(NSString *)text font:(int)fontSize width:(float)width;

/*验证纯数字*/
+ (BOOL)isDightWithText:(NSString *)text;

/*获取字符串的MD5值*/
+ (NSString *)md5String:(NSString *)str;

/*判断网络是否可用*/
+ (BOOL)isNetworkAvaliableShowAlert:(BOOL)show;

/*用户是否登录,没有登录就进入登录界面*/
+ (BOOL)userDidLoginInViewController:(UIViewController *)vc;

+ (BOOL)userDidLogin;

/*获取系统版本*/
+ (NSString *)systemVersion;

/*获取设备型号*/

+ (NSString *)deviceModel;

/*计算给定时间距离当前时间多少年了*/
+ (NSString *)yearsFromDate:(NSString *)date;

+ (void)showNZAlert:(NSString *)message andStyle:(NZAlertStyle)style;

/*获得用户手机上安装的地图app有哪些*/
+ (NSArray *)howManyMapAppsDoYouInstall;

/*对数组中的字典进行排序*/

+ (NSArray *)sortArray:(NSArray *)array byKey:(NSString *)key;

/*获取学历*/
+ (NSString *)getDegreeById:(NSString *)key;
/*获取工作年限*/
+ (NSString *)getWorkYearsById:(NSString *)key;
/*获取公司类型*/
+ (NSString *)getCompanyTypeById:(NSString *)key;
/*获取薪水范围*/
+ (NSString *)getSalaryTypeById:(NSString *)key;

@end
