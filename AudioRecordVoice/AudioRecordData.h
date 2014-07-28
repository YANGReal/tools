//
//  AudioRecordData.h
//
//
//  Created by lyywhg on 13-9-16.
//  Copyright (c) 2013年 . All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 *  私密Audio数据
 */
@interface AudioRecordData : NSObject

@property (nonatomic, copy)   NSString       *audioRecord_name;
@property (nonatomic, assign) NSInteger       audioRecord_pwd;
@property (nonatomic, copy)   NSString       *audioRecord_path;
@property (nonatomic, copy)   NSString       *audioRecord_createTime;
@property (nonatomic, assign) long long       audioRecord_time;
@property (nonatomic, copy)   NSString       *audioRecord_aeskey;

@end
