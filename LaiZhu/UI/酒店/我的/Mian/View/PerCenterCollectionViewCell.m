//
//  PerCenterCollectionViewCell.m
//  LaiZhu
//
//  Created by apple on 2018/2/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "PerCenterCollectionViewCell.h"

@interface PerCenterCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIButton *iconImg;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *intergal;
@property (weak, nonatomic) IBOutlet UILabel *acount;

@end

@implementation PerCenterCollectionViewCell

- (IBAction)iconImageClick:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(iconButtonClick:)]) {
        [self.delegate iconButtonClick:sender];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
