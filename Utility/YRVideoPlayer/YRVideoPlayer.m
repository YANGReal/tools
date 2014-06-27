//
//  YRVideoPlayer.m
//  iCareer
//
//  Created by YANGRui on 14-6-26.
//  Copyright (c) 2014年 LJLD. All rights reserved.
//

#import "YRVideoPlayer.h"

@interface YRVideoPlayer ()
@property (strong , nonatomic) NSURL *url;
@end

@implementation YRVideoPlayer

- (id)initWithURL:(id)url
{
    self = [super init];
    if (self)
    {
        if ([url isKindOfClass:[NSString class]])
        {
            self.url = [NSURL URLWithString:url];
        }
        if ([url isKindOfClass:[NSURL class]])
        {
            self.url = (NSURL *)url;
        }
    }
    return self;
}

- (void)playInViewController:(UIViewController *)vc
{
    MPMoviePlayerViewController *MPC= [[MPMoviePlayerViewController alloc] initWithContentURL:_url];
    [MPC.moviePlayer setMovieSourceType:MPMovieSourceTypeFile];
    [MPC.moviePlayer setScalingMode:MPMovieScalingModeAspectFit];
    [MPC.moviePlayer setRepeatMode:MPMovieRepeatModeNone];
    [MPC.moviePlayer setControlStyle:MPMovieControlModeHidden];
    [vc presentMoviePlayerViewControllerAnimated:MPC];
    [MPC.moviePlayer play];

}

@end
