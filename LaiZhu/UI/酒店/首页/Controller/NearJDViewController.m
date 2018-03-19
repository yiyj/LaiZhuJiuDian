//
//  NearJDViewController.m
//  LaiZhu
//
//  Created by apple on 2018/2/25.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NearJDViewController.h"
#import "NearJDCell.h"

static NSString  *const NearJDCellId = @"NearJDCell";

@interface NearJDViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation NearJDViewController

- (NSMutableArray *)dataSource
{
    if (_dataSource==nil) {
//        _dataSource = [NSMutableArray array];
        _dataSource = [NSMutableArray arrayWithObjects:@"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4080833725,2827278465&fm=27&gp=0.jpg", @"http://img5.imgtn.bdimg.com/it/u=3278832849,3997171782&fm=27&gp=0.jpg", @"http://img4.imgtn.bdimg.com/it/u=2683661537,1868135799&fm=27&gp=0.jpg", nil];
    }
    return _dataSource;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //导航栏
    [self setupNav];
    //界面设置
    [self setupContent];

    
}

#pragma mark - UITableView代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NearJDCell *cell = [tableView dequeueReusableCellWithIdentifier:NearJDCellId];
    if (!cell) {
        cell = [[NearJDCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NearJDCellId];
    }
    [cell nearJDTableViewCellWithImage:self.dataSource[indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    return [UIImage imageNamed:@"ImgCell"].size.height * AdsSliderWH + 100;
//    return 315;
    return UITableViewAutomaticDimension;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
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
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NavGaitonBarH, ScreenWidth, ScreenHeight-NavGaitonBarH) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [tableView registerNib:[UINib nibWithNibName:NearJDCellId bundle:nil] forCellReuseIdentifier:NearJDCellId];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.tableFooterView = [UIView new];
    tableView.estimatedRowHeight = 315;
    self.tableView = tableView;
    [self.view addSubview:tableView];
}
#pragma mark -- 导航栏
- (void)setupNav
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(popToViewController) image:@"导航栏返回" highImage:nil];
    
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

- (void)popToViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
