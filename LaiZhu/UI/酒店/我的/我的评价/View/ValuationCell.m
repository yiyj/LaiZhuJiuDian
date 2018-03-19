//
//  ValuationCell.m
//  LaiZhu
//
//  Created by apple on 2018/3/16.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ValuationCell.h"

@interface ValuationCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconImg;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *oneStar;
@property (weak, nonatomic) IBOutlet UIImageView *twoStar;
@property (weak, nonatomic) IBOutlet UIImageView *threeStar;
@property (weak, nonatomic) IBOutlet UIImageView *fourStar;
@property (weak, nonatomic) IBOutlet UIImageView *fiveStar;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *comments;
@property (weak, nonatomic) IBOutlet UIView *imgBgView;


@end

@implementation ValuationCell

- (void)starWithNumber:(NSInteger)starNum
{
    if (starNum == 1) {
        self.oneStar.image = [UIImage imageNamed:@"star"];
    }else if (starNum == 2) {
        self.oneStar.image = [UIImage imageNamed:@"star"];
        self.twoStar.image = [UIImage imageNamed:@"star"];
    }else if (starNum == 3) {
        self.oneStar.image = [UIImage imageNamed:@"star"];
        self.twoStar.image = [UIImage imageNamed:@"star"];
        self.threeStar.image = [UIImage imageNamed:@"star"];
    }else if (starNum == 4) {
        self.oneStar.image = [UIImage imageNamed:@"star"];
        self.twoStar.image = [UIImage imageNamed:@"star"];
        self.threeStar.image = [UIImage imageNamed:@"star"];
        self.fourStar.image = [UIImage imageNamed:@"star"];
    }else if (starNum == 5) {
        self.oneStar.image = [UIImage imageNamed:@"star"];
        self.twoStar.image = [UIImage imageNamed:@"star"];
        self.threeStar.image = [UIImage imageNamed:@"star"];
        self.fourStar.image = [UIImage imageNamed:@"star"];
        self.oneStar.image = [UIImage imageNamed:@"star"];
        self.fiveStar.image = [UIImage imageNamed:@"star"];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self starWithNumber:1];
    
    CGFloat kViewW = (self.imgBgView.width -12)/kNumber;
    //x的间距
    CGFloat marginX = (self.imgBgView.width - kViewW * kNumber) / (kNumber + 1);
    
    for (int i = 0; i < 6; i ++) {
        //每行中第几个
        int row = i % kNumber;
        //第几行
        int low = i / kNumber;
        // x
        CGFloat x = marginX + (kViewW + marginX) * row;
        //y
        CGFloat y =(kViewW + kMarginY) * low;
        
        UIButton *imageButton = [[UIButton alloc] initWithFrame:CGRectMake(x, y, kViewW, kViewW)];
        //设置占位图片
        [imageButton sd_setImageWithURL:[NSURL URLWithString:@"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2019270811,1269730008&fm=27&gp=0.jpg"] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"defaultImg"]];
        imageButton.tag = 1000 + i;
        [imageButton addTarget:self action:@selector(lookBigPictrue:) forControlEvents:UIControlEventTouchUpInside];
        [self.imgBgView addSubview:imageButton];
    }
}

#pragma mark -- 查看大图
- (void)lookBigPictrue:(UIButton *)btn
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.accessoryType = UITableViewCellAccessoryNone;
    // Configure the view for the selected state
}

@end
