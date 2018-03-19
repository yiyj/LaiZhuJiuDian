//
//  LocationManager.h
//  IosBaiduDemo
//
//  Created by apple on 2017/5/15.
//  Copyright © 2017年 易元江. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocationManager : NSObject

+ (instancetype)shareLocationManager;
/** 本地定位开始 */
- (void)startLocationManager;
/** 本地定位停止 */
- (void)stopLocationManager;
/**
 *  开始定位
 *  百度地图定位
 */
- (void)startLocation;
/**
 *  停止定位
 *  百度地图定位
 */
- (void)stopLocation;
/**
 *  判断是否授权开启定位
 *  百度地图定位
 */
- (BOOL)isAuthorizeOpenLocation;


@end
