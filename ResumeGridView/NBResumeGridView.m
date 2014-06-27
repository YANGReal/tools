//
//  NBResumeGridView.m
//  iCareer
//
//  Created by YANGRui on 14-6-25.
//  Copyright (c) 2014年 LJLD. All rights reserved.
//

#import "NBResumeGridView.h"

@interface NBResumeGridView ()
@property (weak ,nonatomic) IBOutlet UIView *percentView;
@property (weak , nonatomic) IBOutlet UILabel *titleLabel;


- (IBAction)btnClicked:(id)sender;

@end

@implementation NBResumeGridView

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
    self.percentView.width = 0;
}

- (void)setTitle:(NSString *)title
{
    self.titleLabel.text = title;
}

- (void)setPercent:(CGFloat)percent
{
    if (percent<0||percent>1)
    {
        return;
    }
    self.percentView.width = percent*self.width;
}

- (IBAction)btnClicked:(id)sender
{
   if ([self.delegate respondsToSelector:@selector(gridView:didClickAtIndex:)])
   {
       [self.delegate gridView:self didClickAtIndex:self.tag];
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
