//
//  OrderOtherInfroCell.m
//  LaiZhu
//
//  Created by apple on 2018/2/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "OrderOtherInfroCell.h"

@interface OrderOtherInfroCell()

@property (weak, nonatomic) IBOutlet UILabel *leftLabel;

@property (weak, nonatomic) IBOutlet UILabel *centerLabel;

@property (weak, nonatomic) IBOutlet UIButton *rightBtn;

@end

@implementation OrderOtherInfroCell

- (void)orderOtherInfroCellWithType:(NSString *)content indexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 3) {
        //手机
        self.leftLabel.text = @"Mobile phone";
        self.rightBtn.hidden = YES;
        
    }else if (indexPath.row == 4) {
        //优惠券
        self.leftLabel.text = @"Coupon";
        self.centerLabel.text = @"2 coupons";
        if (self.centerLabel.text == nil || self.centerLabel.text.length == 0) {
            //暂无优惠券可用
            [self.rightBtn setTitle:@"No coupons" forState:UIControlStateNormal];
            self.rightBtn.enabled = NO;
        }else {
            [self.rightBtn setTitle:@"Go to use >" forState:UIControlStateNormal];
            self.rightBtn.enabled = YES;
        }
        
    }else if (indexPath.row == 5) {
        //积分兑换
        self.leftLabel.text = @"Integral Exchange";
        self.centerLabel.text = @"1000";
        if (self.centerLabel.text == nil || self.centerLabel.text.length == 0) {
            //积分不足
            [self.rightBtn setTitle:@"NO integral" forState:UIControlStateNormal];
            self.rightBtn.enabled = NO;
        }else {
            [self.rightBtn setTitle:@"Go to use >" forState:UIControlStateNormal];
            self.rightBtn.enabled = YES;
        }
        
    }else if (indexPath.row == 6) {
        //发票
        self.leftLabel.text = @"Bill";
        self.centerLabel.hidden = YES;
        //不需要>
        [self.rightBtn setTitle:@"No need >" forState:UIControlStateNormal];
    }
}


- (IBAction)rightButtonClick:(UIButton *)sender {
    
    
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
