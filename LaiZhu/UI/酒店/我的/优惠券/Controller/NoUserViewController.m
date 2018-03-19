//
//  NoUserViewController.m
//  LaiZhu
//
//  Created by apple on 2018/2/28.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NoUserViewController.h"
#import "CouponCell.h"

static NSString  *const couponCellId = @"CouponCell";

@interface NoUserViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation NoUserViewController

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
    CouponCell *cell = [tableView dequeueReusableCellWithIdentifier:couponCellId];
    if (!cell) {
        cell = [[CouponCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:couponCellId];
    }
    
    [cell couponCellWithModel:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

#pragma mark -- 界面设置
- (void)setupContent
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-NavGaitonBarH - 40) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    tableView.separatorInset = UIEdgeInsetsZero;
    [tableView registerNib:[UINib nibWithNibName:couponCellId bundle:nil] forCellReuseIdentifier:couponCellId];
    tableView.backgroundColor = [UIColor colorWithHexString:@"#EAEAEA"];
    tableView.tableFooterView = [UIView new];
    tableView.estimatedRowHeight = 110;
    self.tableView = tableView;
    [self.view addSubview:tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
