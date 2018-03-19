//
//  UIView+Extension.h
//  Service
//
//  Created by 易元江 on 2017/5/9.
//  Copyright © 2017年 com.jianzhen.zj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

/**
 *  在分类中声明属性@property,只会生成方法的声明,不会生成方法的实现和带有_下划线的成员变量
 */
@property(nonatomic,assign) CGFloat width;
@property(nonatomic,assign) CGFloat height;
@property(nonatomic,assign) CGFloat x;
@property(nonatomic,assign) CGFloat y;
@property(nonatomic,assign) CGFloat centerX;
@property(nonatomic,assign) CGFloat centerY;
@property(nonatomic,assign) CGSize size;
@property(nonatomic,assign) CGPoint origin;



@end
