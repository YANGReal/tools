//
//  AppUtility.m
//  iCareer
//
//  Created by YANGRui on 14-3-6.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#import "AppUtility.h"
#import <CommonCrypto/CommonDigest.h>
#import "Reachability.h"
#include <sys/socket.h>
#import <sys/utsname.h>
@implementation AppUtility

+ (NSString *)getNibNameFromViewController:(NSString *)vc
{
    NSString *nibName;
    if (ISIP5)
    {
        nibName = [NSString stringWithFormat:@"%@_iPhone5",vc];
    }
    else
    {
        nibName = [NSString stringWithFormat:@"%@_iPhone4",vc];
    }
    return nibName;
}

#pragma mark - 验证相关数据
+ (BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    if (![emailTest evaluateWithObject:email]) {
        NZAlertView *alert = [[NZAlertView alloc] initWithStyle:NZAlertStyleError title:@"提示" message:@"邮箱格式不对，请正确输入！"];
        [alert show];
    }
    return [emailTest evaluateWithObject:email];

}
+ (BOOL)isValidateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    if (![phoneTest evaluateWithObject:mobile]) {
        NZAlertView *alert = [[NZAlertView alloc] initWithStyle:NZAlertStyleError title:@"提示" message:@"手机号码位数或者格式不对，请正确输入！"];
        [alert show];
    }
    return [phoneTest evaluateWithObject:mobile];

}

#pragma mark -计算时间

+ (NSDate *)dateAfterDay:(int)day
{
    NSDate * sendDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // Get the weekday component of the current date
    // NSDateComponents *weekdayComponents = [calendar components:NSWeekdayCalendarUnit fromDate:self];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    // to get the end of week for a particular date, add (7 - weekday) days
    [componentsToAdd setDay:day];
    NSDate *dateAfterDay = [calendar dateByAddingComponents:componentsToAdd toDate:sendDate options:0];
    return dateAfterDay;
}

+ (NSString *)curentDate
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *currentDate = [df stringFromDate:[NSDate date]];
    return currentDate;
}


#pragma mark - 存储少量数据
+ (id)getObjectForKey:(NSString *)key
{
    id obj = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    if (obj == nil)
    {
        obj = @"";
    }
    return obj;
}

+ (void)storeObject:(id)obj forKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setObject:obj forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)removeObjectForkey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - 计算文字的高度
+ (CGSize)getLabelSizeWithText:(NSString *)text font:(int)fontSize width:(float)width
{
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    CGSize size = CGSizeMake(width, CGFLOAT_MAX);
    NSDictionary *attr = @{NSFontAttributeName: font};
    return  [text boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}

#pragma mark - 判断输入的字符是不是纯数字
+ (BOOL)isDightWithText:(NSString *)text
{
    for (NSInteger i = 0;i < text.length;i ++)
    {
        char c = [text characterAtIndex:i];
        if (!(c<='9'&&c>='0'))
        {
            return NO;
        }
    }
    return YES;
}


#pragma mark - MD5加密

+ (NSString *)md5String:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), digest );
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
    {
        [result appendFormat:@"%02x", digest[i]];
    }
    
    return result;
}

#pragma mark - 检查网络连接
+ (BOOL)isNetworkAvaliableShowAlert:(BOOL)show
{
     BOOL avaliable = [[Reachability reachabilityForInternetConnection] currentReachabilityStatus]!=NotReachable;
    if (!avaliable)
    {
        if (show)
        {
            NZAlertView *alert = [[NZAlertView alloc] initWithStyle:NZAlertStyleError title:@"提示" message:@"当前无网络,请检查网络连接是否正常"];
            [alert show];
        }
    }
    return avaliable;
}

+ (BOOL)userDidLoginInViewController:(UIViewController *)vc
{
    NSString *uid = [AppUtility getObjectForKey:UID];
    if (uid.length == 0)
    {
        NSString *nibName = [AppUtility getNibNameFromViewController:@"NBLoginViewController"];
        NBLoginViewController *loginVC = [[NBLoginViewController alloc] initWithNibName:nibName bundle:nil];
        [vc.navigationController pushViewController:loginVC animated:YES];
    }
    return uid.length != 0;
}

+ (BOOL)userDidLogin
{
    NSString *uid = [AppUtility getObjectForKey:UID];
    return uid.length !=0;
}


+ (BOOL)isValidatePWD:(NSString *)password
{
    if (password.length < 6) {
        if (password.length == 0) {
            NZAlertView *alert = [[NZAlertView alloc] initWithStyle:NZAlertStyleError title:@"提示" message:@"密码不能为空！"];
            [alert show];
        }
        else
        {
            NZAlertView *alert = [[NZAlertView alloc] initWithStyle:NZAlertStyleError title:@"提示" message:@"请输入6-16位密码"];
            [alert show];
        }
        return NO;
    }
    return YES;
}


/*获取系统版本*/
+(NSString *)systemVersion
{
   return  [[UIDevice currentDevice] systemVersion];

}

/*获取设备型号*/

