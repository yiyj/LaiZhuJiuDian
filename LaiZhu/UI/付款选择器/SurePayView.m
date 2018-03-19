//
//  SurePayView.m
//  LaiZhu
//
//  Created by apple on 2018/2/9.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "SurePayView.h"

@implementation SurePayView

//全局变量
static SurePayView *_payView;

- (instancetype)initWithStore:(NSString *)store payMoney:(NSString *)money payWay:(NSString *)way
{
    if (self=[super init]) {
        self.frame = [[UIScreen mainScreen] bounds];
        self.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.5];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
//        [self addGestureRecognizer:tap];
        
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(38*AdsSliderWH, 0, ScreenWidth-76*AdsSliderWH, 185)];
        bgView.backgroundColor = [UIColor lightGrayColor];
        bgView.centerY = self.centerY;
        [self addSubview:bgView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, bgView.width, 40)];
        label.backgroundColor = [UIColor whiteColor];
        label.text = @"pay";
        label.font = Font(15);
        label.textAlignment = NSTextAlignmentCenter;
        [bgView addSubview:label];
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth-76*AdsSliderWH-35, 0, 40, label.height)];
        [button setImage:[UIImage imageNamed:@"XCancel"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:button];
        
        CGFloat height = [StringTool sizeWithTitle:store andFont:Font(13) andSize:CGSizeMake(bgView.width, 42) lineSpaceing:0 FiretLineHeadeIndex:0].height;
        UILabel *storeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(label.frame)+2, bgView.width, height)];
        storeLabel.backgroundColor = [UIColor whiteColor];
        storeLabel.text = store;
        storeLabel.font = Font(13);
        storeLabel.numberOfLines = 2;
        storeLabel.textColor = [UIColor colorWithHexString:@"#666666"];
        storeLabel.textAlignment = NSTextAlignmentCenter;
        [bgView addSubview:storeLabel];
        
        UILabel *moneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(storeLabel.frame), bgView.width, 35)];
        moneyLabel.backgroundColor = [UIColor whiteColor];
        moneyLabel.text = money;
        moneyLabel.font = Font(21);
        moneyLabel.textAlignment = NSTextAlignmentCenter;
        [bgView addSubview:moneyLabel];
        
        UIButton *btn = [self creatButtonWithImage:way text:way Tag:1001];
        btn.y = CGRectGetMaxY(moneyLabel.frame) + 0.3;
        [bgView addSubview:btn];
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"余额箭头"]];
        imageView.size = [UIImage imageNamed:@"余额箭头"].size;
        imageView.x = bgView.width * 3/4;
        imageView.centerY = btn.centerY;
        [bgView addSubview:imageView];
        
        UIButton *sureBtn = [self creatButtonWithImage:@"确认支付" text:nil Tag:1002];
        sureBtn.y = CGRectGetMaxY(btn.frame) + 0.5;
        [bgView addSubview:sureBtn];
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
    if (tag == 1002) {
        
    }else{
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    }
    btn.tag = tag;
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

- (void)buttonClick:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(sureButtonClick:)]) {
        [self.delegate sureButtonClick:sender.titleLabel.text];
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
