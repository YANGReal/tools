//
//  NSString+Encoding.m
//  iCareer
//
//  Created by YANGRui on 14-4-22.
//  Copyright (c) 2014年 LJLD. All rights reserved.
//

#import "NSString+Encoding.h"

@implementation NSString (Encoding)
- (NSString *)encoding
{
   // NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding (kCFStringEncodingISOLatin1);
    return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}
@end
