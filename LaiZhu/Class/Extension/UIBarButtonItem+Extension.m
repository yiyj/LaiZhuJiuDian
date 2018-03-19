//
//  UIBarButtonItem+Extension.m
//  Service
//
//  Created by 易元江 on 2017/5/9.
//  Copyright © 2017年 com.jianzhen.zj. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)


+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = Font(14);
    [btn setTitleColor:[UIColor colorWithHexString:@"666666"] forState:UIControlStateNormal];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    if (image) {
        [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }
    
    if (highImage) {
        [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
        
    }
    
    btn.size = btn.currentBackgroundImage.size;
    
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}


+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title titleColor:(NSString *)titleColor font:(int)font
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.size = CGSizeMake(55, 30);
    
    btn.titleLabel.font = Font(font);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithHexString:titleColor] forState:UIControlStateNormal];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
