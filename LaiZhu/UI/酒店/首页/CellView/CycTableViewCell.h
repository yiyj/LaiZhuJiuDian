//
//  CycTableViewCell.h
//  LaiZhu
//
//  Created by apple on 2018/2/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CycTableViewCell : UITableViewCell
/** 轮播图 */
@property (weak, nonatomic) IBOutlet SDCycleScrollView *cycView;
/** 搜索框 */
@property (weak, nonatomic) IBOutlet YYJTextFiled *search;
/** 预定时间 */
@property (weak, nonatomic) IBOutlet UILabel *orderTime;

- (void)cycTableViewCellWithAdsArray:(NSMutableArray *)images;

@end
