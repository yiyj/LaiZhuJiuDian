//
//  ShopCell.m
//  LaiZhu
//
//  Created by apple on 2018/1/31.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ShopCell.h"

@interface ShopCell()

@property (weak, nonatomic) IBOutlet UIImageView *pictrue;
@property (weak, nonatomic) IBOutlet UILabel *product;
@property (weak, nonatomic) IBOutlet UILabel *price;

@end

@implementation ShopCell

- (void)shopCellModel
{
    self.price.text = [NSString stringWithFormat:@"¥%@",@"1688.00"];
}

- (IBAction)predingBuyClick:(UIButton *)sender {
    
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
