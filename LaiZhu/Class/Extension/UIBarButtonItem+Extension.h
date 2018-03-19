//
//  UIBarButtonItem+Extension.h
//  Service
//
//  Created by 易元江 on 2017/5/9.
//  Copyright © 2017年 com.jianzhen.zj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

/**
 *  创建一个item
 *
 *  @param target    点击item调用哪个对象
 *  @param action    点击item后调用target
 *  @param image     图片
 *  @param highImage 高亮图片
 *
 *  @return 创建好的item
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;

/**
 *  创建一个item
 *
 *  @param target       点击item调用哪个对象
 *  @param action       点击item后调用target
 *  @param title        文字
 *  @param titleColor   文字颜色
 *  @param font         字体大小
 *  @return 创建好的item
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title titleColor:(NSString *)titleColor font:(int)font;

@end
