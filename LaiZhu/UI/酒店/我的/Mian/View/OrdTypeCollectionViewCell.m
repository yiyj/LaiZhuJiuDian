//
//  OrdTypeCollectionViewCell.m
//  LaiZhu
//
//  Created by apple on 2018/2/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "OrdTypeCollectionViewCell.h"

@interface OrdTypeCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *typeImage;
@property (weak, nonatomic) IBOutlet UILabel *orderType;


@end

@implementation OrdTypeCollectionViewCell

- (void)ordTypeCollectionViewCellWithStr:(NSString *)str
{
    self.typeImage.image = [UIImage imageNamed:str];
    self.orderType.text = str;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
