//
//  TypeViewController.m
//  LaiZhu
//
//  Created by apple on 2018/1/29.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "TypeViewController.h"
#import "LeftCell.h"
#import "ShopCell.h"

static NSString *const leftCellId = @"LeftCell";
static NSString *const shopCellId = @"ShopCell";

@interface TypeViewController ()<UITableViewDelegate,UITableViewDataSource>

//左边分类列表
@property (nonatomic,strong) UITableView *leftTableView;
@property (nonatomic,strong) NSMutableArray *modelArray;
//右边商品展示
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArray;
/** 类别 */
@property (nonatomic,copy) NSString *type;

@end

@implementation TypeViewController
- (NSMutableArray *)modelArray
{
    if (!_modelArray) {
        _modelArray = [NSMutableArray arrayWithObjects:@"全部商品", @"品牌商品", @"特惠品", @"全球品", @"时尚购", @"女士用品", @"男士用品", @"家具", @"酒水饮料", @"家装", @"生活旅行", nil];
    }
    return _modelArray;
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Class";
    self.type = @"全部商品";
    //列表设置
    [self createTabaleView];
    //平台行业商品类型
    [self loadData];
    //创建线程
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        [self getData];
    });
    //添加上下拉加载刷新方法
    [self refresh];
}
#pragma mark - 加载刷新方法
- (void)refresh
{
    
}

#pragma mark - 行业商品列表
- (void)getData
{
    
}

#pragma mark - 平台行业商品类型
- (void)loadData
{
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.leftTableView) {
        static BOOL isFirst = YES;

        LeftCell *typeCell = [tableView dequeueReusableCellWithIdentifier:leftCellId];
        if (!typeCell) {
            typeCell = [[LeftCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:leftCellId];
        }
        [typeCell leftTypeCellWithModel:self.modelArray[indexPath.row]];
        if(isFirst) {
            [tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        }
        isFirst = NO;
        return typeCell;
    }else {
        ShopCell *cell = [tableView dequeueReusableCellWithIdentifier:shopCellId];
        if (!cell) {
            cell = [[ShopCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:shopCellId];
        }
        [cell shopCellModel];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.leftTableView) {
        self.type = self.modelArray[indexPath.row];
        [self.tableView reloadData];
    }else {
        
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (tableView == self.tableView) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth - 90 * AdsSliderWH - 8, 40)];
        label.backgroundColor = [UIColor colorWithHexString:@"#F0F0F0"];
        label.text = self.type;
        label.textColor = [UIColor colorWithHexString:@"#666666"];
        label.font = Font(15);
        return label;
    }else {
        return NULL;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView == self.tableView) {
        return 40;
    }else {
        return 0.0f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.leftTableView) {
        return 40;
    }else {
        return 110;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.leftTableView) {
        return 10;
    }else {
        return 10;
    }
}

#pragma mark - 列表设置
- (void)createTabaleView
{
    /** 左边列表 */
    self.leftTableView = [self setTableView];
    [self.leftTableView registerNib:[UINib nibWithNibName:leftCellId bundle:nil] forCellReuseIdentifier:leftCellId];
    [self.view addSubview:self.leftTableView];
    
    /** 右边商品展示 */
    self.tableView = [self setTableView];
    self.tableView.x = CGRectGetMaxX(self.leftTableView.frame) + 8;
    self.tableView.width = ScreenWidth - CGRectGetMaxX(self.leftTableView.frame) - 8;
    [self.tableView registerNib:[UINib nibWithNibName:shopCellId bundle:nil] forCellReuseIdentifier:shopCellId];
    [self.view addSubview:self.tableView];
}

- (UITableView *)setTableView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NavGaitonBarH + 1, 90 * AdsSliderWH, ScreenHeight - NavGaitonBarH - 51) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.separatorInset = UIEdgeInsetsZero;
    UIView *clearView = [UIView new];
    clearView.backgroundColor = [UIColor clearColor];
    tableView.tableFooterView = clearView;
    return tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
