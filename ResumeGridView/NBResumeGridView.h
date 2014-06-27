//
//  NBResumeGridView.h
//  iCareer
//
//  Created by YANGRui on 14-6-25.
//  Copyright (c) 2014年 LJLD. All rights reserved.
//

#import <UIKit/UIKit.h>


@class NBResumeGridView;


@protocol NBResumeGridViewDelegate <NSObject>

@optional

- (void)gridView:(NBResumeGridView *)view didClickAtIndex:(NSInteger)index;

@end

@interface NBResumeGridView : UIView
@property (assign , nonatomic) CGFloat percent;
@property (copy , nonatomic) NSString *title;
@property (assign , nonatomic) id<NBResumeGridViewDelegate>delegate;
@end