+(NSString *)deviceModel
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    NSArray *modelArray = @[
                            @"i386",@"x86_64",@"iPhone1,1",@"iPhone1,2",@"iPhone2,1",
                            @"iPhone3,1",@"iPhone3,2",@"iPhone3,3",@"iPhone4,1",@"iPhone5,1",
                            @"iPhone5,2",@"iPhone5,3",@"iPhone5,4",@"iPhone6,1",@"iPhone6,2",
                            @"iPod1,1",@"iPod2,1",@"iPod3,1",@"iPod4,1",@"iPod5,1",
                            @"iPad1,1",@"iPad2,1",@"iPad2,2",@"iPad2,3",@"iPad2,4",
                            @"iPad3,1",@"iPad3,2",@"iPad3,3",@"iPad3,4",@"iPad3,5",
                            @"iPad3,6",@"iPad2,5",@"iPad2,6",@"iPad2,7",@"iPad4,1",
                            @"iPad4,2",@"iPad4,4",@"iPad4,5"
                            ];
    NSArray *modelNameArray = @[
                                @"Simulator", @"Simulator",@"iPhone 2G",@"iPhone 3G",@"iPhone 3GS",
                                @"iPhone 4(GSM)",@"iPhone 4(GSM Rev A)",@"iPhone 4(CDMA)",@"iPhone 4s",
                                @"iPhone 5(GSM)",@"iPhone 5(GSM+CDMA)",@"iPhone 5c(GSM)",@"iPhone 5c(Global)",
                                @"iPhone 5s(GSM)",@"iPhone 5s(Global)",@"iPod Touch 1G",@"iPod Touch 2G",
                                @"iPod Touch 3G",@"iPod Touch 4G",@"iPod Touch 5G",@"iPad",
                                @"iPad 2(WiFi)",@"iPad 2(GSM)",@"iPad 2(CDMA)",@"iPad 2(WiFi + New Chip)",
                                @"iPad 3(WiFi)",@"iPad 3(GSM+CDMA)",@"iPad 3(GSM)",@"iPad 4(WiFi)",
                                @"iPad 4(GSM)",@"iPad 4(GSM+CDMA)",@"iPad mini (WiFi)",@"iPad mini (GSM)",
                                @"iPad mini (GSM+CDMA)",@"iPad Air (A1474)",@"iPad Air (A1475)",@"iPad mini 2(A1489)",
                                @"iPad mini 2(1452)"
                                ];
    NSInteger modelIndex = - 1;
    NSString *modelNameString = @"New Device";
    modelIndex = [modelArray indexOfObject:deviceString];
    if (modelIndex >= 0 && modelIndex < [modelNameArray count])
    {
        modelNameString = [modelNameArray objectAtIndex:modelIndex];
    }
    return modelNameString;
}

+ (NSString *)yearsFromDate:(NSString *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    NSString *current = [formatter stringFromDate:[NSDate date]];
    DLog(@"current = %@",current);
    int interval = current.intValue - date.intValue;
    return [NSString stringWithFormat:@"%d",interval];
    
}

+ (void)showNZAlert:(NSString *)message andStyle:(NZAlertStyle)style
{
    NZAlertView *alert = [[NZAlertView alloc] initWithStyle:style title:@"提示" message:message];
    [alert show];
}

+ (NSArray *)howManyMapAppsDoYouInstall
{
    NSArray *mapSchemeArr = @[@"comgooglemaps://",@"iosamap://navi",@"baidumap://map/"];
    NSMutableArray *appListArr = [[NSMutableArray alloc] initWithObjects:@"苹果地图", nil];
    for (int i = 0; i < mapSchemeArr.count; i++)
    {
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[mapSchemeArr objectAtIndex:i]]]]) {
            if (i == 0)
            {
                [appListArr addObject:@"谷歌地图"];
            }
            else if (i == 1)
            {
                [appListArr addObject:@"高德地图"];
            }
            else if (i == 2)
            {
                [appListArr addObject:@"百度地图"];
            }
        }
    }
    return appListArr;
}

+ (NSArray *)sortArray:(NSArray *)array byKey:(NSString *)key
{
    return  [array sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSDictionary *dict1 = (NSDictionary *)obj1;
        NSDictionary *dict2 = (NSDictionary *)obj2;
        NSNumber *num1 = [dict1 objectForKey:key];
        NSNumber *num2 = [dict2 objectForKey:key];
        if ([num1 isEqual:[NSNull null]])
        {
            num1 = @1;
        }
        if ([num2 isEqual:[NSNull null]])
        {
            num2 = @1;
        }
        return [num1 compare:num2];
    }];
}

+ (NSString *)getDegreeById:(NSString *)key
{
    NSDictionary *dict = @{@"1": @"高中以下",@"2":@"高中",@"3":@"中专/技校",
                           @"4":@"大专",@"5": @"本科",@"6": @"硕士",
                           @"7":@"博士",@"8":@"MBA/EMBA"};
    return dict[key];
}

+ (NSString *)getWorkYearsById:(NSString *)key
{
    NSDictionary *dict = @{@"1":@"在读学生",@"2":@"应届毕业生",@"3":@"一年以上",
                           @"4": @"两年以上",@"5": @"三年以上",@"6": @"五年以上",
                           @"7": @"八年以上",@"8": @"十年以上"};
    return dict[key];
}

+ (NSString *)getCompanyTypeById:(NSString *)key
{
    NSDictionary *dict = @{@"1":@"外资(欧美)",@"2":@"外资(非欧美)",@"3":@"合资(欧美)",
                           @"4": @"合资(非欧美)",@"5": @"国企",@"6": @"民营公司",
                           @"7": @"外企代表处",@"8": @"政府机关",@"9": @"事业单位",
                           @"10": @"非盈利机构",@"11": @"其它性质"};
    return dict[key];
}

+ (NSString *)getSalaryTypeById:(NSString *)key
{
    NSDictionary *dict = @{@"1":@"1500以下",@"2":@"1500~1999",@"3": @"2000~2999",
                           @"4": @"3000~4499",@"5": @"4500~5999",@"6": @"6000~7999",
                           @"7": @"8000~9999",@"8": @"10000~14999",@"9": @"15000~19999",
                           @"10": @"20000~29999",@"11": @"30000~49999",@"12": @"50000以上",
                           @"13":@"50000以上",@"0":@"1500以下"};
    return dict[key];
}


@end
