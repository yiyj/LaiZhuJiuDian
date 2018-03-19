//
//  CycTableViewCell.m
//  LaiZhu
//
//  Created by apple on 2018/2/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "CycTableViewCell.h"
#import "JDHomeViewController.h"
#import "TimeViewController.h"
#import "NearJDViewController.h"
#import "NSString+XHDateFormat.h"

@interface CycTableViewCell()<SDCycleScrollViewDelegate,UITextFieldDelegate>


@end

@implementation CycTableViewCell

- (void)cycTableViewCellWithAdsArray:(NSMutableArray *)images
{
    self.cycView.delegate = self;
    self.cycView.autoScrollTimeInterval = 3;
    self.cycView.imageURLStringsGroup = images;
    self.cycView.placeholderImage = [UIImage imageNamed:@"defaultImg"];
    self.cycView.currentPageDotImage = [UIImage imageNamed:@"轮播黑长条"];
    self.cycView.pageDotImage = [UIImage imageNamed:@"轮播白长条"];
    self.cycView.pageControlDotSize = CGSizeMake([UIImage imageNamed:@"轮播黑长条"].size.width, [UIImage imageNamed:@"轮播黑长条"].size.height);
    self.cycView.bannerImageViewContentMode = UIViewContentModeScaleToFill;
    
    [self.search imageViewWith:@"搜索"];
    self.search.delegate = self;
    self.search.layer.cornerRadius = 15.0f;
    
    NSString *timeStr = [[NSString getTime] xh_formatYueRi];
    self.orderTime.text = [NSString stringWithFormat:@"%@ -- %@",timeStr,timeStr];
}

#pragma mark --滚动视图代理
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{

}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}

#pragma mark - 预定时间 快速预定
- (IBAction)sunOrderingClick:(UIButton *)sender {
    
    id object = self;
    while (![object isKindOfClass:[JDHomeViewController class]]) {
        object = [object nextResponder];
    }
    UIViewController *vc = (JDHomeViewController *)object;
    
    if ([sender.titleLabel.text isEqualToString:@"Fast Reservations"]) {//快速预定
        NearJDViewController *nearVc = [[NearJDViewController alloc] init];
        [vc.navigationController pushViewController:nearVc animated:YES];
    }else {
        TimeViewController *time = [[TimeViewController alloc] init];
        [vc.navigationController pushViewController:time animated:YES];
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
