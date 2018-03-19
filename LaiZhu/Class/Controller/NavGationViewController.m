//
//  NavGationViewController.m
//  LaiZhu
//
//  Created by apple on 2018/2/28.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NavGationViewController.h"

@interface NavGationViewController ()

@end

@implementation NavGationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //导航栏
    [self setupNav];
}

#pragma mark -- 导航栏
- (void)setupNav
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(popToViewController) image:@"导航栏返回" highImage:nil];
}

- (void)popToViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
