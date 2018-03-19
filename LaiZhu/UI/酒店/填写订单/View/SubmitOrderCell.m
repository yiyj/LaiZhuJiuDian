//
//  SubmitOrderCell.m
//  LaiZhu
//
//  Created by apple on 2018/2/27.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "SubmitOrderCell.h"

@interface SubmitOrderCell()

/** 预定状态 */
@property (weak, nonatomic) IBOutlet UILabel *statue;
/** 酒店名 */
@property (weak, nonatomic) IBOutlet UILabel *hotelName;
/** 酒店类型：标准间  间数：1间 */
@property (weak, nonatomic) IBOutlet UILabel *typeNum;
/** 日期 入驻天数 */
@property (weak, nonatomic) IBOutlet UILabel *dateDays;

@end

@implementation SubmitOrderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
