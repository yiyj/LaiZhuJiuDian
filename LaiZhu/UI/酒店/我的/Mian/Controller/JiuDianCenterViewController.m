//
//  JiuDianCenterViewController.m
//  LaiZhu
//
//  Created by apple on 2018/2/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "JiuDianCenterViewController.h"
#import "PerCenterCollectionViewCell.h"
#import "OrderFloorCollectionCell.h"
#import "OrdTypeCollectionViewCell.h"
#import "PersonalInforViewController.h"
#import "MyEvaluationViewController.h"
#import "CouponViewController.h"
#import "NoUserViewController.h"
#import "UserViewController.h"
#import "OverdueViewController.h"
#import "BillViewController.h"
#import "CommonlyEnterViewController.h"
#import "RuleViewController.h"
#import "IntegralViewController.h"

static NSString *HeaderID = @"header";
static NSString *FooterID = @"footer";
static NSString *pcellIndentifier = @"PerCenterCollectionViewCell";
static NSString *ocellIndentifier = @"OrderFloorCollectionCell";
static NSString *tcellIndentifier = @"OrdTypeCollectionViewCell";


@interface JiuDianCenterViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,PerCenterCollectionViewCellDelegate>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray *infromArray;
@property (nonatomic,strong) NSMutableArray *orderArray;
@property (nonatomic,strong) NSMutableArray *typeArray;

@end

@implementation JiuDianCenterViewController

- (NSMutableArray *)infromArray
{
    if (!_infromArray) {
        _infromArray = [NSMutableArray array];
    }
    return _infromArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.orderArray = [NSMutableArray arrayWithObjects:@"全部订单",@"待付款", @"待入住", @"待评价",  nil];
//    self.typeArray = [NSMutableArray arrayWithObjects:@"我的评价", @"优惠券", @"发票", @"常用入住人",@"规则", @"积分", nil];
    self.typeArray = [NSMutableArray arrayWithObjects:@"Evaluation", @"Coupon", @"Occupant",@"Rule", @"", @"", nil];
    //界面设置
    [self setupContent];
}

#pragma mark -- 界面设置
- (void)setupContent
{
    if (IS_IPhone5) {
        //自动布局
        self.extendedLayoutIncludesOpaqueBars = YES;
        if (@available(iOS 11.0, *)) {
            self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    UICollectionViewFlowLayout *flowyout = [[UICollectionViewFlowLayout alloc] init];
    flowyout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowyout.minimumLineSpacing = 1.0f;
    flowyout.minimumInteritemSpacing = 1.0f;
    //创建
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, NavGaitonBarH, ScreenWidth, ScreenHeight - NavGaitonBarH - 50) collectionViewLayout:flowyout];
    self.collectionView.backgroundColor = [UIColor colorWithHexString:@"#F0F0F0"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"PerCenterCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"PerCenterCollectionViewCell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"OrderFloorCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"OrderFloorCollectionCell"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeaderID];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FooterID];

    [self.view addSubview:self.collectionView];
    
}

#pragma mark - 代理方法
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0){
        PerCenterCollectionViewCell *perCell = [collectionView dequeueReusableCellWithReuseIdentifier:pcellIndentifier forIndexPath:indexPath];
        if (perCell == nil) {
            perCell = [[[NSBundle mainBundle] loadNibNamed:pcellIndentifier owner:self options:nil]firstObject];
        }
        perCell.delegate = self;
        return perCell;
        
    }else {
        OrderFloorCollectionCell *ordCell = [collectionView dequeueReusableCellWithReuseIdentifier:ocellIndentifier forIndexPath:indexPath];
        if (ordCell == nil) {
            ordCell = [[[NSBundle mainBundle] loadNibNamed:ocellIndentifier owner:self options:nil]firstObject];
        }
        NSArray *imags = @[@"我的评价", @"优惠券", @"常用入住人",@"规则",@"",@""];
        [ordCell orderFloorCollectionCellWithStr:self.typeArray[indexPath.row] imageName:imags[indexPath.row]];
        
        return ordCell;
    }
}

#pragma mark - 头像/个人信息
- (void)iconButtonClick:(UIButton *)btn
{
    PersonalInforViewController *perInfro = [[PersonalInforViewController alloc] init];
    [self.navigationController pushViewController:perInfro animated:YES];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 1) {
        if (indexPath.row == 0) { //我的评价
            MyEvaluationViewController *evaluation = [[MyEvaluationViewController alloc] init];
            [self.navigationController pushViewController:evaluation animated:YES];
        }else if (indexPath.row == 1) {//优惠券
            CouponViewController *scrollViewVC = [[CouponViewController alloc] initWithAddVCARY:@[[NoUserViewController new],[UserViewController new],[OverdueViewController new]]TitleS:@[@"NO Use",@"Used Records",@"Expired"]];
            [self.navigationController pushViewController:scrollViewVC animated:YES];
        }else if (indexPath.row == 2) {//常用入住人
            CommonlyEnterViewController *commonly = [[CommonlyEnterViewController alloc] init];
            [self.navigationController pushViewController:commonly animated:YES];
        }else if (indexPath.row == 3) {//规则
            RuleViewController *rule = [[RuleViewController alloc] init];
            [self.navigationController pushViewController:rule animated:YES];
        }else {
            //发票
//            BillViewController *bill = [[BillViewController alloc] init];
//            [self.navigationController pushViewController:bill animated:YES];
            //积分
//            IntegralViewController *integral = [[IntegralViewController alloc] init];
//            [self.navigationController pushViewController:integral animated:YES];
        }
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if (section == 1) {
        return 0.1f;
    }else {
        return 0.00f;
    }
}

// 视图(页眉或页脚)
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    // 如果当前想要的是头部视图
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeaderID forIndexPath:indexPath];
//        headerView.backgroundColor = [UIColor greenColor];
        return headerView;
    } else { // 返回每一组的尾部视图
        UICollectionReusableView *footerView =  [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FooterID forIndexPath:indexPath];
//        footerView.backgroundColor = [UIColor purpleColor];
        return footerView;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return CGSizeMake(ScreenWidth, 0);
    }else {
        return CGSizeMake(ScreenWidth, 10);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(ScreenWidth, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return CGSizeMake(ScreenWidth , [UIImage imageNamed:@"个人中心背景"].size.height * AdsSliderWH);
    }else {
        return CGSizeMake((ScreenWidth - 2)/3, 95);
    }
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else {
        return self.typeArray.count;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
