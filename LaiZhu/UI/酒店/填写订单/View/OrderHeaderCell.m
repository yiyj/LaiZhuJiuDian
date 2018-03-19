//
//  OrderHeaderCell.m
//  LaiZhu
//
//  Created by apple on 2018/2/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "OrderHeaderCell.h"

@interface OrderHeaderCell()

/** 店名 */
@property (weak, nonatomic) IBOutlet UILabel *storeName;
/** 套房类型 */
@property (weak, nonatomic) IBOutlet UILabel *houseType;
/** 时间区间 */
@property (weak, nonatomic) IBOutlet UILabel *timeDuring;

@end

@implementation OrderHeaderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.accessoryType = UITableViewCellAccessoryNone;
    // Configure the view for the selected state
}

@end
