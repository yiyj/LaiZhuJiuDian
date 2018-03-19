//
//  YYJButton.h
//  LaiZhu
//
//  Created by apple on 2018/2/9.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ZFButtonTypeCenterImageCenterTitle,//图片，文字都居中
    ZFButtonTypeRightImageLeftTitle,//图片右，文字左
    ZFButtonTypeLeftImageNoneTitle,//图片左，文字无
} YYJButtonType;


@interface YYJButton : UIButton

+ (instancetype)zButtonWithType:(YYJButtonType)buttonType;

- (void)updateButtonStyleWithType:(YYJButtonType)buttonType;

@end
