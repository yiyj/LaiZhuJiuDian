//
//  OrderRomsCell.h
//  LaiZhu
//
//  Created by apple on 2018/2/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OrderRomsCellDelegate <NSObject>


/**
 改变选中房间数代理协议

 @param height 改变Super CEll视图高度
 @param indexPath Super CEll定位
 @param persons 改变Super CEll中入驻人姓名填写数
 */
- (void)orderRomsCellWithHeight:(CGFloat)height indexPath:(NSIndexPath *)indexPath peoples:(NSInteger)persons;

@end

@interface OrderRomsCell : UITableViewCell

@property (weak, nonatomic) id<OrderRomsCellDelegate>delegate;
/** 房间数 */
@property (weak, nonatomic) IBOutlet UILabel *romNumber;

- (void)orderRomsCellWithNumber:(NSInteger)num indexPath:(NSIndexPath *)indexPath;

@end
