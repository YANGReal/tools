//
//  PECropViewController.h
//  PhotoCropEditor
//
//  Created by kishikawa katsumi on 2013/05/19.
//  Copyright (c) 2013 kishikawa katsumi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PECropViewController : UIViewController

@property (assign,nonatomic) id delegate;
@property (strong,nonatomic) UIImage *image;

@end

@protocol PECropViewControllerDelegate <NSObject>

- (void)cropViewController:(PECropViewController *)controller didFinishCroppingImage:(UIImage *)croppedImage;
- (void)cropViewControllerDidCancel:(PECropViewController *)controller;

@end
