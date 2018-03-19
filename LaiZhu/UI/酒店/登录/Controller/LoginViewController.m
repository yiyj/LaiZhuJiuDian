//
//  LoginViewController.m
//  LaiZhu
//
//  Created by 瀚乐思 on 2018/2/11.
//  Copyright © 2018年 highles. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

/** 手机号 */
@property (weak, nonatomic) IBOutlet UITextField *phoneNum;

/** 短信验证码 */
@property (weak, nonatomic) IBOutlet UITextField *code;

/** 获取短信验证码按键 */
@property (weak, nonatomic) IBOutlet UIButton *codeBtn;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    
    
}


- (IBAction)buttonClick:(UIButton *)sender {
    
    if ([sender.titleLabel.text isEqualToString:@"登录"]) {
        
    }else {//获取验证码
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
