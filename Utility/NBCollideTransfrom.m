//
//  NBCollideTransfrom.m
//  iCareer
//
//  Created by andy on 14-4-16.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#import "NBCollideTransfrom.h"

@implementation NBCollideTransfrom

- (void)beginTransform:(UIView *) view andFinalXOrY:(CGFloat) xOrY isFrom:(transfromFromType) type andDelayTime:(CGFloat) time
{
    [UIView animateWithDuration:time animations:^{
        
        switch (type) {
            case 0:
                view.y = 10 - view.height;
                break;
            case 1:
                view.y = DEVICE_HEIGHT - 10;
                break;
            case 2:
                view.x = 10 - view.width;
                break;
            case 3:
                view.x = 310;
                break;
            default:
                break;
        }
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            
            switch (type) {
                case 0:
                    [view setTransform:CGAffineTransformMakeScale(1, 0.9)];
                    view.y = xOrY + view.height * 0.1;
                    break;
                case 1:
                    [view setTransform:CGAffineTransformMakeScale(1, 0.9)];
                    view.y = xOrY;
                    break;
                case 2:
                    [view setTransform:CGAffineTransformMakeScale(0.9, 1)];
                    view.x = xOrY + view.width * 0.1;
                    break;
                case 3:
                    [view setTransform:CGAffineTransformMakeScale(0.9, 1)];
                    view.x = xOrY;
                    break;
                default:
                    break;
            }
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.05 animations:^{
                switch (type) {
                    case 0:
                        view.y = xOrY - 10;
                        break;
                    case 1:
                        view.y = xOrY + 10;
                        break;
                    case 2:
                        view.x = xOrY - 10;
                        break;
                    case 3:
                        view.x = xOrY + 10;
                        break;
                    default:
                        break;
                }
                [view setTransform:CGAffineTransformIdentity];
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.05 animations:^{
                    switch (type) {
                        case 0:
                            view.y = xOrY;
                            break;
                        case 1:
                            view.y = xOrY;
                            break;
                        case 2:
                            view.x = xOrY;
                            break;
                        case 3:
                            view.x = xOrY;
                            break;
                        default:
                            break;
                    }
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.05 animations:^{
                        switch (type) {
                            case 0:
                                view.y = xOrY - 5;
                                break;
                            case 1:
                                view.y = xOrY + 5;
                                break;
                            case 2:
                                view.x = xOrY - 5;
                                break;
                            case 3:
                                view.x = xOrY + 5;
                                break;
                            default:
                                break;
                        }
                    } completion:^(BOOL finished) {
                        [UIView animateWithDuration:0.05 animations:^{
                            switch (type) {
                                case 0:
                                    view.y = xOrY;
                                    break;
                                case 1:
                                    view.y = xOrY;
                                    break;
                                case 2:
                                    view.x = xOrY;
                                    break;
                                case 3:
                                    view.x = xOrY;
                                    break;
                                default:
                                    break;
                            }
                        }];
                    }];
                }];
            }];
        }];
    }];
}

@end
