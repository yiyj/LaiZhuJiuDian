//
//  PaySelectView.m
//  LaiZhu
//
//  Created by apple on 2018/2/8.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "PaySelectView.h"

@interface PaySelectView()

@end

@implementation PaySelectView

//全局变量
static PaySelectView *_payView;

//单例方法
+ (instancetype)shareInstance
{
    //只进行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _payView = [[self alloc] init];
    });
    
    return _payView;
}
- (instancetype)init
{
    if (self=[super init]) {
        self.frame = [[UIScreen mainScreen] bounds];
        self.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.5];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
//        [self addGestureRecognizer:tap];
        
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(38*AdsSliderWH, 0, ScreenWidth-76*AdsSliderWH, 175)];
        bgView.backgroundColor = [UIColor lightGrayColor];
        bgView.centerY = self.centerY;
        [self addSubview:bgView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, bgView.width, 40)];
        label.backgroundColor = [UIColor whiteColor];
        label.text = @"Payment method";
        label.font = Font(15);
        label.textAlignment = NSTextAlignmentCenter;
        [bgView addSubview:label];
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth-76*AdsSliderWH-35, 0, 40, label.height)];
        [button setImage:[UIImage imageNamed:@"XCancel"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:button];
        
        UIButton *yueBtn = [self creatButtonWithImage:@"余额" text:@"Balance" Tag:1001];
        yueBtn.y = CGRectGetMaxY(button.frame) + 0.5;
        [bgView addSubview:yueBtn];
        
        UIButton *payBtn = [self creatButtonWithImage:@"支付宝" text:@"Alipay" Tag:1002];
        payBtn.y = CGRectGetMaxY(yueBtn.frame) + 0.5;
        [bgView addSubview:payBtn];
        
        UIButton *weiXinBtn = [self creatButtonWithImage:@"微信" text:@"WeChat" Tag:1003];
        weiXinBtn.y = CGRectGetMaxY(payBtn.frame) + 0.5;
        [bgView addSubview:weiXinBtn];
    }
    return self;
}

- (UIButton *)creatButtonWithImage:(NSString *)imageName text:(NSString *)text Tag:(NSInteger)tag
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor whiteColor];
    btn.x = 0;
    btn.width = ScreenWidth-76*AdsSliderWH;
    btn.height = 45;
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setTitle:text forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//居左显示
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    if (tag == 1002) {
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
    }
    btn.tag = tag;
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

- (void)buttonClick:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(payWithPayStr:)]) {
        [self.delegate payWithPayStr:sender.titleLabel.text];
    }
    [self dismiss];
}

- (void)show
{
    UIWindow *window = [[UIApplication sharedApplication] windows].lastObject;
    [window addSubview:self];
}

- (void)dismiss
{
    [self removeFromSuperview];
}

@end
