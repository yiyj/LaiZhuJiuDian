//
//  EvaluationCell.m
//  LaiZhu
//
//  Created by apple on 2018/2/28.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "EvaluationCell.h"

@interface EvaluationCell()

/** 酒店名 */
@property (weak, nonatomic) IBOutlet UILabel *hotelName;
/** 时间 */
@property (weak, nonatomic) IBOutlet UILabel *time;
/** 评价 */
@property (weak, nonatomic) IBOutlet UILabel *evaluation;
@property (weak, nonatomic) IBOutlet UIView *rateView;
//评价等级
@property (strong, nonatomic) RateView *rateVw;

@end

@implementation EvaluationCell

- (void)evaluationCellWithModel:(NSIndexPath *)indexPath
{
    [self.rateVw removeFromSuperview];
    //初始化星星，并设置星级数
    RateView *rateVw = [RateView rateViewWithRating:0];
    //设置星星个数
    rateVw.count = 5;
    //设置星星大小
    rateVw.starSize = 15;
    rateVw.duraingSize = 5;
    //星级数
    rateVw.rating = 4;
    //设置颜色
    rateVw.starNormalColor = [UIColor colorWithHexString:@"#dedede"];
    //设置填充颜色
    rateVw.starFillColor = [UIColor colorWithHexString:@"#bfa276"];
    //设置边框颜色
    rateVw.starBorderColor = [UIColor clearColor];
    //设置每一次点击增加多少
    rateVw.starFillMode = StarFillModeHorizontal;
    //设置星级可以是否改变
    rateVw.canRate = NO;
    CGFloat width = rateVw.count * (rateVw.starSize + rateVw.duraingSize);
    rateVw.frame = CGRectMake(0, 0, width, self.rateView.height);
    rateVw.centerY = self.time.centerY;
    self.rateVw = rateVw;
    [self.rateView addSubview:self.rateVw];
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
