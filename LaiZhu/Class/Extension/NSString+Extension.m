//
//  NSString+Extension.m
//  Service
//
//  Created by 易元江 on 2017/5/9.
//  Copyright © 2017年 com.jianzhen.zj. All rights reserved.
//

#import "NSString+Extension.h"
#import <sys/utsname.h>

@implementation NSString (Extension)

#pragma mark -- 获取时间
+ (NSString *)getTime
{
    NSDate *date = [NSDate date];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    return [format stringFromDate:date];
}

#pragma mark -- 时间戳
+ (NSString *)getTimeStamp:(NSString *)timeStampString
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeStampString doubleValue]];
    NSDateFormatter *objDateformat = [[NSDateFormatter alloc] init];
    [objDateformat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSLog(@"%@", [objDateformat stringFromDate:date]);
    NSString *time = [objDateformat stringFromDate:date];
    return [NSString stringWithFormat:@"%@",time];
}

#pragma mark -- 转时间戳
+ (NSString *)timeInterval:(NSString *)timeStr
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"yyyy-MM-dd, hh:mm:ss";
    NSDate *date=[format dateFromString:timeStr];
    //时间date转时间戳
    NSTimeInterval time = [date timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    
    return timeString;
}

#pragma mark -- 计算时间间隔
+ (NSString *)calDateInterval:(NSString *)startTime
{
    NSDate *nowDate = [NSDate date]; // 当前日期
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *startData = [formatter dateFromString:startTime];// 将传入的字符串转化成时间
    NSTimeInterval delta = [startData timeIntervalSinceDate:nowDate]; // 计算出相差多少秒
    //打印结果格式为 delta ==== 181078.541819
    NSString *during = [NSString stringWithFormat:@"%.0lf",delta];
    NSLog(@"时间差：%@",during);
    return during;
}

+ (NSString *)CalDateInterval:(NSString *)startTime
{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *startDate = [inputFormatter dateFromString:startTime];
    
    NSDate *nowDate = [NSDate date];
    
    NSString *strResult = nil;
    
    NSCalendar *chineseClendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    // 当前日历
//    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 需要对比的时间数据
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth
    | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    // 对比时间差
    NSDateComponents *DateComponent = [chineseClendar components:unit fromDate:startDate toDate:nowDate options:0];
    
    NSInteger diffHour = [DateComponent hour];
    
    NSInteger diffMin  = [DateComponent minute];
    
    NSInteger diffSec  = [DateComponent second];
    
    NSInteger diffDay  = [DateComponent day];
    
    NSInteger diffMon = [DateComponent month];
    
    NSInteger diffYear = [DateComponent year];
    
    if (diffYear > 0) {
        strResult=[NSString stringWithFormat:@"%ld 年前",(long)diffYear];
    }else if(diffMon > 0){
        strResult=[NSString stringWithFormat:@"%ld 月前",(long)diffMon];
    }else if(diffDay > 0){
        strResult=[NSString stringWithFormat:@"%ld 天前",(long)diffDay];
    }else if(diffHour > 0){
        strResult=[NSString stringWithFormat:@"%ld 小时前",(long)diffHour];
    }else if(diffMin > 0){
        strResult=[NSString stringWithFormat:@"%ld 分钟前",(long)diffMin];
    }else if(diffSec > 0){
        strResult=[NSString stringWithFormat:@"%ld 秒前",(long)diffSec];
    }else{
        strResult=[NSString stringWithFormat:@"未知时间"];
    }
    
    if (diffHour > 0 && diffMin > 0 && diffSec >= 0) {
        strResult = [NSString stringWithFormat:@"%ld",diffHour * 360 + diffMin + diffSec];
    }else if (diffHour == 0 && diffMin >= 0 && diffSec >= 0) {
        strResult = [NSString stringWithFormat:@"%ld",diffMin * 60 + diffSec];
    }else if (diffHour > 0 && diffMin == 0 && diffSec >= 0) {
        strResult = [NSString stringWithFormat:@"%ld",diffHour * 360 + diffSec];
    }else if (diffHour == 0 && diffMin == 0 && diffSec > 0) {
        strResult = [NSString stringWithFormat:@"%ld",diffSec];
    }else{
        strResult=[NSString stringWithFormat:@"1"];
    }
    
    strResult = [NSString stringWithFormat:@"%ld",diffHour * 360 + diffMin*60 + diffSec];
    
    return strResult;
}

/**
 *  计算剩余时间
 *
 *  @param endTime   结束日期
 *
 *  @return 剩余时间
 */
+ (NSString *)getCountDownStringWithEndTime:(NSString *)endTime
{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    
    NSDate *now = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];//设置时区
    NSInteger interval = [zone secondsFromGMTForDate:now];
    NSDate *localDate = [now  dateByAddingTimeInterval:interval];
    endTime = [NSString stringWithFormat:@"%@", endTime];
    NSDate *endDate = [dateFormatter dateFromString:endTime];
    NSInteger endInterval = [zone secondsFromGMTForDate:endDate];
    NSDate *end = [endDate dateByAddingTimeInterval: endInterval];
    NSUInteger voteCountTime = ([end timeIntervalSinceDate:localDate]) / 3600 / 24;
    
    NSString *timeStr = [NSString stringWithFormat:@"%ld", voteCountTime];
    
    return timeStr;
}

