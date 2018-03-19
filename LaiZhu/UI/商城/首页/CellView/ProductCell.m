//
//  ProductCell.m
//  LaiZhu
//
//  Created by apple on 2018/1/30.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ProductCell.h"

@interface ProductCell()

@property (weak, nonatomic) IBOutlet UIButton *leftBtnImage;
@property (weak, nonatomic) IBOutlet UILabel *leftName;
@property (weak, nonatomic) IBOutlet UILabel *leftPrice;
@property (weak, nonatomic) IBOutlet UIButton *rightBtnImage;
@property (weak, nonatomic) IBOutlet UILabel *rightName;
@property (weak, nonatomic) IBOutlet UILabel *rightPrice;


@end

@implementation ProductCell


- (IBAction)orderingProductClick:(UIButton *)sender {
    
    if (sender.tag == 2001) {
        //左侧
    }else {
        //右侧
    }
    
    if ([self.delegate respondsToSelector:@selector(productCellWithModel)]) {
        [self.delegate productCellWithModel];
    }
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
