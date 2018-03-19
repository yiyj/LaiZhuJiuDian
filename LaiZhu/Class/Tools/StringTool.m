//
//  StringTool.m
//  FireFightingSchool
//
//  Created by 瀚乐思 on 2017/11/17.
//  Copyright © 2017年 highles. All rights reserved.
//

#import "StringTool.h"

@implementation StringTool

#pragma mark -- 字体设置
+ (NSAttributedString *)labelString:(NSString *)string Label:(UILabel *)label location:(NSInteger)loaction length:(NSInteger)length colorStr:(NSString *)color font:(int)font
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:string];
    
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:color] range:NSMakeRange(loaction,length)];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:NSMakeRange(loaction, length)];
    
    label.attributedText = str;
    
    return str;
}

#pragma mark --动态计算宽高度
+ (CGSize)sizeWithTitle:(NSString *)title andFont:(UIFont *)font andSize:(CGSize)size lineSpaceing:(CGFloat)space FiretLineHeadeIndex:(CGFloat)headIndet
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = space;// 字体的行间距
    paragraphStyle.firstLineHeadIndent = headIndet;//首行缩进
    paragraphStyle.alignment = NSLineBreakByWordWrapping;
    NSDictionary * attribute = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle};
    
    return [title boundingRectWithSize:size options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
}

@end
