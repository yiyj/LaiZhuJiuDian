//
//  SubmitOrderViewController.m
//  LaiZhu
//
//  Created by apple on 2018/2/27.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "SubmitOrderViewController.h"
#import "SubmitOrderCell.h"
#import "PaySelectView.h"
#import "SurePayView.h"

static NSString  *const submitCellId = @"SubmitOrderCell";

@interface SubmitOrderViewController ()<UITableViewDelegate,UITableViewDataSource,PaySelectViewDelegate,SurePayViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UILabel *total;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;


@end

@implementation SubmitOrderViewController

- (NSMutableArray *)dataSource
{
    if (_dataSource==nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Cashier";
    //导航栏
    [self setupNav];
    //界面设置
    [self setupContent];
}

#pragma mark - 去支付
- (IBAction)goToPayClick:(UIButton *)sender {
    
    [[PaySelectView shareInstance] show];
    PaySelectView.shareInstance.delegate = self;
}

- (void)payWithPayStr:(NSString *)pay
{
    NSLog(@"%@",pay); 
    SurePayView *payView = [[SurePayView alloc] initWithStore:@"Le Meridien Munich Hotel Chongqing hongqihegou shop" payMoney:@"368.00" payWay:@"Bank card"];
    payView.delegate = self;
    [payView show];
}

- (void)sureButtonClick:(NSString *)pay
{
    
}

#pragma mark - UITableView代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SubmitOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:submitCellId];
    if (!cell) {
        cell = [[SubmitOrderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:submitCellId];
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return NULL;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return NULL;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001f;
}
#pragma mark -- 界面设置
- (void)setupContent
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NavGaitonBarH, ScreenWidth, ScreenHeight-NavGaitonBarH-50) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [tableView registerNib:[UINib nibWithNibName:submitCellId bundle:nil] forCellReuseIdentifier:submitCellId];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.tableFooterView = [UIView new];
    tableView.estimatedRowHeight = 110;
    self.tableView = tableView;
    [self.view addSubview:tableView];
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
