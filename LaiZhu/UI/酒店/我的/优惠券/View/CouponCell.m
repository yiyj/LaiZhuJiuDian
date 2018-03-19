//
//  CouponCell.m
//  LaiZhu
//
//  Created by apple on 2018/2/28.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "CouponCell.h"

@interface CouponCell()

@property (weak, nonatomic) IBOutlet UILabel *price;
/** 立即使用Immediate use 已使用Already used 已过期Expired */
@property (weak, nonatomic) IBOutlet UILabel *use;
/** 优惠券类型 */
@property (weak, nonatomic) IBOutlet UILabel *coupType;
/** 适用范围 */
@property (weak, nonatomic) IBOutlet UILabel *apply;
/** 有效期 */
@property (weak, nonatomic) IBOutlet UILabel *validity;
@property (weak, nonatomic) IBOutlet UIImageView *coupTop;
@property (weak, nonatomic) IBOutlet UIImageView *coupBot;


@end

@implementation CouponCell

- (void)couponCellWithModel:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        
        self.coupTop.alpha = 0.85;
        self.coupBot.alpha = 0.85;
        self.use.text = @"Already used";
        
    }else if (indexPath.row == 2) {
        
        self.coupTop.alpha = 0.65;
        self.coupBot.alpha = 0.65;
        self.use.text = @"Expired";
    }
}

#pragma mark - 查看规则
- (IBAction)rulesButtonClick:(id)sender {
    
    
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
