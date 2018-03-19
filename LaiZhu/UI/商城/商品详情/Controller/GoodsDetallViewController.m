//
//  GoodsDetallViewController.m
//  LaiZhu
//
//  Created by apple on 2018/2/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "GoodsDetallViewController.h"

@interface GoodsDetallViewController ()

@end

@implementation GoodsDetallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"GoodsDetail";
    //导航栏设置
    [self setUpNav];
    //底部按钮(客服 购物车 加入购物车 立即购买)
    [self setUpBottomButton];
    
}

#pragma mark - 底部按钮(客服 购物车 加入购物车 立即购买)
- (void)setUpBottomButton
{
    //客服
    [self setButtonWithTag:1001 image:@"商品详情客服" backImage:nil];
    //购物车
    [self setButtonWithTag:1002 image:@"商品详情购物车" backImage:nil];
    //加入购物车
    [self setButtonWithTag:1003 image:nil backImage:@"加入购物车"];
    //立即购买
    [self setButtonWithTag:1004 image:@"立即购买" backImage:@"立即购买"];
}

- (void)bottomButtonClick:(UIButton *)button
{
    if (button.tag == 1001) {//客服
        
    }else if(button.tag == 1002){//购物车
        
    }else  if (button.tag == 1003) { //加入购物车
        
        
    }else {//立即购买
        
    }
}

- (UIButton *)setButtonWithTag:(NSInteger)tag image:(NSString *)imageStr backImage:(NSString *)backImageStr
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (tag == 1001) {
        button.x = 0;
    }else if (tag == 1002) {
        button.x = ScreenWidth * 0.2;
    }else if (tag == 1003) {
        button.x = ScreenWidth * 0.4;
    }else{
        button.x = ScreenWidth * 0.7;
    }
    if (tag == 1001 || tag == 1002) {
        button.width = ScreenWidth * 0.2;
        button.layer.borderWidth = .25;
        button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }else {
        button.width = ScreenWidth * 0.3;
    }
    
    button.height = 45;
    button.y = ScreenHeight - 45;
    [button setImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:backImageStr] forState:UIControlStateNormal];
    button.tag = tag;
    [button addTarget:self action:@selector(bottomButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    return button;
}

#pragma mark - 导航栏设置
- (void)setUpNav
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(toolItemClick) image:@"导航栏返回" highImage:nil];
}

- (void)toolItemClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
