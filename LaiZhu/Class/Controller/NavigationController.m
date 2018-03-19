//
//  NavigationController.m
//  LaiZhu
//
//  Created by apple on 2018/1/29.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

+ (void)initialize
{
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = [UIColor colorWithHexString:@"#1b1b20"];//FF001A
    
    [bar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor whiteColor]}];
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count) {
        
        viewController.hidesBottomBarWhenPushed = YES;
        
        UIButton *button = [[UIButton alloc] init];
        
        [button setImage:[UIImage imageNamed:@"导航栏返回"] forState:UIControlStateNormal];
        
        button.bounds = CGRectMake(0, 0, 35, 30);
        
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
        
    }
    
    [super pushViewController:viewController animated:YES];
    
}

- (void)back{
    
    [self popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
