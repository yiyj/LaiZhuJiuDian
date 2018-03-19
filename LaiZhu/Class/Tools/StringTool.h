//
//  StringTool.h
//  FireFightingSchool
//
//  Created by 瀚乐思 on 2017/11/17.
//  Copyright © 2017年 highles. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringTool : NSObject

// 字体设置
+ (NSAttributedString *)labelString:(NSString *)string Label:(UILabel *)label location:(NSInteger)loaction length:(NSInteger)length colorStr:(NSString *)color font:(int)font;

/**
 字体宽高设置

 @param title 内容
 @param font 字体大小
 @param size 宽高描述
 @param space 字体的行间距
 @param headIndet 首行缩进
 @return 字体宽高
 */
+ (CGSize)sizeWithTitle:(NSString *)title andFont:(UIFont *)font andSize:(CGSize)size lineSpaceing:(CGFloat)space FiretLineHeadeIndex:(CGFloat)headIndet;

@end
