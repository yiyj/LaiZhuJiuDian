//
//  FloorCell.m
//  LaiZhu
//
//  Created by apple on 2018/1/30.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "FloorCell.h"

@interface FloorCell()

@property (weak, nonatomic) IBOutlet UILabel *jianShao;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *detaill;
@property (weak, nonatomic) IBOutlet UIImageView *rightImage;

@end

@implementation FloorCell

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
