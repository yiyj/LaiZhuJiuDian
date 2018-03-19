//
//  OrderViewController.m
//  LaiZhu
//
//  Created by apple on 2018/2/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "OrderViewController.h"
#import "AllOrderViewController.h"//全部订单
#import "WaiterViewController.h"//待付款
#import "WaiterEnterViewController.h"//待入住
#import "WaiterEvaluationViewController.h"//待评价

static CGFloat const btnHeight = 46;

@interface OrderViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *btnScrollView;
@property (nonatomic,assign) CGFloat btnW;
@property (nonatomic,strong) NSArray *titleArray;
@property (nonatomic,strong) UIButton *selectBtn;
@property (nonatomic,strong) UIView *sliderView;
@property (nonatomic,strong) UIScrollView *childScrollView;
@property (nonatomic,strong) NSArray *subViewControllers;

@end

@implementation OrderViewController
- (NSArray *)titleArray
{
    if (!_titleArray) {
        
        _titleArray = @[@"Full order",@"obligations",@"Stay in",@"Evaluated",];
    }
    return _titleArray;
}

- (NSArray *)subViewControllers
{
    if (!_subViewControllers) {
        
        AllOrderViewController *allVC = [[AllOrderViewController alloc] init];
        WaiterViewController *payVC = [[WaiterViewController alloc] init];
        WaiterEnterViewController *enterVC = [[WaiterEnterViewController alloc] init];
        WaiterEvaluationViewController *evaluationVC = [[WaiterEvaluationViewController alloc] init];
        
        _subViewControllers = @[allVC,payVC,enterVC,evaluationVC];
    }
    return _subViewControllers;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Order";
    self.automaticallyAdjustsScrollViewInsets = NO;
    //标题按键导航条
    [self addTopBar];
    //添加标题按键下滑块
    [self addSliderView];
    //添加子控制器
    [self addChildVCView];
    
    //选择标题按键对应类型
//    [self endSubViewControllersWithButton:self.tag];
}

#pragma mark -- 标题按键导航条设置
- (void)addTopBar
{
    //标题按键导航条设置
    UIScrollView *btnScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, NavGaitonBarH, ScreenWidth, btnHeight)];
    btnScrollView.bounces = NO;
    btnScrollView.showsVerticalScrollIndicator = NO;
    btnScrollView.showsHorizontalScrollIndicator = NO;
    self.btnScrollView = btnScrollView;
    [self.view addSubview:self.btnScrollView];
    //按键大小设置
    if (self.titleArray.count >= 4) {
        self.btnW = ScreenWidth / 4;
    }else{
        self.btnW = ScreenWidth / self.titleArray.count;
    }
    //添加标题按键
    for (int i = 0; i < self.titleArray.count; i++) {
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(self.btnW * i, 0, self.btnW, btnHeight)];
        [btn setTitle:self.titleArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithHexString:@"#bfa276"] forState:UIControlStateSelected];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        btn.tag = 1000+i;
        [btn addTarget:self action:@selector(selectViewClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.btnScrollView addSubview:btn];
        
        if (i == 0) {
            btn.selected = YES;
            //默认one文字放大
            btn.transform = CGAffineTransformMakeScale(1.2, 1.2);
            self.selectBtn = btn;
        }
    }
    //底部分割线设置
    UIImageView *lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, btnHeight-0.5, self.btnW * self.subViewControllers.count, 0.5)];
    lineImage.backgroundColor = [UIColor grayColor];
    [self.btnScrollView addSubview:lineImage];
    self.btnScrollView.contentSize = CGSizeMake(self.btnW * self.titleArray.count, btnHeight);

}

#pragma mark -- 添加标题按键下滑块
- (void)addSliderView
{
    UIView *sliderView = [[UIView alloc] initWithFrame:CGRectMake(0, btnHeight-1, self.btnW, 1)];
    sliderView.backgroundColor = [UIColor colorWithHexString:@"#bfa276"];
    self.sliderView = sliderView;
    [self.btnScrollView addSubview:self.sliderView];
}

#pragma mark -- 标题按键点击事件
- (void)selectViewClick:(UIButton *)btn
{
    if (btn.selected) {
        return;
    }
    self.selectBtn.selected = NO;
    self.selectBtn.transform = CGAffineTransformIdentity;
    btn.selected = YES;
    self.selectBtn = btn;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.sliderView.frame = CGRectMake(btn.frame.origin.x, btnHeight-1, self.btnW, 1);
        btn.transform = CGAffineTransformMakeScale(1.2, 1.2);
    }];
    
    //判断导航条是否移动
    CGFloat maxX = CGRectGetMaxX(self.sliderView.frame);
    if (maxX >= ScreenWidth && btn.tag != self.subViewControllers.count + 1000 -1) {
        [UIView animateWithDuration:0.25 animations:^{
            //偏移
            self.btnScrollView.contentOffset = CGPointMake(maxX - ScreenWidth + self.btnW, 0);
        }];
    }else if (maxX < ScreenWidth){
        [UIView animateWithDuration:0.25 animations:^{
            //偏移
            self.btnScrollView.contentOffset = CGPointMake(0, 0);
        }];
    }else if (maxX > ScreenWidth && btn.tag == self.subViewControllers.count + 1000 -1){
        
        self.btnScrollView.contentOffset = CGPointMake(maxX - ScreenWidth, 0);
    }
    
    //偏移定位子控制器位置
    self.childScrollView.contentOffset = CGPointMake(ScreenWidth * (btn.tag - 1000), 0);
    
}

#pragma mark -- 添加子控制器
- (void)addChildVCView
{
    UIScrollView *childScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.btnScrollView.frame), ScreenWidth, ScreenHeight -CGRectGetMaxY(self.btnScrollView.frame))];
    childScrollView.delegate = self;
    childScrollView.bounces = NO;
    childScrollView.showsHorizontalScrollIndicator = NO;
    childScrollView.showsVerticalScrollIndicator = NO;
    childScrollView.pagingEnabled = YES;
    self.childScrollView = childScrollView;
    [self.view addSubview:self.childScrollView];
    
    for (int i = 0; i < self.subViewControllers.count; i++) {
        
        UIViewController *subVC = self.subViewControllers[i];
        subVC.view.frame = CGRectMake(ScreenWidth * i, 0, ScreenWidth, CGRectGetHeight(self.childScrollView.frame));
        //        [self addChildViewController:subVC];
        [self.childScrollView addSubview:subVC.view];
    }
    
    self.childScrollView.contentSize = CGSizeMake(ScreenWidth * self.subViewControllers.count, ScreenHeight - CGRectGetMaxY(self.btnScrollView.frame));
}

#pragma mark -- UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //滑动导航条
    self.sliderView.frame = CGRectMake(scrollView.contentOffset.x / ScreenWidth * self.btnW, btnHeight-1, self.btnW, 1);
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat offX =  scrollView.contentOffset.x;
    int tag = (int)(offX /ScreenWidth) + 1000;
    UIButton *btn = [self.view viewWithTag:tag];
    if(tag != self.selectBtn.tag){
        
        [self selectViewClick:btn];
    }
}

#pragma mark -- 选择标题按键对应类型
- (void)endSubViewControllersWithButton:(NSInteger)tag
{
    UIButton *btn = [self.view viewWithTag:tag];
    [self selectViewClick:btn];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
