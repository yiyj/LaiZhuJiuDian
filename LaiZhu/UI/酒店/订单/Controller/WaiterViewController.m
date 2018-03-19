//
//  WaiterViewController.m
//  LaiZhu
//
//  Created by apple on 2018/3/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "WaiterViewController.h"
#import "AllOrderCell.h"

static NSString  *const waiterOrderCellId = @"AllOrderCell";

@interface WaiterViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation WaiterViewController

- (NSMutableArray *)dataSource
{
    if (_dataSource==nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //界面设置
    [self setupContent];
    
}

#pragma mark - UITableView代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AllOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:waiterOrderCellId];
    if (!cell) {
        cell = [[AllOrderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:waiterOrderCellId];
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 10)];
    headView.backgroundColor = [UIColor colorWithHexString:@"#EAEAEA"];
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 10)];
    footView.backgroundColor = [UIColor whiteColor];
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 1)];
    line.backgroundColor = [UIColor colorWithHexString:@"#EAEAEA"];
    [footView addSubview:line];
    //去付款Payment  去评价Evaluate  再次预订Book
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth - 15 - 80, 7.5, 80, 35)];
    [button setTitle:@"Evaluate" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithHexString:@"#bfa276"] forState:UIControlStateNormal];
    button.titleLabel.font = Font(12);
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 2.5;
    button.layer.borderWidth = 1;
    button.layer.borderColor = [UIColor colorWithHexString:@"#bfa276"].CGColor;
    [button addTarget:self action:@selector(orderbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:button];
    
    return footView;
}

#pragma mark - 订单按键处理事件
- (void)orderbuttonClick:(UIButton *)btn
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

#pragma mark -- 界面设置
- (void)setupContent
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - NavGaitonBarH - 46) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    //    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    tableView.separatorInset = UIEdgeInsetsZero;
    [tableView registerNib:[UINib nibWithNibName:waiterOrderCellId bundle:nil] forCellReuseIdentifier:waiterOrderCellId];
    tableView.backgroundColor = [UIColor colorWithHexString:@"#EAEAEA"];
    tableView.tableFooterView = [UIView new];
    tableView.estimatedRowHeight = 96;
    self.tableView = tableView;
    [self.view addSubview:tableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
