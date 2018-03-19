//
//  JDetaillInformCell.m
//  LaiZhu
//
//  Created by apple on 2018/2/25.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "JDetaillInformCell.h"

@interface JDetaillInformCell()

@property (weak, nonatomic) IBOutlet UILabel *infromLabel;

@end

@implementation JDetaillInformCell

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
