//
//  SigninView.m
//  HuaShang
//
//  Created by apple on 16/8/1.
//  Copyright © 2016年 Chainsoft. All rights reserved.
//

#import "SigninView.h"

@implementation SigninView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        [self setupBtn:@"华商切图_53" withTitle:@"签到" type:SigninViewButtonTypeSignin];
        [self setupBtn:@"华商切图_55" withTitle:@"扫一扫" type:SigninViewButtonTypeRichScan];
        [self setupBtn:nil withTitle:@"领取优惠券" type:SigninViewButtonTypeCoupon];
        
    }
    return self;
}

- (void)setupBtn:(NSString *)imageName withTitle:(NSString *)buttonTitle type:(SigninViewButtonType)type
{
    UIButton *btn = [[UIButton alloc]init];
    btn.backgroundColor = [UIColor whiteColor];
    
    if (type==SigninViewButtonTypeSignin) {
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0);
    }else if(type ==SigninViewButtonTypeRichScan){
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    }
    
    if (imageName) {
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    [btn setTitle:buttonTitle forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.tag = type;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:btn];
    
    if (type==SigninViewButtonTypeCoupon) {
        return;
    }else{
        
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor lightGrayColor];
        
        [self addSubview:view];
    }
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSUInteger count = self.subviews.count;
    CGFloat btnW = self.width;
    CGFloat btnH = self.height/3;
    for (NSUInteger i=0; i<count; i++) {
        
        UIView *subView = self.subviews[i];
        
        if ([subView isKindOfClass:[UIButton class]]) {
            subView.x = 0;
            subView.height = btnH;
            
            if(i==0){
                subView.y = 0;
            }else if (i==2) {
                subView.y = btnH *1;
            }else if(i==4){
                subView.y = btnH *2;
            }
            subView.width = btnW;
        }else{
            subView.x = 10;
            subView.height = 1;
            
            if (i==1) {
                subView.y = btnH-1;
            }else if(i==3){
                subView.y =btnH*2-1;
            }
            
            subView.width = btnW-20;
        }
    }
    
    
}


- (void)btnClick:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(signinView:didClickButton:)]) {
        [self.delegate signinView:self didClickButton:(int)button.tag];
    }
    [self removeFromSuperview];
}

@end
