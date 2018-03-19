//
//  YYJButton.m
//  LaiZhu
//
//  Created by apple on 2018/2/9.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "YYJButton.h"

@implementation YYJButton

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.tag == ZFButtonTypeCenterImageCenterTitle) {
        [self resetBtnCenterImageCenterTitle];
    } else if (self.tag == ZFButtonTypeLeftImageNoneTitle) {
        [self resetBtnLeftImageNotTitle];
    } else if (self.tag == ZFButtonTypeRightImageLeftTitle) {
        [self resetBtnRightImageLeftTitle];
    }
}

+ (instancetype)zButtonWithType:(YYJButtonType)buttonType
{
    YYJButton *btn = [YYJButton buttonWithType:UIButtonTypeCustom];
    btn.tag = buttonType;
    
    return btn;
}

- (void)updateButtonStyleWithType:(YYJButtonType)buttonType
{
    self.tag = buttonType;
    [self layoutSubviews];
}

#pragma mark - 私有方法
/*!**方式二***/
- (void)resetBtnCenterImageCenterTitle {
    
    self.imageView.frame = self.bounds;
    [self.imageView setContentMode:UIViewContentModeCenter];
    
    self.titleLabel.frame = self.bounds;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)resetBtnLeftImageNotTitle {
    
    CGRect frame = self.bounds;
    frame.size.width *= 0.5;
    self.imageView.frame = frame;
    [self.imageView setContentMode:UIViewContentModeCenter];
    
    self.titleLabel.frame = CGRectZero;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)resetBtnRightImageLeftTitle {
    
    CGRect frame = self.bounds;
    frame.size.width *= 0.5;
    self.titleLabel.frame = frame;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    frame.origin.x = (self.bounds.size.width - frame.size.width);
    self.imageView.frame = frame;
    [self.imageView setContentMode:UIViewContentModeCenter];
}

@end
