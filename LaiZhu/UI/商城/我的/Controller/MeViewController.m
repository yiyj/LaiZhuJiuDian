//
//  MeViewController.m
//  LaiZhu
//
//  Created by apple on 2018/1/29.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MeViewController.h"
#import "PasswordViewController.h"

@interface MeViewController ()

@property (weak, nonatomic) IBOutlet UIButton *iconImage;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Me";
    
}

- (IBAction)buttonClick:(UIButton *)sender {
    
    PasswordViewController *jiudian = [[PasswordViewController alloc] init];
    [self.navigationController pushViewController:jiudian animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
