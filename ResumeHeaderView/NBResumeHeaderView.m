//
//  NBResumeHeaderView.m
//  iCareer
//
//  Created by YANGRui on 14-6-25.
//  Copyright (c) 2014年 LJLD. All rights reserved.
//

#import "NBResumeHeaderView.h"


@interface NBResumeHeaderView ()
@property (weak , nonatomic) IBOutlet UIView *leftView;
@property (weak , nonatomic) IBOutlet UIView *rightView;
@property (weak , nonatomic) IBOutlet UIView *centerView;

@property (weak , nonatomic) IBOutlet UIButton *pictureBtn;
@property (weak , nonatomic) IBOutlet UIButton *videoBtn;

@property (weak , nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak , nonatomic) IBOutlet UIButton *confirmBtn;

@property (weak , nonatomic) IBOutlet UILabel *label1,*label2;

@property (weak , nonatomic) IBOutlet UIImageView *mediaView;
@property (weak , nonatomic) IBOutlet UIButton *playBtn;


- (IBAction)leftBtnClicked:(id)sender;
- (IBAction)rightBtnClicked:(id)sender;

- (IBAction)takePicture:(id)sender;
- (IBAction)openPhotoLibrary:(id)sender;


- (IBAction)captureVideo:(id)sender;

- (IBAction)chooseVideo:(id)sender;


- (IBAction)cancelBtnClicked:(id)sender;
- (IBAction)confirmBtnClicked:(id)sender;

- (IBAction)playBtnClicked:(id)sender;

@end

@implementation NBResumeHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.backgroundColor = CLEAR_COLOR;
    self.contentSize = SIZE(320*2+200, 117);
    self.leftView.backgroundColor = [UIColor colorWithHexString:@"#000000"
                                                          alpha:0.5];;
    self.rightView.backgroundColor = _leftView.backgroundColor;
    self.centerView.backgroundColor = [UIColor colorWithHexString:@"#000000"
                                                            alpha:0.7];
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftSwip:)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.leftView addGestureRecognizer:leftSwipe];
   
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightSwipe:)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.rightView addGestureRecognizer:rightSwipe];
    
    self.playBtn.hidden = YES;
    self.cancelBtn.hidden = YES;
    self.confirmBtn.hidden = YES;
    self.mediaView.clipsToBounds = YES;
    
}

- (void)leftSwip:(id)sender
{
    [UIView animateWithDuration:0.5 animations:^{
        
        self.leftView.x = -260;
        self.centerView.backgroundColor = [UIColor colorWithHexString:@"#000000"
                                                                alpha:0.7];;
        self.rightView.alpha = 1.0;
        self.label1.alpha = 1;
        self.label2.alpha = 1;
    }];
}

- (void)rightSwipe:(id)sender
{
    [UIView animateWithDuration:0.5 animations:^{
        
        self.rightView.x = 260;
        self.centerView.backgroundColor = [UIColor colorWithHexString:@"#000000"
                                                        alpha:0.7];
        self.label1.alpha = 1;
        self.label2.alpha = 1;
        self.leftView.alpha = 1.0;
    }];
    
}



- (IBAction)leftBtnClicked:(id)sender
{
    
    [UIView animateWithDuration:0.5 animations:^{
        self.leftView.x = 0;
        self.centerView.backgroundColor = CLEAR_COLOR;
        self.rightView.alpha = 0.0;
        
        self.label1.alpha = 0;
        self.label2.alpha = 0;
    }];
   
}


- (IBAction)rightBtnClicked:(id)sender
{
    [UIView animateWithDuration:0.5 animations:^{
        self.rightView.x = 0;
        self.centerView.backgroundColor = CLEAR_COLOR;;
        self.leftView.alpha = 0.0;
        self.label1.alpha = 0;
        self.label2.alpha = 0;
    }];
    
    

}

- (IBAction)takePicture:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(resumeHeader:didClickTakePictureBtn:)])
    {
        [self.delegate resumeHeader:self didClickTakePictureBtn:sender];
    }
}
- (IBAction)openPhotoLibrary:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(resumeHeader:didClickOpenPhotoLibraryBtn:)])
    {
        [self.delegate resumeHeader:self didClickOpenPhotoLibraryBtn:sender];
    }
}


- (IBAction)captureVideo:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(resumeHeader:didClickCaptureVideoBtn:)])
    {
        [self.delegate resumeHeader:self didClickCaptureVideoBtn:sender];
    }
}

- (IBAction)chooseVideo:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(resumeHeader:didClickChooseVideoBtn:)])
    {
        [self.delegate resumeHeader:self didClickChooseVideoBtn:sender];
    }
}


- (void)showPictureWithImage:(UIImage *)image
{
    [self leftSwip:nil];
    self.pictureBtn.hidden = YES;
    self.videoBtn.hidden = YES;
    self.confirmBtn.hidden = NO;
    self.cancelBtn.hidden = NO;
    self.label1.alpha = 0;
    self.label2.alpha = 0;
    self.mediaView.image = image;
    self.playBtn.hidden = YES;
}

- (void)showVideoWithImage:(UIImage *)image
{
    [self rightSwipe:nil];
    self.pictureBtn.hidden = YES;
    self.videoBtn.hidden = YES;
    self.confirmBtn.hidden = NO;
    self.cancelBtn.hidden = NO;
    self.label1.alpha = 0;
    self.label2.alpha = 0;
    self.playBtn.hidden = NO;
    self.mediaView.image = image;
}


- (IBAction)cancelBtnClicked:(id)sender
{
    self.mediaView.image = nil;
    self.playBtn.hidden = YES;
    self.label2.alpha = 1;
    self.label1.alpha = 1;
    self.cancelBtn.hidden = YES;
    self.confirmBtn.hidden = YES;
    self.pictureBtn.hidden = NO;
    self.videoBtn.hidden = NO;
    
}


- (IBAction)confirmBtnClicked:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(resumeHeader:didClickConfirmBtn:)])
    {
        [self.delegate resumeHeader:self didClickConfirmBtn:sender];
    }
}

- (IBAction)playBtnClicked:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(resumeHeader:didClickPlayBtn:)])
    {
        [self.delegate resumeHeader:self didClickPlayBtn:sender];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
