//
//  NBTextReplyView.h
//  iCareer
//
//  Created by YANGRui on 14-4-10.
//  Copyright (c) 2014年 LJLD. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NBTextReplyView;

@protocol NBTextReplyViewDelegate <NSObject>

@optional
- (void)textReplyView:(NBTextReplyView *)replyView WillPostConnment:(NSString *)text;

@end

@interface NBTextReplyView : UIView
@property (weak , nonatomic) IBOutlet UITextField *textField;
@property (assign , nonatomic) id<NBTextReplyViewDelegate>delegate;
@end
