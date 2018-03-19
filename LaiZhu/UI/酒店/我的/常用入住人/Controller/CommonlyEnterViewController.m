//
//  CommonlyEnterViewController.m
//  LaiZhu
//
//  Created by apple on 2018/2/28.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "CommonlyEnterViewController.h"
#import "CommonOccupantCell.h"
#import "CommonlyUserViewController.h"

static NSString  *const cocupantCellId = @"CommonOccupantCell";

@interface CommonlyEnterViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation CommonlyEnterViewController

- (NSMutableArray *)dataSource
{
    if (_dataSource==nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Common occupant";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(addperoson) title:@"Add" titleColor:@"#FFFFFF" font:14];
    //界面设置
    [self setupContent];
}

#pragma mark - UITableView代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommonOccupantCell *cell = [tableView dequeueReusableCellWithIdentifier:cocupantCellId];
    if (!cell) {
        cell = [[CommonOccupantCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cocupantCellId];
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

#pragma mark -- 界面设置
- (void)setupContent
{
    self.view.backgroundColor = [UIColor colorWithHexString:@"#EAEAEA"];
    if (IS_IPhone5) {
        //自动布局
        self.extendedLayoutIncludesOpaqueBars = YES;
        if (@available(iOS 11.0, *)) {
            self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NavGaitonBarH+5, ScreenWidth, ScreenHeight-NavGaitonBarH-5) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [tableView registerNib:[UINib nibWithNibName:cocupantCellId bundle:nil] forCellReuseIdentifier:cocupantCellId];
    tableView.backgroundColor = [UIColor colorWithHexString:@"#EAEAEA"];
    tableView.tableFooterView = [UIView new];
    tableView.estimatedRowHeight = 60.5;
    self.tableView = tableView;
    [self.view addSubview:tableView];
}


#pragma mark - 添加
- (void)addperoson
{
    CommonlyUserViewController *commonlyUse = [[CommonlyUserViewController alloc] init];
    [self.navigationController pushViewController:commonlyUse animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
