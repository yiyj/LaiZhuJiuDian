//
//  OrderCostInfroCell.m
//  LaiZhu
//
//  Created by apple on 2018/2/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "OrderCostInfroCell.h"

@interface OrderCostInfroCell()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *price;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *romNuber;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *money;

@end

@implementation OrderCostInfroCell

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
