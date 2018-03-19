//
//  JDetailViewController.m
//  LaiZhu
//
//  Created by apple on 2018/2/25.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "JDetailViewController.h"
#import "JDetaillCycCell.h"
#import "JDetaillImgCell.h"
#import "JDetaillInformCell.h"

static NSString  *const detaillCycCellId = @"JDetaillCycCell";
static NSString  *const detaillImgeCellId = @"JDetaillImgCell";
static NSString  *const informCellId = @"JDetaillInformCell";

@interface JDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;
//轮播图片数组
@property(nonatomic,strong)NSMutableArray *imageArray;
@property(nonatomic,strong)NSMutableArray *adsArray;

@end

@implementation JDetailViewController
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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Hotel Details";
    //导航栏
    [self setupNav];
    //界面设置
    [self setupContent];

}
#pragma mark - UITableView代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        JDetaillCycCell *adsCell = [tableView dequeueReusableCellWithIdentifier:detaillCycCellId];
        if (!adsCell) {
            adsCell = [[JDetaillCycCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:detaillCycCellId];
        }
        [adsCell cycTableViewCellWithAdsArray:self.imageArray];
        
        return adsCell;
        
    }else if (indexPath.section == 1){
        JDetaillImgCell *imgCell = [tableView dequeueReusableCellWithIdentifier:detaillImgeCellId];
        if (!imgCell) {
            imgCell = [[JDetaillImgCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:detaillImgeCellId];
        }
        
        [imgCell imgTableViewCellWithString:self.imageArray[indexPath.row]];
        
        return imgCell;
        
    }else {
        
        JDetaillInformCell *infromCell = [tableView dequeueReusableCellWithIdentifier:informCellId];
        if (!infromCell) {
            infromCell = [[JDetaillInformCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:informCellId];
        }
        
        return infromCell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return [UIImage imageNamed:@"酒店详情轮播图"].size.height * AdsSliderWH  + 110;
    }else if (indexPath.section == 1) {
        return 104;
    }else {
        return UITableViewAutomaticDimension;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else if (section == 1) {
        return self.imageArray.count;
    }else {
        return 1;
    }
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
    [tableView registerNib:[UINib nibWithNibName:detaillCycCellId bundle:nil] forCellReuseIdentifier:detaillCycCellId];
    [tableView registerNib:[UINib nibWithNibName:detaillImgeCellId bundle:nil] forCellReuseIdentifier:detaillImgeCellId];
    [tableView registerNib:[UINib nibWithNibName:informCellId bundle:nil] forCellReuseIdentifier:informCellId];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.tableFooterView = [UIView new];
    self.tableView = tableView;
    [self.view addSubview:tableView];
}

#pragma mark -- 导航栏
- (void)setupNav
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(popToViewController) image:@"导航栏返回" highImage:nil];
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
