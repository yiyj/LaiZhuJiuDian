//
//  HomeViewController.m
//  LaiZhu
//
//  Created by apple on 2018/1/29.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "HomeViewController.h"
#import "GoodsDetallViewController.h"
#import "SigninView.h"
#import "AdsTableViewCell.h"
#import "TypeTableViewCell.h"
#import "MallViewCell.h"
#import "FloorCell.h"
#import "ProductCell.h"


@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,SigninViewButtonClickDelegate,ProductCellDelegate>

@property(nonatomic,weak)UITableView *tableView;
//轮播图片数组
@property(nonatomic,strong)NSMutableArray *imageArray;
@property(nonatomic,strong)NSMutableArray *adsArray;
//商品数据
@property(nonatomic,strong)NSMutableArray *goodsList;
//导航栏右侧弹出菜单
@property(nonatomic,strong)SigninView *signinView;


@end

@implementation HomeViewController

static NSString  *const adsCellId = @"AdsTableViewCell";
static NSString  *const mallCellId = @"MallViewCell";
static NSString  *const typeCellId = @"TypeTableViewCell";
static NSString  *const floorCellId = @"FloorCell";
static NSString  *const proCellId = @"ProductCell";

- (NSMutableArray *)imageArray
{
    if (_imageArray==nil) {
        _imageArray = [NSMutableArray array];
    }
    return _imageArray;
}

- (SigninView *)signinView
{
    if (_signinView==nil) {
        CGFloat height = [UIImage imageNamed:@"轮播默认图"].size.height * AdsSliderWH / 2;
        CGFloat x = self.view.width - 100;
        CGFloat y = 64;
        _signinView = [[SigninView alloc]initWithFrame:CGRectMake(x, y, 100, height)];
        _signinView.delegate = self;
    }
    return _signinView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Home";
    
    //导航栏
    [self setupNav];
    //界面设置
    [self setupContent];
    //刷新控件
    [self setupRefresh];
    //加载数据
    [self setupData];
}
#pragma mark - 刷新控件
- (void)setupRefresh
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
}

- (void)loadNewData
{
    //商城首页轮播图
    [self getIndexAppLunBoList];
    //商城首页内容
    [self getIndexAppBList];
}

#pragma mark - 加载数据
- (void)setupData
{
    
}
#pragma mark - 商城首页内容
- (void)getIndexAppBList
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
    });
}

#pragma mark - 商城首页轮播图
- (void)getIndexAppLunBoList
{
    
}

#pragma mark - UITableView代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            AdsTableViewCell *adsCell = [tableView dequeueReusableCellWithIdentifier:adsCellId];
            if (!adsCell) {
                adsCell = [[AdsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:adsCellId];
            }
            [adsCell adsTableViewCellWithAdsArray:nil];
            return adsCell;
        }else {
            TypeTableViewCell *typeCell = [tableView dequeueReusableCellWithIdentifier:typeCellId];
            if (!typeCell) {
                typeCell = [[TypeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:typeCellId];
            }
            return typeCell;
        }
    }else if (indexPath.section == 1) {
        MallViewCell *mallCell = [tableView dequeueReusableCellWithIdentifier:mallCellId];
        if (!mallCell) {
            mallCell = [[MallViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:mallCellId];
        }
        return mallCell;
    }else {
        if (indexPath.row == 0) {
            FloorCell *floorCell = [tableView dequeueReusableCellWithIdentifier:floorCellId];
            if (!floorCell) {
                floorCell = [[FloorCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:floorCellId];
            }
            return floorCell;
        }else {
            ProductCell *prodCell = [tableView dequeueReusableCellWithIdentifier:proCellId];
            if (!prodCell) {
                prodCell = [[ProductCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:proCellId];
            }
            prodCell.delegate = self;
            
            return prodCell;
        }
    }
}

- (void)productCellWithModel
{
    GoodsDetallViewController *goodsDetail = [[GoodsDetallViewController alloc] init];
    [self.navigationController pushViewController:goodsDetail animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {//搜索框
        UIView *searchView = [[UIView alloc]init];
        searchView.backgroundColor = [UIColor whiteColor];
        searchView.frame = CGRectMake(0, 0, self.view.width,45);
        YYJTextFiled *searchBar = [[YYJTextFiled alloc] init];
        [searchBar setBackground:[UIImage imageNamed:@"搜索框背景"]];
        searchBar.x = 15;
        searchBar.width = ScreenWidth - 30;
        searchBar.height = [UIImage imageNamed:@"搜索框背景"].size.height;
        searchBar.center = searchView.center;
        [searchBar imageViewWith:@"搜索图标"];
        searchBar.font = Font(15);
        searchBar.placeholder = @"搜索商品";
        searchBar.delegate = self;
        [searchView addSubview:searchBar];
        return searchView;
    }else if (section == 1) {
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
        bgView.backgroundColor = [UIColor colorWithHexString:@"#F0F0F0"];
        return bgView;
    }else {
        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
        lable.backgroundColor = [UIColor colorWithHexString:@"#F0F0F0"];
        lable.text = [NSString stringWithFormat:@"——— 产品%ld ———",section-2];
        lable.textColor = [UIColor colorWithHexString:@"#333333"];
        lable.font = Font(15);
        lable.textAlignment = NSTextAlignmentCenter;
        return lable;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 45.0f;
    }else if (section == 1) {
        return 20.0f;
    }else {
        return 40.0f;
    }
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
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return [UIImage imageNamed:@"轮播默认图"].size.height * AdsSliderWH;
        }else {
            return 177;
        }
    }else if (indexPath.section == 1) {
        return 200 * AdsSliderWH;
    }else {
        if (indexPath.row == 0) {
            return 130 * AdsSliderWH;
        }else {
            return 265 * AdsSliderWH;
        }
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }else if (section == 1) {
        return 1;
    }else {
        /** 第一行广告1列 之后每行2列 */
        return 3;
    }
}

#pragma mark -- 界面设置
- (void)setupContent
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NavGaitonBarH, ScreenWidth, ScreenHeight-NavGaitonBarH) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    tableView.backgroundColor = [UIColor colorWithHexString:@"#F0F0F0"];
    [tableView registerNib:[UINib nibWithNibName:adsCellId bundle:nil] forCellReuseIdentifier:adsCellId];
    [tableView registerNib:[UINib nibWithNibName:typeCellId bundle:nil] forCellReuseIdentifier:typeCellId];
    [tableView registerNib:[UINib nibWithNibName:mallCellId bundle:nil] forCellReuseIdentifier:mallCellId];
    [tableView registerNib:[UINib nibWithNibName:floorCellId bundle:nil] forCellReuseIdentifier:floorCellId];
    [tableView registerNib:[UINib nibWithNibName:proCellId bundle:nil] forCellReuseIdentifier:proCellId];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.tableFooterView = [UIView new];
    self.tableView = tableView;
    [self.view addSubview:tableView];
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [textField endEditing:YES];
    
//    SearchViewController *svc = [[SearchViewController alloc]init];
//    [self.navigationController pushViewController:svc animated:NO];
}

#pragma mark -- 导航栏
- (void)setupNav
{
    //右边按钮
    UIButton *btn = [[UIButton alloc]init];
    [btn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"rightItem"] forState:UIControlStateNormal];
    btn.size = CGSizeMake(btn.currentBackgroundImage.size.width, btn.currentBackgroundImage.size.width);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
}

- (void)rightBtnClick:(UIButton *)button
{
    button.selected = !button.isSelected;
    if (button.selected) {
        [self.view addSubview:self.signinView];
    }else{
        [self.signinView removeFromSuperview];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
