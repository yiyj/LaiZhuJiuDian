//
//  JDetaillImgCell.m
//  LaiZhu
//
//  Created by apple on 2018/2/25.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "JDetaillImgCell.h"
#import "JDetailViewController.h"
#import "AddOrderViewController.h"

@interface JDetaillImgCell()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *typeInfro;
@property (weak, nonatomic) IBOutlet UILabel *generPrice;
@property (weak, nonatomic) IBOutlet UILabel *memPrice;
@property (weak, nonatomic) IBOutlet UILabel *yhMoney;

@end

@implementation JDetaillImgCell

- (void)imgTableViewCellWithString:(NSString *)img
{
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:img] placeholderImage:[UIImage imageNamed:@"酒店详情ImgCell"]];
    
}

#pragma mark - 去预定
- (IBAction)ordingClick:(id)sender {
    
    id object = self;
    while (![object isKindOfClass:[JDetailViewController class]]) {
        object = [object nextResponder];
    }
    UIViewController *vc = (JDetailViewController *)object;
    AddOrderViewController *addOrder = [[AddOrderViewController alloc] init];
    [vc.navigationController pushViewController:addOrder animated:YES];
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
