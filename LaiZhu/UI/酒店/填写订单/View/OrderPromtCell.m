//
//  OrderPromtCell.m
//  LaiZhu
//
//  Created by apple on 2018/2/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "OrderPromtCell.h"

@interface OrderPromtCell()

@property (weak, nonatomic) IBOutlet UILabel *promt;

@end

@implementation OrderPromtCell

- (void)orderPromtCellWithContent:(NSString *)content
{
    self.promt.text = content;
}

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
