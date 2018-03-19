//
//  OrderFloorCollectionCell.m
//  LaiZhu
//
//  Created by apple on 2018/2/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "OrderFloorCollectionCell.h"

@interface OrderFloorCollectionCell()

@property (weak, nonatomic) IBOutlet UIImageView *topImage;
@property (weak, nonatomic) IBOutlet UILabel *bottonName;


@end

@implementation OrderFloorCollectionCell

- (void)orderFloorCollectionCellWithStr:(NSString *)str imageName:(NSString *)imgStr
{
    self.topImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@black",imgStr]];
    self.bottonName.text = str;
    
    if (imgStr.length == 0 || str.length == 0) {
        self.topImage.hidden = YES;
        self.bottonName.hidden = YES;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
