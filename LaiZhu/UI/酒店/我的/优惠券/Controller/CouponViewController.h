//
//  CouponViewController.h
//  LaiZhu
//
//  Created by apple on 2018/2/28.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavGationViewController.h"

@interface CouponViewController : NavGationViewController<UIScrollViewDelegate>
{
    NSArray  *_VCArray;
    NSArray  *_TitleAry;
    UIView   *_LineView;
    UIScrollView *_MeScroolView;
}

- (instancetype)initWithAddVCARY:(NSArray*)VCS TitleS:(NSArray*)TitleS;


@end
