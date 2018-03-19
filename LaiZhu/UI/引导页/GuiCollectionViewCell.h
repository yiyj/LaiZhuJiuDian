//
//  GuiCollectionViewCell.h
//  FireFightingSchool
//
//  Created by apple on 2017/12/22.
//  Copyright © 2017年 highles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuiCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *leadingImage;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIButton *passBtn;

@end
