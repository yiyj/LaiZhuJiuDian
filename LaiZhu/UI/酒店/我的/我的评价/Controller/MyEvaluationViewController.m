//
//  MyEvaluationViewController.m
//  LaiZhu
//
//  Created by apple on 2018/2/28.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MyEvaluationViewController.h"
#import "EvaluationCell.h"
#import "EvaluationViewController.h"

static NSString  *const evaluationCellId = @"EvaluationCell";

@interface MyEvaluationViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation MyEvaluationViewController

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
    EvaluationCell *cell = [tableView dequeueReusableCellWithIdentifier:evaluationCellId];
    if (!cell) {
        cell = [[EvaluationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:evaluationCellId];
    }
    [cell evaluationCellWithModel:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EvaluationViewController *evaluation = [[EvaluationViewController alloc] init];
    [self.navigationController pushViewController:evaluation animated:YES];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ([UIImage imageNamed:@"评价头部背景"].size.height + 15))];
    headView.backgroundColor = [UIColor colorWithHexString:@"#EAEAEA"];
    
    UIImageView *bgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0)];
    bgImgView.image = [UIImage imageNamed:@"评价头部背景"];
    bgImgView.height = [UIImage imageNamed:@"评价头部背景"].size.height;
    [headView addSubview:bgImgView];
    
    //头像
    UIImageView *headImgView = [[UIImageView alloc] init];
    headImgView.y = 10;
    headImgView.size = [UIImage imageNamed:@"头像"].size;
    headImgView.x = (ScreenWidth - headImgView.width) /2;
    headImgView.layer.masksToBounds = YES;
    headImgView.layer.cornerRadius = headImgView.height/2;
    [headImgView sd_setImageWithURL:[NSURL URLWithString:@"http://img4.imgtn.bdimg.com/it/u=631130059,138005307&fm=27&gp=0.jpg"] placeholderImage:[UIImage imageNamed:@"头像"]];
    [headView addSubview:headImgView];
    
    //名称
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(headImgView.frame), ScreenWidth - 30, 25)];
    label.text = @"微微凉凉";
    label.textColor = [UIColor whiteColor];
    label.font = Font(15);
    label.textAlignment = NSTextAlignmentCenter;
    [headView addSubview:label];
    
    //评价条数
    UILabel *evalNum = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(label.frame), ScreenWidth - 30, 15)];
    evalNum.text = @"2条评价";
    evalNum.textColor = [UIColor whiteColor];
    evalNum.font = Font(12);
    evalNum.textAlignment = NSTextAlignmentCenter;
    [headView addSubview:evalNum];
    
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [UIImage imageNamed:@"评价头部背景"].size.height + 15;
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
    [tableView registerNib:[UINib nibWithNibName:evaluationCellId bundle:nil] forCellReuseIdentifier:evaluationCellId];
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
