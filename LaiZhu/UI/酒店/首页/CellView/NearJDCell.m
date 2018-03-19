//
//  NearJDCell.m
//  LaiZhu
//
//  Created by apple on 2018/2/25.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NearJDCell.h"
#import "NearJDViewController.h"
#import "JDetailViewController.h"

@interface NearJDCell()

@property (weak, nonatomic) IBOutlet UIImageView *jDImage;
@property (weak, nonatomic) IBOutlet UILabel *nearKm;
@property (weak, nonatomic) IBOutlet UIView *stateView;
@property (strong, nonatomic) RateView *rateVw;
@property (weak, nonatomic) IBOutlet UILabel *starLabel;
@property (weak, nonatomic) IBOutlet UILabel *jDName;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *nearName;


@end

@implementation NearJDCell

- (void)nearJDTableViewCellWithImage:(NSString *)imageStr
{
    [self.jDImage sd_setImageWithURL:[NSURL URLWithString:imageStr] placeholderImage:[UIImage imageNamed:@"ImgCell"]];
    self.nearKm.layer.cornerRadius = self.nearKm.height/2;
    
    [self.rateVw removeFromSuperview];

    //初始化星星，并设置星级数
    RateView *rateVw = [RateView rateViewWithRating:0];
    //设置星星个数
    rateVw.count = 5;
    //设置星星大小
    rateVw.starSize = 20;
    rateVw.duraingSize = 5;
    //设置颜色
    rateVw.starNormalColor = [UIColor whiteColor];
    //设置填充颜色
    rateVw.starFillColor = [UIColor colorWithHexString:@"#bfa276"];
    //设置边框颜色
    rateVw.starBorderColor = [UIColor clearColor];
    //设置每一次点击增加多少
    rateVw.starFillMode = StarFillModeHorizontal;
    //设置星级可以是否改变
    rateVw.canRate = NO;
    CGFloat width = rateVw.count * (rateVw.starSize + rateVw.duraingSize);
    rateVw.frame = CGRectMake(self.stateView.width - width, 0, width, self.stateView.height);
    rateVw.centerY = self.starLabel.centerY;
    self.rateVw = rateVw;
    [self.stateView addSubview:self.rateVw];
    
}

#pragma mark - 去预订
- (IBAction)goToOrding:(UIButton *)sender {
    
    id object = self;
    while (![object isKindOfClass:[NearJDViewController class]]) {
        object = [object nextResponder];
    }
    UIViewController *vc = (NearJDViewController *)object;
    
    JDetailViewController *jdetail = [[JDetailViewController alloc] init];
    [vc.navigationController pushViewController:jdetail animated:YES];
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
