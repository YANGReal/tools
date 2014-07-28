//
//  AudioRecordVoice.h
//
//
//  Created by lyywhg on 13-6-7.
//  Copyright (c) 2013年 . All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "AudioRecordData.h"

@interface AudioRecordVoice : NSObject <AVAudioRecorderDelegate>

@property (retain, nonatomic) AVAudioRecorder *recorder;
@property (nonatomic, retain) AudioRecordData *audioRecordData;
@property (assign, nonatomic) long long audioRecordTime;

+(AudioRecordVoice *)shareAudioRecordVoice;


- (void)beginRecord;
- (void)beginAudioRecord;
- (void)pauseRecord;
- (void)stopRecord;

@end
