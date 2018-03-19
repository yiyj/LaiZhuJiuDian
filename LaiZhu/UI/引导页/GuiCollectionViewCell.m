//
//  GuiCollectionViewCell.m
//  FireFightingSchool
//
//  Created by apple on 2017/12/22.
//  Copyright © 2017年 highles. All rights reserved.
//

#import "GuiCollectionViewCell.h"

@implementation GuiCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.passBtn.layer.cornerRadius = self.passBtn.height/2;
    self.passBtn.layer.borderWidth = 1;
    self.passBtn.layer.borderColor = [UIColor whiteColor].CGColor;
}

@end
