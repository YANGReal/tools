//
//  DBTileButton.m
//  DBTileButton
//

/* @author daniel beard
* http://danielbeard.wordpress.com
* http://github.com/paintstripper
*
* Copyright (C) 2012 Daniel Beard
*
* Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
* to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
* and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

#import "DBTileButton.h"
#import <QuartzCore/QuartzCore.h>

#define CATransform3DPerspective(t, x, y) (CATransform3DConcat(t, CATransform3DMake(1, 0, 0, x, 0, 1, 0, y, 0, 0, 1, 0, 0, 0, 0, 1)))
#define CATransform3DMakePerspective(x, y) (CATransform3DPerspective(CATransform3DIdentity, x, y))
#define ZoomMulriple 0.95
#define ZoomArithmetic(x) ((x - x * ZoomMulriple) / 2)

CG_INLINE CATransform3D
CATransform3DMake(CGFloat m11, CGFloat m12, CGFloat m13, CGFloat m14,
				  CGFloat m21, CGFloat m22, CGFloat m23, CGFloat m24,
				  CGFloat m31, CGFloat m32, CGFloat m33, CGFloat m34,
				  CGFloat m41, CGFloat m42, CGFloat m43, CGFloat m44)
{
	CATransform3D t;
	t.m11 = m11; t.m12 = m12; t.m13 = m13; t.m14 = m14;
	t.m21 = m21; t.m22 = m22; t.m23 = m23; t.m24 = m24;
	t.m31 = m31; t.m32 = m32; t.m33 = m33; t.m34 = m34;
	t.m41 = m41; t.m42 = m42; t.m43 = m43; t.m44 = m44;
	return t;
}

@implementation DBTileButton {
    CGSize originalSize;
    CGPoint originalCenter;
    CGPoint originalZero;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self commonInit];
    }
    return self;
}

- (id) init
{
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

-(void) commonInit {
    [self setExclusiveTouch:YES];
    //enable the shadow
    //[self enableShadow];
    
    [self addTarget:self action:@selector(touchDown:forEvent:) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
}

-(void) enableShadow {
    //shadow part
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 5);
    self.layer.shadowOpacity = 1;
    self.layer.shadowRadius = 5.0;
    
    //set shadow path
    self.layer.masksToBounds = NO;
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.bounds];
    self.layer.shadowPath = path.CGPath;
}

-(void) disableShadow {
    self.layer.shadowColor = [UIColor clearColor].CGColor;
}


-(void)setAnchorPoint:(CGPoint)anchorPoint forView:(UIView *)view
{
    CGPoint newPoint = CGPointMake(view.bounds.size.width * anchorPoint.x, view.bounds.size.height * anchorPoint.y);
    CGPoint oldPoint = CGPointMake(view.bounds.size.width * view.layer.anchorPoint.x, view.bounds.size.height * view.layer.anchorPoint.y);
    
    newPoint = CGPointApplyAffineTransform(newPoint, view.transform);
    oldPoint = CGPointApplyAffineTransform(oldPoint, view.transform);
    
    CGPoint position = view.layer.position;
    
    position.x -= oldPoint.x;
    position.x += newPoint.x;
    
    position.y -= oldPoint.y;
    position.y += newPoint.y;
    
    view.layer.position = position;
    view.layer.anchorPoint = anchorPoint;
}

-(void) touchUp: (UIButton *) sender {
        [UIView animateWithDuration:0.2 animations:^{
//        sender.layer.zPosition = 0;
        CATransform3D transform = CATransform3DMakeRotation(0, 1, 0, 0);
        transform.m34 = 1.0 / -500;
        sender.layer.transform = transform;
        sender.center = originalCenter;
        sender.layer.frame = CGRectMake(originalZero.x, originalZero.y, originalSize.width, originalSize.height);
//        [((DBTileButton*)sender) disableShadow];
    } completion:^(BOOL finished) {
//        sender.layer.zPosition = 10000;

    }];
}

-(void) touchDown: (UIButton*) sender forEvent:(UIEvent*)event{
    
    originalSize = sender.layer.frame.size;
    originalZero = CGPointMake(sender.frame.origin.x, sender.frame.origin.y);
    
    //get touch location
    UITouch *touch = [[event touchesForView:sender] anyObject];
    CGPoint location = [touch locationInView:sender];
    
    //get distance from center of button
    CGFloat a = (originalSize.width / 2.0f) - location.x;
    CGFloat b = (originalSize.height / 2.0f) - location.y;
    
    [self setAnchorPoint:CGPointMake(0.5f, 0.5f) forView:sender];
    
    //the 3d perspective transform
    CATransform3D transform3d;
//    sender.layer.zPosition = 0;
    originalCenter = sender.center;
    
    if (fabs(a) < originalSize.width / 4.0f && fabs(b) < originalSize.height / 4.0f)
    {
        [self setAnchorPoint:CGPointMake(0.5f, 0.5f) forView:sender];

        [UIView animateWithDuration:0.2 animations:^{
//            sender.layer.zPosition = 10000;
            sender.layer.frame = CGRectMake(originalZero.x + ZoomArithmetic(originalSize.width), originalZero.y + ZoomArithmetic(originalSize.height), originalSize.width * ZoomMulriple, originalSize.height * ZoomMulriple);
            sender.center = originalCenter;
            
           // [((DBTileButton*)sender) disableShadow];
//            [((DBTileButton*)sender) enableShadow];
        } completion:^(BOOL finished) {

        }];
    }
    else
    {
    //x distance is greater
    if (fabs(a) > fabs(b))
    {
        if (a < 0) //left side
        {
             transform3d = CATransform3DMakePerspective(0.0005,0 );
        }
    
        else
        {
            //right side
            transform3d = CATransform3DMakePerspective(-0.0005, 0);
        }
    }
    //y distance is greater
    else
    {
        if (b < 0) //top
        {
            transform3d = CATransform3DMakePerspective(0 , 0.0005);
        }
        else //bottom
        {
            transform3d = CATransform3DMakePerspective(0 , -0.0005);
        }
    }
    [UIView animateWithDuration:0.2 animations:^{
//        sender.layer.zPosition = 10000;
        sender.layer.frame = CGRectMake(originalZero.x + ZoomArithmetic(originalSize.width), originalZero.y + ZoomArithmetic(originalSize.height), originalSize.width * ZoomMulriple, originalSize.height * ZoomMulriple);
        sender.center = originalCenter;
        sender.layer.transform = transform3d;
        
    } completion:^(BOOL finished) {
        
    }];
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchUp:self];
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
