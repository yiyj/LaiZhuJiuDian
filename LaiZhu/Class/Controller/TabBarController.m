//
//  TabBarController.m
//  LaiZhu
//
//  Created by apple on 2018/1/29.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "TabBarController.h"
#import "NavigationController.h"
#import "JDHomeViewController.h"
#import "OrderViewController.h"
#import "JiuDianCenterViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self addChildVc:[[JDHomeViewController alloc]init] title:@"Home" image:@"首页" selectedImage:@"首页2"];
    [self addChildVc:[[OrderViewController alloc]init] title:@"Order" image:@"订单" selectedImage:@"订单2"];
    [self addChildVc:[[JiuDianCenterViewController alloc]init] title:@"Me" image:@"我的" selectedImage:@"我的2"];
    
    //开启网络监控
    [self afnMonitoring];
    
}

- (void)afnMonitoring
{
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知网络");
                break;
            case AFNetworkReachabilityStatusNotReachable:
            {
                UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"Prompt" message:@"The network has been disconnected" preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *action = [UIAlertAction actionWithTitle:@"Sure" style:UIAlertActionStyleDefault handler:nil];
                
                [vc addAction:action];
                
                [self presentViewController:vc  animated:YES completion:nil];
                
                NSLog(@"断网了");
                
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"蜂窝移动");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"wifi");
                break;
                
            default:
                break;
        }
        
    }];
    
    [mgr startMonitoring];
}

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    childVc.title = title;
    childVc.tabBarItem.title = title;
    childVc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = [UIColor colorWithHexString:@"#bfa276"];
    
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    NavigationController *nav = [[NavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:nav];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
//    [self enterLoginView];
}

- (void)enterLoginView
{
//    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"token"] isEqualToString:@"outLogin"]) {
//    
//        NavigationController *nav = [[NavigationController alloc]initWithRootViewController:[[LoginViewController alloc] init]];
//        [self presentViewController:nav animated:YES completion:nil];
//        return;
//    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
