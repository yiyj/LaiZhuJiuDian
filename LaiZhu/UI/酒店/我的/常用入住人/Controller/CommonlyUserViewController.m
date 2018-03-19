//
//  CommonlyUserViewController.m
//  LaiZhu
//
//  Created by apple on 2018/3/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "CommonlyUserViewController.h"

@interface CommonlyUserViewController ()
@property (weak, nonatomic) IBOutlet YYJTextFiled *nameText;
@property (weak, nonatomic) IBOutlet YYJTextFiled *tellPhone;

@end

@implementation CommonlyUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Common occupant";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(sureClick) title:@"Submit" titleColor:@"#FFFFFF" font:14];
    
}

- (void)sureClick
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
