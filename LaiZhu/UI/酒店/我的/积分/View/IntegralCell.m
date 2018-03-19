//
//  IntegralCell.m
//  LaiZhu
//
//  Created by apple on 2018/3/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "IntegralCell.h"

@interface IntegralCell()

@property (weak, nonatomic) IBOutlet UILabel *companyName;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *intergal;

@end

@implementation IntegralCell

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
