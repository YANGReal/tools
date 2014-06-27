//
//  NBCallAlbumOrCamera.m
//  iCareer
//
//  Created by andy on 14-3-26.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#import "NBCallAlbumOrCamera.h"

@interface NBCallAlbumOrCamera ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, strong) UIViewController *controller;

@end

@implementation NBCallAlbumOrCamera

- (id)initWithViewController:(UIViewController *)controller
{
    self = [super init];
    if (self) {
        self.controller = controller;
    }
    return self;
}

/*设置调用类型，并调用*/
 - (void)callAlbumOrCamera:(UIImagePickerSourceType)sourceType
{
    UIImagePickerController *imagePC = [[UIImagePickerController alloc] init];
    [imagePC setDelegate:(id)_controller];
    
    NSArray* availableMedia = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    
    switch (sourceType) {
        case PhotoLibrary:
        {
            [imagePC setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        }
            break;
        case PhotoForCamera:
        {
            [imagePC setSourceType:UIImagePickerControllerSourceTypeCamera];
            imagePC.showsCameraControls = YES;
        }
            break;
        case VideoLibrary:
        {
            [imagePC setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
            imagePC.mediaTypes = [NSArray arrayWithObject:availableMedia[1]];
        }
            break;
        default:
        {
            [imagePC setSourceType:UIImagePickerControllerSourceTypeCamera];
            imagePC.mediaTypes = [NSArray arrayWithObject:availableMedia[1]];
            [imagePC setVideoMaximumDuration:30.0];
            imagePC.showsCameraControls = YES;
        }
            break;
    }
    
    [self.controller presentViewController:imagePC animated:YES completion:nil];
}

@end
