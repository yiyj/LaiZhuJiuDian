//
//  IntegralViewController.m
//  LaiZhu
//
//  Created by apple on 2018/2/28.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "IntegralViewController.h"
#import "IntegralCell.h"

static NSString  *const integralCellId = @"IntegralCell";

@interface IntegralViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;


@end

@implementation IntegralViewController

- (NSMutableArray *)dataSource
{
    if (_dataSource==nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Integral";
    //界面设置
    [self setupContent];
}

#pragma mark - UITableView代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    IntegralCell *cell = [tableView dequeueReusableCellWithIdentifier:integralCellId];
    if (!cell) {
        cell = [[IntegralCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:integralCellId];
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
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ([UIImage imageNamed:@"评价头部背景"].size.height + 35))];
    headView.backgroundColor = [UIColor colorWithHexString:@"#EAEAEA"];
    
    UIImageView *bgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0)];
    bgImgView.image = [UIImage imageNamed:@"评价头部背景"];
    bgImgView.height = [UIImage imageNamed:@"评价头部背景"].size.height;
    [headView addSubview:bgImgView];
    
    //头像
    UIImageView *headImgView = [[UIImageView alloc] init];
    headImgView.x = (ScreenWidth - [UIImage imageNamed:@"TotalIntegral"].size.width) /2;
    headImgView.y = 20;
    headImgView.size = [UIImage imageNamed:@"TotalIntegral"].size;
    [headView addSubview:headImgView];
    [headView addSubview:headImgView];
    
    //总积分
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(headImgView.frame), ScreenWidth - 30, 35)];
    label.text = @"300";
    label.textColor = [UIColor whiteColor];
    label.font = Font(30);
    label.textAlignment = NSTextAlignmentCenter;
    [headView addSubview:label];
    
    //积分明细
    UILabel *mxlabel = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(bgImgView.frame), ScreenWidth - 30, 35)];
    mxlabel.text = @"Integral detail";
    mxlabel.textColor = [UIColor colorWithHexString:@"#666666"];
    mxlabel.font = Font(15);
    [headView addSubview:mxlabel];
    
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [UIImage imageNamed:@"评价头部背景"].size.height + 35;
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
    [tableView registerNib:[UINib nibWithNibName:integralCellId bundle:nil] forCellReuseIdentifier:integralCellId];
    tableView.backgroundColor = [UIColor colorWithHexString:@"#EAEAEA"];
    tableView.tableFooterView = [UIView new];
    tableView.estimatedRowHeight = 80;
    self.tableView = tableView;
    [self.view addSubview:tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
