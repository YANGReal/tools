

#import "APLDecorationView.h"

@interface APLDecorationView ()

@property (strong , nonatomic) NSArray *attachPointsArray;
@property (strong , nonatomic) NSArray *attachViewArray;

@end


@implementation APLDecorationView

//| ----------------------------------------------------------------------------
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}



- (void)trackAndDrawAttachmentFromPoint:(NSArray *)attachmentPointArray toView:(NSArray *)attachedViewArray
{
    self.attachPointsArray = attachmentPointArray;
    self.attachViewArray = attachedViewArray;
    
    for (UIView *attachView in _attachViewArray)
    {
        [attachView addObserver:self
                     forKeyPath:@"center"
                        options:0
                        context:NULL];
    }
}

- (void)drawRect:(CGRect)rect
{
    for (NSInteger i = 0;i<_attachViewArray.count;i++)
    {
        NSValue *value = _attachPointsArray[i];
        UIView *view2 = _attachViewArray[i];
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:value.CGPointValue];
        [path addLineToPoint:view2.center];
        path.lineWidth = 1.0;
        [[UIColor colorWithWhite:1 alpha:0.6] setStroke];
        [path stroke];
    }
}


//| ----------------------------------------------------------------------------
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    [self setNeedsDisplay];
}


- (void)dealloc
{
    
    for (NSInteger i = 0;i<_attachViewArray.count;i++)
    {
        UIView *view1 = _attachViewArray[i];
        [view1 removeObserver:self forKeyPath:@"center"];
       
    }
    
}



@end
