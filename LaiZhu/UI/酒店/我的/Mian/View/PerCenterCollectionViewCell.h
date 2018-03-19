//
//  PerCenterCollectionViewCell.h
//  LaiZhu
//
//  Created by apple on 2018/2/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PerCenterCollectionViewCellDelegate <NSObject>

- (void)iconButtonClick:(UIButton *)btn;

@end

@interface PerCenterCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) id<PerCenterCollectionViewCellDelegate>delegate;


@end
