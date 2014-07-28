//
//  AudioVociePlay.h
//
//
//  Created by lyywhg on 13-3-26.
//  Copyright (c) 2013年 . All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

@protocol LWVoicePlayDelegate <NSObject>

- (void)playFinished;

@end

@interface AudioVociePlay : NSObject <AVAudioPlayerDelegate>
{    
    UIBackgroundTaskIdentifier backgroundTimerIdentifier;
}

+(AudioVociePlay *)shareAudioVoicePlay;


@property (retain, nonatomic) AVAudioPlayer *musicPlayer;
@property (assign, nonatomic) id<LWVoicePlayDelegate> sDelegate;


- (void)MusicPlay:(NSString *)tMusicPath;
- (void)MusicStop;

@end
