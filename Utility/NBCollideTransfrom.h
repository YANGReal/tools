//
//  NBCollideTransfrom.h
//  iCareer
//
//  Created by andy on 14-4-16.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    transfromFromTypeUp = 0,  //从上面飞出来
    transfromFromTypeDown,   //从下面飞出来
    transfromFromTypeLeft,      //从左面飞出来
    transfromFromTypeRight     //从右面飞出来
}transfromFromType;

@interface NBCollideTransfrom : NSObject

- (void)beginTransform:(UIView *) view andFinalXOrY:(CGFloat) xOrY isFrom:(transfromFromType) type andDelayTime:(CGFloat) time;

@end
