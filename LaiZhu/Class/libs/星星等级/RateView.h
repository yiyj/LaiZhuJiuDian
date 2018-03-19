//
//  RateView.h
//  星星等级封装参考修改
//
//  Created by apple on 2017/5/14.
//  Copyright © 2017年 易元江. All rights reserved.
//

#import <UIKit/UIKit.h>

#if !__has_feature(objc_arc)
#error RateView requires ARC. Please turn on ARC for your project or \
add -fobjc-arc flag for RateView.m file in Build Phases -> Compile Sources.
#endif

typedef enum
{
    StarFillModeInvalid = 0,
    StarFillModeHorizontal,
    StarFillModeVertical,
    StarFillModeAxial
}StarFillMode;

@class RateView;
@protocol RateViewDelegate <NSObject>

@optional
-(void)rateView:(RateView*)rateView didUpdateRating:(float)rating;

@end

@interface RateView : UIView

// Rating to be used with RateView (0.0 to 5.0)
@property(nonatomic,assign)float rating;

// User can rate using rate view or not (Permission flag)
@property(nonatomic,assign)BOOL canRate;

// Rating step when user can rate (0.0 to 1.0)
@property(nonatomic,assign)float step;

// Star Normal, Fill & Border Colors
@property(nonatomic,strong)UIColor* starNormalColor;
@property(nonatomic,strong)UIColor* starFillColor;
@property(nonatomic,strong)UIColor* starBorderColor;

// Star Fill modes Horizontal, Vertical or Axial, starSize in points StarCount
@property(nonatomic,assign)StarFillMode starFillMode;
@property(nonatomic,assign)CGFloat starSize;
@property(nonatomic,assign)CGFloat duraingSize;
@property(nonatomic,assign)NSInteger count;

// RateViewDelegate, register in order to listen to rating changes
@property(nonatomic,weak)id<RateViewDelegate> delegate;

// Class Helper for Rate View instantiation
+(RateView*)rateViewWithRating:(float)rating;


@end
