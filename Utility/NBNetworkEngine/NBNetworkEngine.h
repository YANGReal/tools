//
//  NBNetworkEngine.h
//  iCareer
//
//  Created by YANGRui on 14-2-27.
//  Copyright (c) 2014年 LJLD. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CompleteHander)(id jsonObject,BOOL success);

typedef void(^ProgressHander)(double percent);

@interface NBNetworkEngine : NSObject

+ (void)loadDataWithURL:(NSString *)url params:(NSDictionary *)params completeHander:(CompleteHander)callBack;

+ (void)loadDataWithURL:(NSString *)url completeHander:(CompleteHander)callBack;

+ (void)uploadDataWithURL:(NSString *)url params:(NSDictionary *)params file:(NSString *)fileURL  completeHander:(CompleteHander)callBack progressHander:(ProgressHander)handler;


@end
