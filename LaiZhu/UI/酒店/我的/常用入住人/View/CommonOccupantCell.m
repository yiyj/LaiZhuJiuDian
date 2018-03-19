//
//  CommonOccupantCell.m
//  LaiZhu
//
//  Created by apple on 2018/3/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "CommonOccupantCell.h"

@interface CommonOccupantCell()

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *tellphone;

@end

@implementation CommonOccupantCell


- (IBAction)editClick:(UIButton *)sender {
    
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