//一个时间距现在的时间
+ (NSString *)intervalSinceNow:(NSString *)theDate
{
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *d=[date dateFromString:theDate];
    
    NSTimeInterval late=[d timeIntervalSince1970]*1;
    
    NSDate *dat = [NSDate date];
    NSTimeInterval now=[dat timeIntervalSince1970]*1;
    NSString *timeString=@"";
    
    NSTimeInterval cha=late-now;
    
    if (cha/3600<1) {
        timeString = [NSString stringWithFormat:@"%f", cha/60];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString = [NSString stringWithFormat:@"剩余%@分", timeString];
    }
    if (cha/3600>1&&cha/86400<1) {
        timeString = [NSString stringWithFormat:@"%f", cha/3600];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"剩余%@小时", timeString];
    }
    if (cha/86400>1)
    {
        timeString = [NSString stringWithFormat:@"%f", cha/86400];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"剩余%@天", timeString];
        
    }
    return timeString;
}

#pragma mark -- 是否为手机号码
+ (BOOL)checkPhoneNum:(NSString *)str {
    NSString *regex = @"1[0-9]{10}";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    BOOL isMatch = [pred evaluateWithObject:str];
    return isMatch;
}

#pragma mark -- 校验用户邮箱
+ (BOOL)validateUserEmail:(NSString *)str
{
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc]
                                              initWithPattern:@"\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*"
                                              options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:str options:NSMatchingReportProgress  range:NSMakeRange(0, str.length)];
    if(numberofMatch > 0)
    {
        NSLog(@"%@ 邮箱isNumbericString: YES", str);
        return YES;
    }
    
    NSLog(@"%@ 邮箱isNumbericString: NO", str);
    return NO;
}


#pragma mark -- 手机型号
+ (NSString *)getDeviceVersion
{
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    //iPhone 系列
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5C";
    if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
    if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5S";
    if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
    if ([platform isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([platform isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    if ([platform isEqualToString:@"iPhone9,1"])    return @"iPhone 7 (CDMA)";
    if ([platform isEqualToString:@"iPhone9,3"])    return @"iPhone 7 (GSM)";
    if ([platform isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus (CDMA)";
    if ([platform isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus (GSM)";
    if ([platform isEqualToString:@"iPhone10,1"])   return @"iPhone_8";
    if ([platform isEqualToString:@"iPhone10,4"])   return @"iPhone_8";
    if ([platform isEqualToString:@"iPhone10,2"])   return @"iPhone_8_Plus";
    if ([platform isEqualToString:@"iPhone10,5"])   return @"iPhone_8_Plus";
    if ([platform isEqualToString:@"iPhone10,3"])   return @"iPhone_X";
    if ([platform isEqualToString:@"iPhone10,6"])   return @"iPhone_X";
    
    
    //iPod 系列
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    
    //iPad 系列
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2 (32nm)";
    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad mini (WiFi)";
    if ([platform isEqualToString:@"iPad2,6"])      return @"iPad mini (GSM)";
    if ([platform isEqualToString:@"iPad2,7"])      return @"iPad mini (CDMA)";
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3(WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3(CDMA)";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3(4G)";
    if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([platform isEqualToString:@"iPad3,5"])      return @"iPad 4 (4G)";
    if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (CDMA)";
    if ([platform isEqualToString:@"iPad4,1"])      return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,2"])      return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,3"])      return @"iPad Air";
    if ([platform isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([platform isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    if ([platform isEqualToString:@"i386"])         return @"Simulator";
    if ([platform isEqualToString:@"x86_64"])       return @"Simulator";
    if ([platform isEqualToString:@"iPad4,4"]  ||[platform isEqualToString:@"iPad4,5"]
        ||[platform isEqualToString:@"iPad4,6"])    return @"iPad mini 2";
    if ([platform isEqualToString:@"iPad4,7"] ||[platform isEqualToString:@"iPad4,8"]
        ||[platform isEqualToString:@"iPad4,9"])    return @"iPad mini 3";
    
    return platform;
    
}

#pragma mark -- 应用版本号
+ (NSString *)getAppVersion
{
    NSString *version = [[[NSBundle mainBundle]infoDictionary]objectForKey:@"CFBundleShortVersionString"];
    
    return [NSString stringWithFormat:@"v%@",version];
    
}

#pragma mark -- 属性转换
+ (NSMutableAttributedString *)changeStringToAttribute:(NSString *)string
{
    NSDictionary *attr = @{
                           NSStrikethroughStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle],
                           NSForegroundColorAttributeName:[UIColor grayColor]
                           };
    return [[NSMutableAttributedString alloc]initWithString:string attributes:attr];
    
}



#pragma mark -- 解码 URLDecodedString
+ (NSString*)URLDecodedString:(NSString *)string
{
    
    NSString *encodedValue = (NSString*)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)string, NULL, (CFStringRef)@"!*'();:@&=+$,/%#[]", kCFStringEncodingUTF8));
    return encodedValue;
}

#pragma mark -- 编码 URLEncodedString
+ (NSString *)URLEncodedString:(NSString *)str
{
    NSString *decodedString=(__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (__bridge CFStringRef)str, CFSTR(""), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    
    return decodedString;
}







@end
