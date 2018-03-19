//
//  Macros.h
//  LaiZhu
//
//  Created by apple on 2018/1/29.
//  Copyright © 2018年 apple. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

//URL前缀
#import "APIStringMacros.h"

//系统

//自定义
#import "YYJConst.h"
#import "NSString+Extension.h"
#import "NSString+Hash.h"
#import "UIColor+Extension.h"
#import "UIView+Extension.h"
#import "UIWindow+Extension.h"
#import "UIBarButtonItem+Extension.h"
#import "YYJTextFiled.h"
#import "StringTool.h"
#import "LocationManager.h"
#import "RateView.h"
#import "UIView+Toast.h"

//第三方库
#import "AFNetworking.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "UIImageView+WebCache.h"
#import <UIButton+WebCache.h>
#import "MJRefresh.h"
#import "SDCycleScrollView.h"

#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件
#import <BaiduMapAPI_Search/BMKSearchComponent.h>//引入检索功能所有的头文件
#import <BaiduMapAPI_Cloud/BMKCloudSearchComponent.h>//引入云检索功能所有的头文件
#import <BaiduMapAPI_Location/BMKLocationComponent.h>//引入定位功能所有的头文件
#import <BaiduMapAPI_Utils/BMKUtilsComponent.h>//引入计算工具所有的头文件
#import <BaiduMapAPI_Radar/BMKRadarComponent.h>//引入周边雷达功能所有的头文件
#import <BaiduMapAPI_Map/BMKMapView.h>//只引入所需的单个头文件

//支付宝

//微信



/** 手机型号判断 */
#define IS_IPhone5  (([[UIScreen mainScreen] bounds].size.height == 568) ? YES : NO)
#define iPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define SYSTEMVERSION   [UIDevice currentDevice].systemVersion
#define iOS5OrLater ([SYSTEMVERSION floatValue] >= 6.0)

#define IsiPhoneX  ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : 0)
#define NavGaitonBarH  ((IsiPhoneX != 0)?88.0:64)
#define TarBarH  ((IsiPhoneX != 0)?83.0:49)
#define AdsSliderWH  [UIScreen mainScreen].bounds.size.width/375

/** 颜色 */
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

//字体
#define Font(font) [UIFont systemFontOfSize:(font)]

/** 尺寸 */
#define ScreenWidth   [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
//每个酒店详情房间数选择器CollocationView个数
#define romsNum  5
//每个酒店详情房间数选择器CollocationView cell 宽度
#define romsWidth  50
/** 评论 */
// 每行的个数
#define kNumber 3
// y的间距
#define kMarginY 5

//版本号
#define AppStore_ID  @""
#define kVersion [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
#define kVersionBuild [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]


//JYYJNSLog打印输出设置
#ifdef DEBUG
#define YYJNSLog(format, ...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )
#else
#define YYJNSLog(format,...)
#endif


#endif /* Macros_h */
