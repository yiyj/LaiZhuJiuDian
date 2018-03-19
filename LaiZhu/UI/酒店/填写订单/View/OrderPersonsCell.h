//
//  OrderPersonsCell.h
//  LaiZhu
//
//  Created by apple on 2018/2/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OrderPersonsCellDelegate <NSObject>

- (void)orderPersonsCellWithHeight:(CGFloat)height indexPath:(NSIndexPath *)indexPath;

@end

@interface OrderPersonsCell : UITableViewCell

@property (weak, nonatomic) id<OrderPersonsCellDelegate>delegate;

- (void)orderPersonsCellWithArray:(NSArray *)names indexPath:(NSIndexPath *)indexPath;

@end
