//
//  NBUnderLineLabel.m
//  iCareer
//
//  Created by YANGRui on 14-4-8.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#import "NBUnderLineLabel.h"

@implementation NBUnderLineLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
  //  UIFont *font = [UIFont fontWithName:@"Arial" size:fontSize];
    CGSize size = CGSizeMake(self.width, CGFLOAT_MAX);
    NSDictionary *attr = [NSDictionary dictionaryWithObject:self.font forKey:NSFontAttributeName];
    CGSize fontSize =   [self.text boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;

  //  [MKMapView]
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    CGSize fontSize =[self.text sizeWithFont:self.font
//                                    forWidth:self.bounds.size.width
//                               lineBreakMode:NSLineBreakByWordWrapping];
    
    
    // Get the fonts color.
    
    const float * colors = CGColorGetComponents(self.textColor.CGColor);
    // Sets the color to draw the line
    CGContextSetRGBStrokeColor(ctx, colors[0], colors[1], colors[2], 1.0f); // Format : RGBA
    
    // Line Width : make thinner or bigger if you want
    CGContextSetLineWidth(ctx, 1.0f);
    
    // Calculate the starting point (left) and target (right)
    CGPoint l = CGPointMake(20,
                            self.frame.size.height/2.0 +fontSize.height/2.0);
    
    CGPoint r = CGPointMake(fontSize.width,
                            self.frame.size.height/2.0 + fontSize.height/2.0);
    
    
    // Add Move Command to point the draw cursor to the starting point
    CGContextMoveToPoint(ctx, l.x, l.y);
    
    // Add Command to draw a Line
    CGContextAddLineToPoint(ctx, r.x, r.y);
    
    
    // Actually draw the line.
    CGContextStrokePath(ctx);
    
    // should be nothing, but who knows...
   // [super drawRect:rect];
    
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
