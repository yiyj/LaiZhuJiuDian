//
//  BillViewController.m
//  LaiZhu
//
//  Created by apple on 2018/2/28.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "BillViewController.h"

@interface BillViewController ()

/** 普通发票 */
@property (weak, nonatomic) IBOutlet UIButton *generalBtn;
/** 增值税专用发票 */
@property (weak, nonatomic) IBOutlet UIButton *vatBtn;

@property (weak, nonatomic) IBOutlet UIView *botView;

/** 发票抬头head Invoices /企业名称 Enterprise name */

@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet YYJTextFiled *enterprise;
/** 信用代码 */
@property (weak, nonatomic) IBOutlet YYJTextFiled *creditCode;
/** 注册地址 */
@property (weak, nonatomic) IBOutlet YYJTextFiled *registAddress;
/** 公司电话 */
@property (weak, nonatomic) IBOutlet YYJTextFiled *phone;
/** 开户银行 */
@property (weak, nonatomic) IBOutlet YYJTextFiled *bank;
/** 开户账户 */
@property (weak, nonatomic) IBOutlet YYJTextFiled *account;

@end

@implementation BillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Add the invoice";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(sureSubmitClick) title:@"Submit" titleColor:@"#FFFFFF" font:14];
}

#pragma mark - 保存确定
- (void)sureSubmitClick
{
    
}

#pragma mark - 普通发票 增值税专用发票
- (IBAction)invoiceClick:(UIButton *)sender {
    
    if (sender == self.generalBtn) {
        self.generalBtn.selected = YES;
        self.vatBtn.selected = NO;
        self.botView.hidden = YES;
        self.leftLabel.text = @"Head Invoices";
        self.enterprise.placeholder = @"Please fill in the receipt of the invoice";
    }else {
        self.generalBtn.selected = NO;
        self.vatBtn.selected = YES;
        self.botView.hidden = NO;
        self.leftLabel.text = @"Enterprise name";
        self.enterprise.placeholder = @"The legal name on the business license";
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
