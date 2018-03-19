//
//  ImgTableViewCell.m
//  LaiZhu
//
//  Created by apple on 2018/2/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ImgTableViewCell.h"

@interface ImgTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imgCell;

@end

@implementation ImgTableViewCell

- (void)imgTableViewCellWithString:(NSString *)img
{
    [self.imgCell sd_setImageWithURL:[NSURL URLWithString:img] placeholderImage:[UIImage imageNamed:@"ImgCell"]];
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
