//
//  YRVideoConvert.h
//  sayburg
//
//  Created by YANGReal on 13-9-17.
//  Copyright (c) 2013年 YANGReal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SynthsizeSingleton.h"

typedef enum
{
    StatusFailed = 0,
    StatusSucceed
}ConvertStatus;


typedef void(^Completion)(ConvertStatus status);

@interface YRVideoConvert : NSObject

SYNTHESIZE_SINGLETON_FOR_HEADER(YRVideoConvert)

- (void)convertVideoToMP4WithURL:(NSURL *)url callBack:(Completion)completion;
- (NSString *)getMP4VideoPath;
- (CGFloat)getMP4VideoSize;
- (CGFloat)getMP4VideoDurationWithURL:(NSURL *)url;

@end
