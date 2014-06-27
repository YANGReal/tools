//
//  YRVideoConvert.m
//  sayburg
//
//  Created by YANGReal on 13-9-17.
//  Copyright (c) 2013年 Sayburg. All rights reserved.
//

#import "YRVideoConvert.h"
#import <AVFoundation/AVFoundation.h>
@implementation YRVideoConvert
{
    NSString *_mp4Path;
   
}
SYNTHESIZE_SINGLETON_FOR_CLASS(YRVideoConvert)

    


- (void)convertVideoToMP4WithURL:(NSURL *)url callBack:(Completion)completion
{
    AVURLAsset *asset = [AVURLAsset URLAssetWithURL:url options:nil];
    AVAssetExportSession *exportSession = [[AVAssetExportSession alloc]initWithAsset:asset
                                                                          presetName:AVAssetExportPresetMediumQuality];
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
    NSString *fileName = [NSString stringWithFormat:@"%@.mp4",[formater stringFromDate:[NSDate date]]];
    _mp4Path = CACH_DOCUMENTS_PATH(fileName);
    exportSession.outputURL = [NSURL fileURLWithPath:_mp4Path];
    exportSession.shouldOptimizeForNetworkUse = YES;//根据网络情况自动优化
    exportSession.outputFileType = AVFileTypeMPEG4;
    [exportSession exportAsynchronouslyWithCompletionHandler:^{
        
        switch ([exportSession status]) {
            case AVAssetExportSessionStatusFailed:
            {
                completion(StatusFailed);
            }
                break;
            case AVAssetExportSessionStatusCompleted:
            {
                completion(StatusSucceed);
            }
                break;
                case AVAssetExportSessionStatusUnknown:
            {
                completion(StatusFailed);
            }
                break;
            default:
            {
                completion(StatusFailed);
            }
                break;
        }
    }];

    
    
}
- (NSString *)getMP4VideoPath
{
    return _mp4Path;
}
- (CGFloat)getMP4VideoSize
{
    NSFileManager * filemanager = [NSFileManager defaultManager];
    if([filemanager fileExistsAtPath:_mp4Path]){
        NSDictionary * attributes = [filemanager attributesOfItemAtPath:_mp4Path error:nil];
        NSNumber *theFileSize;
        if ( (theFileSize = [attributes objectForKey:NSFileSize]) )
            return  [theFileSize intValue]/1024.0;
        else
            return -1.0;
    }
    else
    {
        return -1.0;
    }
}
- (CGFloat)getMP4VideoDurationWithURL:(NSURL *)url
{
    NSDictionary *opts = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO]
                                                     forKey:AVURLAssetPreferPreciseDurationAndTimingKey];
    AVURLAsset *urlAsset = [AVURLAsset URLAssetWithURL:url options:opts];
    float second = 0;
    second = urlAsset.duration.value/urlAsset.duration.timescale;
    return second;

}
@end
