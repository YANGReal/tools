//
//  NBResumeHeaderView.h
//  iCareer
//
//  Created by YANGRui on 14-6-25.
//  Copyright (c) 2014年 LJLD. All rights reserved.
//

#import <UIKit/UIKit.h>


@class NBResumeHeaderView;

@protocol NBResumeHeaderViewDelegate <UIScrollViewDelegate>

@optional

- (void)resumeHeader:(NBResumeHeaderView *)view
        didClickTakePictureBtn:(UIButton *)sender;

- (void)resumeHeader:(NBResumeHeaderView *)view
        didClickOpenPhotoLibraryBtn:(UIButton *)sender;

- (void)resumeHeader:(NBResumeHeaderView *)view
        didClickCaptureVideoBtn:(UIButton *)sender;

- (void)resumeHeader:(NBResumeHeaderView *)view
        didClickChooseVideoBtn:(UIButton *)sender;

- (void)resumeHeader:(NBResumeHeaderView *)view
  didClickConfirmBtn:(UIButton *)sender;

- (void)resumeHeader:(NBResumeHeaderView *)view
     didClickPlayBtn:(UIButton *)sender;
@end


@interface NBResumeHeaderView : UIScrollView
@property (assign , nonatomic) id<NBResumeHeaderViewDelegate>delegate;


- (void)showPictureWithImage:(UIImage *)image;

- (void)showVideoWithImage:(UIImage *)image;


@end
