//
//  RomsCollectionViewCell.m
//  LaiZhu
//
//  Created by apple on 2018/2/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "RomsCollectionViewCell.h"

@interface RomsCollectionViewCell()



@end

@implementation RomsCollectionViewCell

- (void)romsCollectionViewCellWithRomNum:(NSInteger)romNum rom:(NSInteger)rom
{
    self.romNumber.layer.cornerRadius = 2;
    self.romNumber.text = [NSString stringWithFormat:@"\t\t%ld\t\t",(long)romNum];
    if (romNum == rom) {
        self.romNumber.backgroundColor = [UIColor colorWithHexString:@"#BFA276"];
    }else {
        self.romNumber.backgroundColor = [UIColor colorWithHexString:@"#EEEEEE"];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
