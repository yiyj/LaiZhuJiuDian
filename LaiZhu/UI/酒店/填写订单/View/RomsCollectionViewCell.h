//
//  RomsCollectionViewCell.h
//  LaiZhu
//
//  Created by apple on 2018/2/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RomsCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *romNumber;
/**
 房间数

 @param romNum 每个cell的房间数
 @param rom 选中的房间数
 */
- (void)romsCollectionViewCellWithRomNum:(NSInteger)romNum rom:(NSInteger)rom;

@end
