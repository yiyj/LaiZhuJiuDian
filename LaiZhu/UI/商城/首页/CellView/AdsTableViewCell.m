//
//  AdsTableViewCell.m
//  LaiZhu
//
//  Created by apple on 2018/1/30.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "AdsTableViewCell.h"
#import "HomeViewController.h"

@implementation AdsTableViewCell

- (void)adsTableViewCellWithAdsArray:(NSMutableArray *)array
{
    self.cycView.delegate = self;
    self.cycView.autoScrollTimeInterval = 3;
    self.cycView.imageURLStringsGroup = @[@"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4080833725,2827278465&fm=27&gp=0.jpg", @"http://img5.imgtn.bdimg.com/it/u=3278832849,3997171782&fm=27&gp=0.jpg", @"http://img4.imgtn.bdimg.com/it/u=2683661537,1868135799&fm=27&gp=0.jpg"];
    self.cycView.placeholderImage = [UIImage imageNamed:@"defaultImg"];
    self.cycView.currentPageDotImage = [UIImage imageNamed:@"轮播图选中"];
    self.cycView.pageDotImage = [UIImage imageNamed:@"轮播图未选中"];
    self.cycView.pageControlDotSize = CGSizeMake([UIImage imageNamed:@"轮播图未选中"].size.width, [UIImage imageNamed:@"轮播图未选中"].size.height);
    self.cycView.bannerImageViewContentMode = UIViewContentModeScaleToFill;
}

#pragma mark --滚动视图代理
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    
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
