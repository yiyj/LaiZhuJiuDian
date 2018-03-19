//
//  AdsTableViewCell.h
//  LaiZhu
//
//  Created by apple on 2018/1/30.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdsTableViewCell : UITableViewCell<SDCycleScrollViewDelegate>
/** 轮播图 */
@property (weak, nonatomic) IBOutlet SDCycleScrollView *cycView;

- (void)adsTableViewCellWithAdsArray:(NSMutableArray *)array;

@end
