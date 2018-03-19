//
//  UIWindow+Extension.m
//  Service
//
//  Created by Mac on 2017/5/9.
//  Copyright © 2017年 com.jianzhen.zj. All rights reserved.
//

#import "UIWindow+Extension.h"
#import "NavigationController.h"
#import "TabBarController.h"
#import "GuideViewController.h"
#import "LoginViewController.h"

@implementation UIWindow (Extension)

- (void)switchLeadViewController
{
    NSString *key = @"CFBundleVersion";
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults]objectForKey:key];
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    
    if ([currentVersion isEqualToString:lastVersion]) {
        //版本未更新,展示首页
        [self switchLoginViewController];

    }else{
        //版本已更新，展示版本新特性
        self.rootViewController = [[GuideViewController alloc] init];
        [[NSUserDefaults standardUserDefaults]setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
}

- (void)switchLoginViewController
{
    TabBarController *vc = [[TabBarController alloc] init];
    self.rootViewController = vc;
    
//    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"adToEnter"] isEqualToString:@"loginEnter"]){
//        //登录进入
//        TabBarController *vc = [[TabBarController alloc] init];
//        self.rootViewController = vc;
//        
//    }else{
//        //账号首次登录或退出后重新登录
//        LoginViewController *entervc = [[LoginViewController alloc] init];
//        NavigationController *nagationEnterVC = [[NavigationController alloc] initWithRootViewController:entervc];
//        self.rootViewController = nagationEnterVC;
//    }
}


@end
