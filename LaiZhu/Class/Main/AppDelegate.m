//
//  AppDelegate.m
//  LaiZhu
//
//  Created by apple on 2018/1/29.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong, nonatomic) BMKMapManager *mapManager;

@end

@implementation AppDelegate

//当程序载入后执行，应用程序启动入口
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    //导航栏设置
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    //定位
    [[LocationManager shareLocationManager] startLocationManager];

    //BaiduMap
    self.mapManager = [[BMKMapManager alloc] init];
    
    BOOL ret = [self.mapManager start:BaiduKey generalDelegate:nil];
    if (!ret) {
        
        YYJNSLog(@"BaiduMap manager start failed!");
    }
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window switchLeadViewController];
    [self.window makeKeyAndVisible];
    
    return YES;
}


//应用程序将要进入非活动状态，即将进入后台,在此期间，应用程序不接收消息或事件
- (void)applicationWillResignActive:(UIApplication *)application {
    
}

//当程序被推送到后台的时候调用。所以要设置后台继续运行，则在这个函数里面设置即可
- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

//当程序从后台将要重新回到前台时候调用
- (void)applicationWillEnterForeground:(UIApplication *)application {
   
}

//当应用程序进入活动状态时执行
- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

//当程序将要退出是被调用，通常是用来保存数据和一些退出前的清理工作。这个需要要设置UIApplicationExitsOnSuspend的键值。
- (void)applicationWillTerminate:(UIApplication *)application {

}


@end
