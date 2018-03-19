//
//  XFStepView.m
//  SCPay
//
//  Created by weihongfang on 2017/6/26.
//  Copyright © 2017年 weihongfang. All rights reserved.
//

#import "XFStepView.h"

#define wh 25

@interface XFStepView()

@property (nonatomic, retain)NSMutableArray *cricleMarks;
@property (nonatomic, weak) CAShapeLayer *backgroundLayer;


@end


@implementation XFStepView

- (instancetype)initWithFrame:(CGRect)frame Titles:(nonnull NSArray *)titles
{
    if ([super initWithFrame:frame])
    {
        _stepIndex = 0;
        
        _titles = titles;
        
        for (int i = 0; i < _titles.count; i++)
        {
            
            UIView *cricle = [[UIView alloc]initWithFrame:CGRectMake(0, 0, wh, wh)];
            cricle.backgroundColor = [UIColor lightGrayColor];
            
            //如果要使用，确保宽度要大于长度
            //底层
            UIBezierPath *backgroundPath = [UIBezierPath bezierPath];
            [backgroundPath moveToPoint:CGPointMake(0, wh * 0.5)];
            [backgroundPath addLineToPoint:CGPointMake(wh-5, wh * 0.5)];
            
            CAShapeLayer *backgroundLayer = [CAShapeLayer layer];
            backgroundLayer.path = backgroundPath.CGPath;
            backgroundLayer.lineWidth = wh;
            [self.layer addSublayer:backgroundLayer];
            self.backgroundLayer = backgroundLayer;
            
            //该组件的核心部分 五角星画图的算法
            UIBezierPath *star = [[UIBezierPath alloc] init];
         
            CGFloat startX = 30 / (35 / wh);
            CGPoint center = CGPointMake(startX * 0.5, wh * 0.5);
            CGFloat radius = wh * 0.5;
            CGFloat angle = 4 * M_PI / 5;
            
            //画五角星,这里不用改动
            [star moveToPoint:CGPointMake(startX * 0.5, 0)];
            for (int i = 0; i < 5; i ++) {
                CGFloat x = center.x - sinf((i + 1) * angle) * radius;
                CGFloat y = center.y - cosf((i + 1) * angle) * radius;
                [star addLineToPoint:CGPointMake(x, y)];
            }
            [star addLineToPoint:CGPointMake(startX * 0.5, 0)];
    
            
            //遮罩
            CAShapeLayer *starLayer = [CAShapeLayer layer];
            starLayer.path = star.CGPath;
            cricle.layer.mask = starLayer;

            [self addSubview:cricle];
            
            UIButton *btn = [[UIButton alloc] initWithFrame:cricle.frame];
            btn.backgroundColor = [UIColor clearColor];
            [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = i;
            [cricle addSubview:btn];
            
            [self.cricleMarks addObject:cricle];
        }
        
    }
    return self;
}


#pragma mark - method

- (void)layoutSubviews
{
    NSInteger perWidth = self.frame.size.width / self.titles.count;
    
    CGFloat startX = 10;
    
    for (int i = 0; i < _titles.count; i++)
    {
        UIView *cricle = [_cricleMarks objectAtIndex:i];
        if (cricle != nil)
        {
            cricle.center = CGPointMake(i * perWidth + startX, self.frame.size.height / 2);
        }
        
    }
    
    self.stepIndex = _stepIndex;
}

- (NSMutableArray *)cricleMarks
{
    if (_cricleMarks == nil)
    {
        _cricleMarks = [NSMutableArray arrayWithCapacity:self.titles.count];
    }
    return _cricleMarks;
}


- (void)buttonClick:(UIButton *)sender
{
    [self setStepIndex:(int)sender.tag];
    
    if ([self.delegate respondsToSelector:@selector(buttonStep:)]) {
        [self.delegate buttonStep:(int)sender.tag];
    }
}

#pragma mark - public method

- (void)setStepIndex:(int)stepIndex
{
    if (stepIndex >= 0 && stepIndex < self.titles.count)
    {
        _stepIndex = stepIndex;
        
        
        for (int i = 0; i < _titles.count; i++)
        {
            UIView *cricle = [_cricleMarks objectAtIndex:i];
            if (cricle != nil)
            {
                if (i <= _stepIndex)
                {
                    cricle.backgroundColor = [UIColor colorWithHexString:@"FBD333"];
                }else{
                    cricle.backgroundColor = [UIColor lightGrayColor];
                }
            }
            
        }
    }
}

- (void)setStepIndex:(int)stepIndex Animation:(BOOL)animation
{
    if (stepIndex >= 0 && stepIndex < self.titles.count)
    {
        if (animation)
        {
            [UIView animateWithDuration:0.5 animations:^{
                self.stepIndex = stepIndex;
            }];
        
        }else{
            self.stepIndex = stepIndex;
        }
    }
}


@end
