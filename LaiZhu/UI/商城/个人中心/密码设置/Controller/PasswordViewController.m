//
//  PasswordViewController.m
//  LaiZhu
//
//  Created by apple on 2018/2/9.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "PasswordViewController.h"

@interface PasswordViewController ()

/** 手机号码 */
@property (weak, nonatomic) IBOutlet UITextField *tellPhone;
/** 验证码 */
@property (weak, nonatomic) IBOutlet UITextField *code;
/** 新密码 */
@property (weak, nonatomic) IBOutlet UITextField *pwd;
/** 确认密码 */
@property (weak, nonatomic) IBOutlet UITextField *surePwd;
/** 发送验证码 */
@property (weak, nonatomic) IBOutlet UIButton *codeBtn;


@end

@implementation PasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Modify the password";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(popToViewController) image:@"导航栏返回" highImage:nil];
    
}

#pragma mark - 提交/发送验证码
- (IBAction)submitPassWorld:(id)sender {
    
    
}

- (void)popToViewController
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
