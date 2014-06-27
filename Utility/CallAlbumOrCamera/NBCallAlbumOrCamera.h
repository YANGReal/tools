//
//  NBCallAlbumOrCamera.h
//  iCareer
//
//  Created by andy on 14-3-26.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    PhotoLibrary = 0,      //本地相册
    PhotoForCamera,     //拍摄照片
    VideoLibrary,             //本地视频
    VideoForCamera      //拍摄视频
}UIImagePickerSourceType;

@interface NBCallAlbumOrCamera : NSObject

- (id)initWithViewController:(UIViewController *) controller;

/*设置调用类型，并调用*/
- (void)callAlbumOrCamera:(UIImagePickerSourceType) sourceType;

@end
