//
//  TypeTableViewCell.h
//  LaiZhu
//
//  Created by apple on 2018/1/30.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TypeTableViewCellDelegate<NSObject>

- (void)typeButtonClick:(UIButton *)btn;

@end

@interface TypeTableViewCell : UITableViewCell

@property (weak,nonatomic) id<TypeTableViewCellDelegate>delegate;

@end
