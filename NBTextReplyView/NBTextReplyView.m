//
//  NBTextReplyView.m
//  iCareer
//
//  Created by YANGRui on 14-4-10.
//  Copyright (c) 2014年 LJLD. All rights reserved.
//

#import "NBTextReplyView.h"

@interface NBTextReplyView ()
@property (weak , nonatomic) IBOutlet UIButton *senderBtn;
@property (weak , nonatomic) IBOutlet UIView *bgView;

- (IBAction)sendBtnClicked:(id)sender;

@end

@implementation NBTextReplyView

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
    self.backgroundColor = WHITE_COLOR;
    self.bgView.backgroundColor =  CLEAR_COLOR;
    self.textField.backgroundColor = CLEAR_COLOR;
    [self.bgView setupBorder:LIGHT_GRAY cornerRadius:3];
    [self.senderBtn setupBorder:LIGHT_GRAY cornerRadius:3];
}

- (IBAction)sendBtnClicked:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(textReplyView:WillPostConnment:)])
    {
        [self.delegate textReplyView:self WillPostConnment:self.textField.text];
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
