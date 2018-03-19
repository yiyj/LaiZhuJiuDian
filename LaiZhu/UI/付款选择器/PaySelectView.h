//
//  PaySelectView.h
//  LaiZhu
//
//  Created by apple on 2018/2/8.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PaySelectViewDelegate <NSObject>

- (void)payWithPayStr:(NSString *)pay;

@end

@interface PaySelectView : UIView

@property (weak, nonatomic) id<PaySelectViewDelegate>delegate;

+ (instancetype)shareInstance;

- (void)show;

- (void)dismiss;

@end
