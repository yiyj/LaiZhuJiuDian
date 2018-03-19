//
//  SigninView.h
//  HuaShang
//
//  Created by apple on 16/8/1.
//  Copyright © 2016年 Chainsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum{
    SigninViewButtonTypeSignin,
    SigninViewButtonTypeRichScan,
    SigninViewButtonTypeCoupon
    
} SigninViewButtonType;

@class SigninView;

@protocol SigninViewButtonClickDelegate <NSObject>

@optional

- (void)signinView:(SigninView *)signView didClickButton:(SigninViewButtonType)buttonType;

@end


@interface SigninView : UIView

@property(nonatomic,weak) id<SigninViewButtonClickDelegate> delegate;

@end
