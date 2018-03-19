//
//  SurePayView.h
//  LaiZhu
//
//  Created by apple on 2018/2/9.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SurePayViewDelegate <NSObject>

- (void)sureButtonClick:(NSString *)pay;

@end

@interface SurePayView : UIView

@property (weak, nonatomic) id<SurePayViewDelegate>delegate;


/**
 支付

 @param store 酒店名
 @param money 支付金额
 @param way 支付方式
 @return 支付
 */
- (instancetype)initWithStore:(NSString *)store payMoney:(NSString *)money payWay:(NSString *)way;

- (void)show;

- (void)dismiss;

@end
