//
//  VluationViewController.m
//  LaiZhu
//
//  Created by apple on 2018/3/16.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "VluationViewController.h"
#import "ValuationCell.h"

static NSString  *const vluationCellId = @"ValuationCell";

@interface VluationViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation VluationViewController

- (NSMutableArray *)dataSource
{
    if (_dataSource==nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"My Evaluation";
    //界面设置
    [self setupContent];
}

#pragma mark - UITableView代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ValuationCell *cell = [tableView dequeueReusableCellWithIdentifier:vluationCellId];
    if (!cell) {
        cell = [[ValuationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:vluationCellId];
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
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
    CGFloat kViewWY = (ScreenWidth - 69 -12)/kNumber;
    //y
    CGFloat height =(kViewWY + kMarginY) * (6 / kNumber);

    return 121 + height;
}

#pragma mark -- 界面设置
- (void)setupContent
{
    if (IS_IPhone5) {
        //自动布局
        self.extendedLayoutIncludesOpaqueBars = YES;
        if (@available(iOS 11.0, *)) {
            self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NavGaitonBarH, ScreenWidth, ScreenHeight-NavGaitonBarH) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    tableView.separatorInset = UIEdgeInsetsZero;
    [tableView registerNib:[UINib nibWithNibName:vluationCellId bundle:nil] forCellReuseIdentifier:vluationCellId];
    tableView.backgroundColor = [UIColor colorWithHexString:@"#EAEAEA"];
    tableView.tableFooterView = [UIView new];
    tableView.estimatedRowHeight = 121;
    self.tableView = tableView;
    [self.view addSubview:tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
