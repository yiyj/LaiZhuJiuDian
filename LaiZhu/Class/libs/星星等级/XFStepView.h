//
//  XFStepView.h
//  SCPay
//
//  Created by weihongfang on 2017/6/26.
//  Copyright © 2017年 weihongfang. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol XFStepViewDelegate <NSObject>

- (void)buttonStep:(int)index;

@end

@interface XFStepView : UIView

@property (nonatomic, weak) id<XFStepViewDelegate>delegate;

@property (nonatomic, retain)NSArray * _Nonnull titles;

@property (nonatomic, assign)int stepIndex;

- (instancetype _Nonnull )initWithFrame:(CGRect)frame Titles:(nonnull NSArray *)titles;

- (void)setStepIndex:(int)stepIndex Animation:(BOOL)animation;

@end
