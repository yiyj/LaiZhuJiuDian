//
//  CouponViewController.m
//  LaiZhu
//
//  Created by apple on 2018/2/28.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "CouponViewController.h"

//获取控制器的宽高
#define MeH self.view.frame.size.height
#define MeW self.view.frame.size.width

@interface CouponViewController ()

@end

@implementation CouponViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"优惠券";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#EAEAEA"];
    
}

-(instancetype)initWithAddVCARY:(NSArray *)VCS TitleS:(NSArray *)TitleS{
    if (self = [super init]) {
        
        _VCArray = VCS;
        _TitleAry = TitleS;
        
        //先初始化各个界面
        UIView *HSView  = [[UIView alloc] initWithFrame:CGRectMake(0, 1, MeW, 40)];
        HSView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:HSView];
        
        UIImageView *line1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0.5)];
        line1.backgroundColor = [UIColor grayColor];
        line1.alpha = 0.6;
        [HSView addSubview:line1];
        
        for (int i = 0 ; i<_VCArray.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(i*(MeW/_VCArray.count), 0, MeW/_VCArray.count, HSView.frame.size.height-2);
            [btn setTitle:_TitleAry[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor colorWithHexString:@"#bfa276"] forState:UIControlStateSelected];
            btn.tag = 1000+i;
            btn.titleLabel.font = Font(15);
            [btn addTarget:self action:@selector(SeleScrollBtn:) forControlEvents:UIControlEventTouchUpInside];
            [HSView addSubview:btn];
        }
        
        _LineView = [[UIView alloc] initWithFrame:CGRectMake(0, HSView.frame.size.height-2, MeW/_VCArray.count, 2)];
        _LineView.backgroundColor = [UIColor colorWithHexString:@"#bfa276"];
        [HSView addSubview:_LineView];
        
        UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_LineView.frame), self.view.frame.size.width, 0.5)];
        line.backgroundColor = [UIColor grayColor];
        line.alpha = 0.6;
        [self.view addSubview:line];
        
        _MeScroolView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(line.frame), MeW, MeH-HSView.frame.size.height-64)];
        _MeScroolView.backgroundColor = [UIColor whiteColor];
        _MeScroolView.pagingEnabled = YES;
        _MeScroolView.delegate = self;
        [self.view addSubview:_MeScroolView];
        //添加View
        for (int j = 0; j<_VCArray.count; j++) {
            UIView *view = [[_VCArray objectAtIndex:j] view];
            view.frame = CGRectMake(j*MeW, 0, MeW, _MeScroolView.frame.size.height);
            [_MeScroolView addSubview:view];
            [self addChildViewController:[_VCArray objectAtIndex:j]];
        }
        [_MeScroolView setContentSize:CGSizeMake(MeW*_VCArray.count, _MeScroolView.frame.size.height)];
        
    }
    return self;
}

/**
 *  滚动停止调用
 *
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int index = scrollView.contentOffset.x/scrollView.frame.size.width;
    
    /**
     *  此方法用于改变x轴
     */
    [UIView animateWithDuration:0.3 animations:^{
        CGRect f = _LineView.frame;
        f.origin.x = index*(MeW/_VCArray.count);
        _LineView.frame = f;
    }];
    
    UIButton *btn = [self.view viewWithTag:1000+index];
    for (UIButton *b in btn.superview.subviews) {
        if ([b isKindOfClass:[UIButton class]]) {
            b.selected = (b==btn)?YES:NO;
        }
    }
}


//点击每个按钮然后选中对应的scroolview页面及选中按钮
-(void)SeleScrollBtn:(UIButton*)btn{
    for (UIButton *button in btn.superview.subviews)
    {
        if ([button isKindOfClass:[UIButton class]]) {
            button.selected = (button != btn) ? NO : YES;
        }
    }
    [UIView animateWithDuration:0.3 animations:^{
        CGRect f = _LineView.frame;
        f.origin.x = (btn.tag-1000)*(MeW/_VCArray.count);
        _LineView.frame = f;
        _MeScroolView.contentOffset = CGPointMake((btn.tag-1000)*MeW, 0);
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
