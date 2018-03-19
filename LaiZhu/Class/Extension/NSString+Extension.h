//
//  NSString+Extension.h
//  Service
//
//  Created by 易元江 on 2017/5/9.
//  Copyright © 2017年 com.jianzhen.zj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

/* 获取时间 */
+ (NSString *)getTime;

/* 时间戳 */
+ (NSString *)getTimeStamp:(NSString *)timeStampString;

/** 转时间戳 */
+ (NSString *)timeInterval:(NSString *)timeStr;

/** 计算时间间隔 */
+ (NSString *)getCountDownStringWithEndTime:(NSString *)endTime;

+ (NSString *)calDateInterval:(NSString *)startTime;

+ (NSString *)CalDateInterval:(NSString *)startTime;

/* 手机型号 */
+ (NSString *)getDeviceVersion;

/** 是否为手机号码 */
+ (BOOL)checkPhoneNum:(NSString *)str;

/** 检测邮箱 */
+(BOOL)validateUserEmail:(NSString *)str;


/*应用版本号*/
+ (NSString *)getAppVersion;

//属性转换
+ (NSMutableAttributedString *)changeStringToAttribute:(NSString *)string;


//编码 URLEncodedString
+ (NSString*)URLEncodedString:(NSString *)string;

//解码 URLDecodedString
+ (NSString *)URLDecodedString:(NSString *)str;



@end
