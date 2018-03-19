//
//  MallViewCell.m
//  LaiZhu
//
//  Created by apple on 2018/1/30.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MallViewCell.h"

@interface MallViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *leftImage;
@property (weak, nonatomic) IBOutlet UILabel *leftName;
@property (weak, nonatomic) IBOutlet UILabel *leftPrice;
@property (weak, nonatomic) IBOutlet UIImageView *leftOrderBuy;

@property (weak, nonatomic) IBOutlet UIImageView *topImage;
@property (weak, nonatomic) IBOutlet UILabel *topName;
@property (weak, nonatomic) IBOutlet UILabel *topLabel;


@property (weak, nonatomic) IBOutlet UIImageView *bottomImage;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomabel;


@end

@implementation MallViewCell


- (IBAction)mallButtonClick:(UIButton *)sender {
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
