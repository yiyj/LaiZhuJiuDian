//
//  TypeTableViewCell.m
//  LaiZhu
//
//  Created by apple on 2018/1/30.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "TypeTableViewCell.h"

@implementation TypeTableViewCell

- (IBAction)buttonClick:(UIButton *)sender {
    
    if ([sender.titleLabel.text isEqualToString:@"所有"]) {
        //menu
    }else if ([sender.titleLabel.text isEqualToString:@"洗护"]) {
        //Wash protect
        
    }else if ([sender.titleLabel.text isEqualToString:@"旅行"]) {
        //travel
        
    }else if ([sender.titleLabel.text isEqualToString:@"书籍"]) {
        //books
        
    }else if ([sender.titleLabel.text isEqualToString:@"礼品"]) {
        //gift
        
    }else if ([sender.titleLabel.text isEqualToString:@"床品"]) {
        //Bed is tasted
        
    }else if ([sender.titleLabel.text isEqualToString:@"家居"]) {
        //household
        
    }else if ([sender.titleLabel.text isEqualToString:@"原创"]) {
        //original
    }
    
    if ([self.delegate respondsToSelector:@selector(typeButtonClick:)]) {
        [self.delegate typeButtonClick:sender];
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
