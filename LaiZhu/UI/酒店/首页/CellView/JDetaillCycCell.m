//
//  JDetaillCycCell.m
//  LaiZhu
//
//  Created by apple on 2018/2/25.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "JDetaillCycCell.h"
#import "JDetailViewController.h"
#import "VluationViewController.h"
#import "EvaluationViewController.h"
#import "TimeViewController.h"

@interface JDetaillCycCell()<SDCycleScrollViewDelegate>

@property (weak, nonatomic) IBOutlet SDCycleScrollView *cycView;
@property (weak, nonatomic) IBOutlet UIView *rateView;
@property (strong, nonatomic) RateView *rateVw;
@property (weak, nonatomic) IBOutlet UILabel *starLabel;
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *time;


@end

@implementation JDetaillCycCell

- (void)cycTableViewCellWithAdsArray:(NSArray *)images
{
    self.cycView.delegate = self;
    self.cycView.autoScrollTimeInterval = 3;
    self.cycView.imageURLStringsGroup = images;
    self.cycView.placeholderImage = [UIImage imageNamed:@"defaultImg"];
    self.cycView.currentPageDotImage = [UIImage imageNamed:@"酒店详情轮播白"];
    self.cycView.pageDotImage = [UIImage imageNamed:@"酒店详情轮播黑"];
    self.cycView.pageControlDotSize = CGSizeMake([UIImage imageNamed:@"酒店详情轮播白"].size.width, [UIImage imageNamed:@"酒店详情轮播黑"].size.height);
    self.cycView.bannerImageViewContentMode = UIViewContentModeScaleToFill;
    
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
    rateVw.centerY = self.starLabel.centerY;
    self.rateVw = rateVw;
    [self.rateView addSubview:self.rateVw];
    
    //接受通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(timeNightsNoti:) name:@"JDetaillNoti" object:nil];
}

- (void)timeNightsNoti:(NSNotification *)noti
{
    NSDictionary *dict = noti.userInfo;
    self.time.text = [NSString stringWithFormat:@"%@ - %@,%@Nights",dict[@"Booked"],dict[@"Leaving"],dict[@"nights"]];
}

- (IBAction)buttonClick:(UIButton *)sender {
    id object = self;
    while (![object isKindOfClass:[JDetailViewController class]]) {
        object = [object nextResponder];
    }
    UIViewController *vc = (JDetailViewController *)object;
    
    if (sender.tag == 1011) {//评价
        VluationViewController *myEvaluation = [[VluationViewController alloc] init];
        [vc.navigationController pushViewController:myEvaluation animated:YES];
    }else if (sender.tag == 1012) {//拨打电话
        NSMutableString *str= [[NSMutableString alloc] initWithFormat:@"tel:%@",@"023-63311104"];
        UIWebView *callWebview = [[UIWebView alloc] init];
        [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
        [self.contentView addSubview:callWebview];
    }else {//时间
        TimeViewController *time = [[TimeViewController alloc] init];
        [vc.navigationController pushViewController:time animated:YES];
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
