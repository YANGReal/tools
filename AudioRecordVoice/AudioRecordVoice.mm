//
//  AudioRecordVoice.m
//
//
//  Created by lyywhg on 13-6-7.
//  Copyright (c) 2013年 . All rights reserved.
//

#import "AudioRecordVoice.h"
#import "DefineConstant.h"
#import "TimeHelper.h"
#import "GetSettingsData.h"
#import "DocumentsManage.h"
#import "PrivateDocFileManager.h"
#import "SegmentEncryptData.h"

static AudioRecordVoice *audioRecordVoice = nil;


@interface AudioRecordVoice ()

@property (retain, nonatomic) NSString *musicName;
@property (retain, nonatomic) NSString *musicPath;
@property (retain, nonatomic) NSTimer *timer;

@end

@implementation AudioRecordVoice
#pragma Init & Dealloc
- (id)init
{
    self = [super init];
    if (self)
    {
    }
    return self;
}
- (void)dealloc
{
    TT_RELEASE_SAFELY(_audioRecordData);
    TT_RELEASE_SAFELY(_recorder);
    TT_INVALIDATE_TIMER(_timer);
    
    [super dealloc];
}
#pragma Init & Add
- (AudioRecordData *)audioRecordData
{
    if (!_audioRecordData)
    {
        _audioRecordData = [[AudioRecordData alloc] init];
    }
    return _audioRecordData;
}

#pragma mark-
#pragma mark Init
- (void)initRecorder
{
    AVAudioSession *audioSession = [[AVAudioSession sharedInstance] retain];
    [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error: nil];
    [audioSession setActive:YES error: nil];
    
    NSString *createTime = [TimeHelper GetCurrentTimeStr];
    NSString *voiceName = [NSString stringWithFormat:@"%@.wav",createTime];
    NSString *hunxiaoName = [[PrivateDocFileManager sharePrivateDocFileManager] fileOrFolderName:voiceName];
    
    _musicPath = [NSString stringWithFormat:@"%@%@", PRIVATEAUDIOPATH, hunxiaoName];
    _musicName = voiceName;

    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@%@", PRIVATEAUDIOPATH, _musicName]];
    
    self.audioRecordData.audioRecord_name = _musicName;
    self.audioRecordData.audioRecord_path = _musicPath;
    self.audioRecordData.audioRecord_pwd = [[GetSettingsData shareSetting] GetCurrentPasswordID];
    self.audioRecordData.audioRecord_createTime = createTime;
    
    NSError *error;
    if (_recorder != nil)
    {
        [_recorder stop];
        TT_RELEASE_SAFELY(_recorder);
    }
    _recorder = [[AVAudioRecorder alloc] initWithURL:url settings:[self setVoiceQuality] error:&error];
    _recorder.meteringEnabled = YES;
    _recorder.delegate = self;
}
- (void)initAudioRecorder
{
    AVAudioSession *audioSession = [[AVAudioSession sharedInstance] retain];
    [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error: nil];
    [audioSession setActive:YES error: nil];
    
    NSString *createTime = [TimeHelper GetCurrentTimeStr];
    NSString *voiceName = [NSString stringWithFormat:@"%@.wav",createTime];
    NSString *hunxiaoName = [[PrivateDocFileManager sharePrivateDocFileManager] fileOrFolderName:voiceName];
    
    _musicPath = [NSString stringWithFormat:@"%@%@", PRIVATEAUDIOBOXPATH, voiceName];
    _musicName = voiceName;
    
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@%@", PRIVATEAUDIOBOXPATH, _musicName]];
    
    self.audioRecordData.audioRecord_name = _musicName;
    self.audioRecordData.audioRecord_path = _musicPath;
    self.audioRecordData.audioRecord_pwd = [[GetSettingsData shareSetting] GetCurrentPasswordID];
    self.audioRecordData.audioRecord_createTime = createTime;
    
    NSError *error;
    if (_recorder != nil)
    {
        [_recorder stop];
        TT_RELEASE_SAFELY(_recorder);
    }
    _recorder = [[AVAudioRecorder alloc] initWithURL:url settings:[self setVoiceQuality] error:&error];
    _recorder.meteringEnabled = YES;
    _recorder.delegate = self;
}
+(AudioRecordVoice *)shareAudioRecordVoice
{
    @synchronized(self)
    {
        if (audioRecordVoice == nil)
        {
            audioRecordVoice = [[AudioRecordVoice alloc] init];
        }
        return audioRecordVoice;
    }

}
#pragma mark-
#pragma mark Record
- (void)beginRecord
{
    [self initRecorder];
    if ([_recorder prepareToRecord])
    {
        _audioRecordTime = 0;
        [_recorder record];
        [_recorder updateMeters];
    }

    //创建录音文件，准备录音
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(autoCountTime) userInfo:nil repeats:YES];
}

- (void)beginAudioRecord
{
    [self initAudioRecorder];
    if ([_recorder prepareToRecord])
    {
        _audioRecordTime = 0;
        [_recorder record];
        [_recorder updateMeters];
    }
    //创建录音文件，准备录音
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(autoCountTime) userInfo:nil repeats:YES];
}

- (void)pauseRecord
{
    if (_recorder != nil)
    {
        [_recorder pause];
        TT_INVALIDATE_TIMER(_timer);
    }
}
- (void)continueRecord
{
    if ([_recorder prepareToRecord])
    {
        [_recorder record];
        [_recorder updateMeters];
    }
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(autoCountTime) userInfo:nil repeats:YES];
}
- (void)stopRecord
{
    self.audioRecordData.audioRecord_time = _audioRecordTime;
    self.audioRecordData.audioRecord_aeskey = [EncryptData GenAES128bitSessionKey];
        
    _audioRecordTime = 0;
    [_recorder stop];
    TT_RELEASE_SAFELY(_recorder);
    TT_INVALIDATE_TIMER(_timer);
}

#pragma mark-
#pragma mark Record Setting
- (NSDictionary *)setVoiceQuality
{
    NSDictionary *settings = @{
                            AVSampleRateKey:@8000.0,
                              AVFormatIDKey:[NSNumber numberWithInt: kAudioFormatLinearPCM],
                     AVLinearPCMBitDepthKey:@16,
                      AVNumberOfChannelsKey:@1,
                  AVLinearPCMIsBigEndianKey:@NO,
                      AVLinearPCMIsFloatKey:@NO,
                   AVEncoderAudioQualityKey:[NSNumber numberWithInt: AVAudioQualityMedium]
                               };
    return settings;
}
- (void)autoCountTime
{
    _audioRecordTime = _audioRecordTime + 1;
}

@end
