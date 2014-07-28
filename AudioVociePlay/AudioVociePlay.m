//
//  AudioVociePlay.m
//  
//
//  Created by lyywhg on 13-3-26.
//  Copyright (c) 2013年 . All rights reserved.


#import "AudioVociePlay.h"
//#import "Constant.h"

static AudioVociePlay *audioVoicePlay = nil;


@interface AudioVociePlay ()
@end

@implementation AudioVociePlay

void audioRouteChangeListenerCallback(void *inUserData, AudioSessionPropertyID inPropertyID, UInt32 inPropertyValueSize, const void *inPropertyValue);

#pragma mark-
#pragma mark Init & Dealloc
- (void)dealloc
{
    //移除设备（耳机）插入|拔出检测
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceProximityStateDidChangeNotification object:nil];
    AudioSessionRemovePropertyListenerWithUserData(kAudioSessionProperty_AudioRouteChange,
                                                   audioRouteChangeListenerCallback,
                                                   self);
    [self enableProximityMonitoring:NO];
    [self.musicPlayer stop];
    TT_RELEASE_SAFELY(self.musicPlayer);
    [super dealloc];
}
- (id)init
{
    self = [super init];
    if (self)
    {
        [[AVAudioSession sharedInstance] setDelegate:self];
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
        
        NSError *activationError = nil;
        [[AVAudioSession sharedInstance] setActive:YES error: &activationError];
        //添加设备（耳机）插入|拔出检测
        AudioSessionAddPropertyListener(kAudioSessionProperty_AudioRouteChange,
                                        audioRouteChangeListenerCallback,
                                        self);
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(observerForProximityState:) name:UIDeviceProximityStateDidChangeNotification object:nil];
    }
    return self;
}
+(AudioVociePlay *)shareAudioVoicePlay
{
    @synchronized(self)
    {
        if (audioVoicePlay == nil)
        {
            audioVoicePlay = [[AudioVociePlay alloc] init];
        }
        return audioVoicePlay;
    }
}

//是否要启用屏幕离热源距离侦测
- (void)enableProximityMonitoring:(BOOL)enable
{
    [UIDevice currentDevice].proximityMonitoringEnabled = enable;
}
//侦测系统发出的屏幕与热源距离变化的通知的处理
-(void)observerForProximityState:(NSNotificationCenter *)notification
{
    if ([[UIDevice currentDevice] proximityState] == YES)//靠近 耳机
    {
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    }
    else
    {
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    }
}
//检测耳机是否可用
- (BOOL)hasHeadset
{
#if TARGET_IPHONE_SIMULATOR
    return NO;
#else
    CFStringRef route;
    UInt32 propertySize = sizeof(CFStringRef);
    AudioSessionGetProperty(kAudioSessionProperty_AudioRoute, &propertySize, &route);
    if((route == NULL) || (CFStringGetLength(route) == 0))
    {
        // Silent Mode
        NSLog(@"AudioRoute: SILENT, do nothing!");
    }
    else
    {
        NSString* routeStr = (NSString*)route;
        NSLog(@"AudioRoute: %@", routeStr);
        /* Known values of route:
         * "Headset"
         * "Headphone"
         * "Speaker"
         * "SpeakerAndMicrophone"
         * "HeadphonesAndMicrophone"
         * "HeadsetInOut"
         * "ReceiverAndMicrophone"
         * "Lineout"
         */
        NSRange headphoneRange = [routeStr rangeOfString : @"Headphone"];
        NSRange headsetRange = [routeStr rangeOfString : @"Headset"];
        if (headphoneRange.location != NSNotFound)
        {
            return YES;
        }
        else if(headsetRange.location != NSNotFound)
        {
            return YES;
        }
    }
    return NO;
#endif
}
//监听设备（耳机）插拔回调函数
void audioRouteChangeListenerCallback(void *inUserData, AudioSessionPropertyID inPropertyID, UInt32 inPropertyValueSize, const void *inPropertyValue)
{
    if (inPropertyID != kAudioSessionProperty_AudioRouteChange)
    {
        return;
    }

    CFDictionaryRef routeChangeDictionary = inPropertyValue;
    CFNumberRef routeChangeReasonRef =
    CFDictionaryGetValue(routeChangeDictionary, CFSTR (kAudioSession_AudioRouteChangeKey_Reason));
    SInt32 routeChangeReason;
    CFNumberGetValue (routeChangeReasonRef, kCFNumberSInt32Type, &routeChangeReason);
    AudioVociePlay *_self = (AudioVociePlay *)inUserData;
    //有设备拔出或者插入
//    if (routeChangeReason == kAudioSessionRouteChangeReason_OldDeviceUnavailable
//        || routeChangeReason == kAudioSessionRouteChangeReason_NewDeviceAvailable)
//    {
//        if ([_self hasHeadset])//耳机可用，不启用侦测
//        {
//            [_self enableProximityMonitoring:NO];
//        }
//        else//否则，如果正在播放，则启用
//        {
//            [_self enableProximityMonitoring:YES];
//        }
//    }
}
#pragma mark-
#pragma mark Method
- (void)MusicPlay:(NSString *)tMusicPath
{
    NSURL *pathUrl = [[[NSURL alloc] initFileURLWithPath:tMusicPath] autorelease];

    if (self.musicPlayer.playing == YES)
    {
        return;
    }
    
    //重新初始化
    NSError *error;
    self.musicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:pathUrl error:&error];
    if (error)
    {
        return;
    }
    self.musicPlayer.delegate = self;
    [self.musicPlayer prepareToPlay];
    self.musicPlayer.currentTime = 0.0f;
    [self.musicPlayer play];
    [self enableProximityMonitoring:![self hasHeadset]];
}

- (void)MusicStop
{
    [self enableProximityMonitoring:NO];
    [self.musicPlayer stop];
    TT_RELEASE_SAFELY(self.musicPlayer);
}

#pragma mark-
#pragma mark AVAudioPlayer Delegate
//解码错误
- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error
{
    [self enableProximityMonitoring:NO];
    if (error != nil)
    {
    }
}

//播放完成
-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    [self enableProximityMonitoring:NO];
    [player stop];
    if ((self.sDelegate != nil) && [self.sDelegate respondsToSelector:@selector(playFinished)])
    {
        [self.sDelegate playFinished];
    }
}
//播放被中断
- (void)audioPlayerBeginInteruption:(AVAudioPlayer*)player
{
    [self enableProximityMonitoring:NO];
    [player pause];
}

//针对版本的兼容问题，写了2个代理
//中断结束
- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player withOptions:(NSUInteger)flags //NS_AVAILABLE_IOS(6_0);
{
    [player play];
    [self enableProximityMonitoring:![self hasHeadset]];
}
- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player withFlags:(NSUInteger)flags //NS_DEPRECATED_IOS(4_0, 6_0);
{
    [player play];
    [self enableProximityMonitoring:![self hasHeadset]];
}

@end
