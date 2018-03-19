//
//  JDHomeViewController.m
//  LaiZhu
//
//  Created by apple on 2018/2/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "JDHomeViewController.h"
#import "CycTableViewCell.h"
#import "ImgTableViewCell.h"
#import "JDetailViewController.h"

static NSString  *const cycCellId = @"CycTableViewCell";
static NSString  *const imgeCellId = @"ImgTableViewCell";

@interface JDHomeViewController ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;
//轮播图片数组
@property(nonatomic,strong)NSMutableArray *imageArray;
@property(nonatomic,strong)NSMutableArray *adsArray;

@end

@implementation JDHomeViewController

#pragma mark - 懒加载
- (NSMutableArray *)imageArray
{
    if (_imageArray==nil) {
        _imageArray = [NSMutableArray arrayWithObjects:@"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4080833725,2827278465&fm=27&gp=0.jpg", @"http://img5.imgtn.bdimg.com/it/u=3278832849,3997171782&fm=27&gp=0.jpg", @"http://img4.imgtn.bdimg.com/it/u=2683661537,1868135799&fm=27&gp=0.jpg", nil];
    }
    return _imageArray;
}

- (NSMutableArray *)adsArray
{
    if (_adsArray==nil) {
        _adsArray = [NSMutableArray array];
    }
    return _adsArray;
}

- (NSMutableArray *)dataSource
{
    if (_dataSource==nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return YES; //YES：允许右滑返回  NO：禁止右滑返回
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //导航栏
    [self setupNav];
    //界面设置
    [self setupContent];
    //通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeOrdingTime:) name:@"OrdingTime" object:nil];
}

#pragma mark - 预定时间更改通知
- (void)changeOrdingTime:(NSNotification *)noti
{
    NSDictionary *dict = noti.userInfo;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    CycTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.orderTime.text = [NSString stringWithFormat:@"%@ -- %@",dict[@"Booked"],dict[@"Leaving"]];
}

#pragma mark - UITableView代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        CycTableViewCell *adsCell = [tableView dequeueReusableCellWithIdentifier:cycCellId];
        if (!adsCell) {
            adsCell = [[CycTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cycCellId];
        }
        [adsCell cycTableViewCellWithAdsArray:self.imageArray];
        return adsCell;
    }else {
        ImgTableViewCell *imgCell = [tableView dequeueReusableCellWithIdentifier:imgeCellId];
        if (!imgCell) {
            imgCell = [[ImgTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:imgeCellId];
        }
        
        [imgCell imgTableViewCellWithString:self.imageArray[indexPath.row - 1]];
        
        return imgCell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != 0) {
        JDetailViewController *jdetailvc = [[JDetailViewController alloc] init];
        [self.navigationController pushViewController:jdetailvc animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return [UIImage imageNamed:@"酒店轮播背景图"].size.height * AdsSliderWH  + 160;
    }else {
        return [UIImage imageNamed:@"ImgCell"].size.height * AdsSliderWH;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.imageArray.count + 1;
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
    //自动布局
    self.extendedLayoutIncludesOpaqueBars = YES;
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NavGaitonBarH, ScreenWidth, ScreenHeight-NavGaitonBarH - TarBarH) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [tableView registerNib:[UINib nibWithNibName:cycCellId bundle:nil] forCellReuseIdentifier:cycCellId];
    [tableView registerNib:[UINib nibWithNibName:imgeCellId bundle:nil] forCellReuseIdentifier:imgeCellId];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.tableFooterView = [UIView new];
    self.tableView = tableView;
    [self.view addSubview:tableView];
}
#pragma mark -- 导航栏
- (void)setupNav
{
    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth - 60*2, 30)];
    self.navigationItem.titleView = navView;
    //标题定位Title按键
    NSString *city = [[NSUserDefaults standardUserDefaults] objectForKey:@"city"];
    //字体长度
    float cityTitleSize = [StringTool sizeWithTitle:city andFont:Font(15) andSize:CGSizeMake(ScreenWidth-60*2, 20) lineSpaceing:0.0f FiretLineHeadeIndex:0.0f].width;
    if (city == nil || city.length == 0) {
        cityTitleSize = 60;
    }else{
        cityTitleSize = cityTitleSize + 25;
    }
    UIButton *cityBtn = [[UIButton alloc] init];
    cityBtn.x = (navView.bounds.size.width - cityTitleSize)/2;
    cityBtn.y = 0;
    cityBtn.width = cityTitleSize + [UIImage imageNamed:@"Location"].size.width;
    cityBtn.height = 30;
    [cityBtn setImage:[UIImage imageNamed:@"Location"] forState:UIControlStateNormal];
    [cityBtn setTitle:city forState:UIControlStateNormal];
    [cityBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    cityBtn.titleLabel.font = Font(15);
    //先设置按钮里面的内容居中
    cityBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //图标字体偏移设置
    [cityBtn setImageEdgeInsets:UIEdgeInsetsMake(3, cityTitleSize-10, 0, 0)];
    [cityBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [cityBtn addTarget:self action:@selector(positionCityButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:cityBtn];
}

#pragma mark -- 导航栏定位按钮点击事件
- (void)positionCityButtonClick:(UIButton *)sender
{
    [[LocationManager shareLocationManager] startLocationManager];
    
    NSString *city = [[NSUserDefaults standardUserDefaults] objectForKey:@"city"];
    [sender setTitle:city forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
