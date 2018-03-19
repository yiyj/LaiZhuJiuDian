
//
//  LeftCell.m
//  LaiZhu
//
//  Created by apple on 2018/1/31.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "LeftCell.h"

@interface LeftCell()

@property (weak, nonatomic) IBOutlet UILabel *catgreis;

@end

@implementation LeftCell

- (void)leftTypeCellWithModel:(NSString *)model
{
    self.catgreis.text = model;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor whiteColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    self.backgroundColor = selected ? RGBA(242, 242, 242, 1) : [UIColor whiteColor];

    // Configure the view for the selected state
}

@end
