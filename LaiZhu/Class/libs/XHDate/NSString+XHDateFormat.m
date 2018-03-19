//
//  NSString+XHDateFormat.m
//  XHDateExample
//
//  Created by zhuxiaohui on 2017/4/16.
//  Copyright © 2017年 com.it7090. All rights reserved.
//

#import "NSString+XHDateFormat.h"
#import "NSDate+XHCategory.h"

@implementation NSString (XHDateFormat)

-(NSString *)xh_formatNianYueRi
{
    NSDate *date = [NSDate xh_dateWithDateString:self];
    return [NSString stringWithFormat:@"%ld年%02ld月%02ld日",date.year,date.month,date.day];
}
-(NSString *)xh_formatNianYue
{
    NSDate *date = [NSDate xh_dateWithDateString:self];
    return [NSString stringWithFormat:@"%ld年%02ld月",date.year,date.month];
}
-(NSString *)xh_formatYueRi
{
    NSDate *date = [NSDate xh_dateWithDateString:self];
    NSString *month = @"Dec";
    if (date.month == 1) {
        month = @"Jan";
    }else if (date.month == 2) {
        month = @"Feb";
    }else if (date.month == 3) {
        month = @"Mar";
    }else if (date.month == 4) {
        month = @"Apr";
    }else if (date.month == 5) {
        month = @"May";
    }else if (date.month == 6) {
        month = @"June";
    }else if (date.month == 7) {
        month = @"July";
    }else if (date.month == 8) {
        month = @"Aug";
    }else if (date.month == 9) {
        month = @"Sept";
    }else if (date.month == 10) {
        month = @"Oct";
    }else if (date.month == 11) {
        month = @"Nov";
    }

//    return [NSString stringWithFormat:@"%02ld月%02ld月",date.month,date.day];
    return [NSString stringWithFormat:@"%@ %ld",month,date.day];
}
-(NSString *)xh_formatNian
{
    NSDate *date = [NSDate xh_dateWithDateString:self];
    return [NSString stringWithFormat:@"%ld年",date.year];
}
-(NSString *)xh_formatShiFenMiao
{
    NSDate *date = [NSDate xh_dateWithDateString:self];
    return [NSString stringWithFormat:@"%ld时%02ld分%02ld秒",date.hour,date.minute,date.seconds];
}
-(NSString *)xh_formatShiFen
{
    NSDate *date = [NSDate xh_dateWithDateString:self];
    return [NSString stringWithFormat:@"%ld时%02ld分",date.hour,date.minute];
}
-(NSString *)xh_formatFenMiao
{
    NSDate *date = [NSDate xh_dateWithDateString:self];
    return [NSString stringWithFormat:@"%02ld分%02ld秒",date.minute,date.seconds];
}
-(NSString *)xh_format_yyyy_MM_dd
{
   NSDate *date = [NSDate xh_dateWithDateString:self];
   return [NSString stringWithFormat:@"%ld-%02ld-%02ld",date.year,date.month,date.day];
}
-(NSString *)xh_format_yyyy_MM
{
    NSDate *date = [NSDate xh_dateWithDateString:self];
    return [NSString stringWithFormat:@"%ld-%02ld",date.year,date.month];
}
-(NSString *)xh_format_MM_dd
{
    NSDate *date = [NSDate xh_dateWithDateString:self];
    return [NSString stringWithFormat:@"%02ld-%02ld",date.month,date.day];
}
-(NSString *)xh_format_yyyy
{
    NSDate *date = [NSDate xh_dateWithDateString:self];
    return [NSString stringWithFormat:@"%ld",date.year];
}
-(NSString *)xh_format_HH_mm_ss
{
    NSDate *date = [NSDate xh_dateWithDateString:self];
    return [NSString stringWithFormat:@"%02ld:%02ld:%02ld",date.hour,date.minute,date.seconds];
}
-(NSString *)xh_format_HH_mm
{
    NSDate *date = [NSDate xh_dateWithDateString:self];
    return [NSString stringWithFormat:@"%02ld:%02ld",date.hour,date.minute];
}
-(NSString *)xh_format_mm_ss
{
    NSDate *date = [NSDate xh_dateWithDateString:self];
    return [NSString stringWithFormat:@"%02ld:%02ld",date.minute,date.seconds];
}

-(NSString *)xh_formatWeekDay
{
    NSString *weekStr=nil;
    NSDate *date = [NSDate xh_dateWithDateString:self];
    switch (date.weekday) {
        case 2:
            weekStr = @"周一";
            break;
        case 3:
            weekStr = @"周二";
            break;
        case 4:
            weekStr = @"周三";
            break;
        case 5:
            weekStr = @"周四";
            break;
        case 6:
            weekStr = @"周五";
            break;
        case 7:
            weekStr = @"周六";
            break;
        case 1:
            weekStr = @"周日";
            break;
        default:
            break;
    }
    return weekStr;
}
@end
