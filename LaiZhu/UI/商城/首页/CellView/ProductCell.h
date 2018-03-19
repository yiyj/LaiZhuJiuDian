//
//  ProductCell.h
//  LaiZhu
//
//  Created by apple on 2018/1/30.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ProductCellDelegate<NSObject>

- (void)productCellWithModel;

@end

@interface ProductCell : UITableViewCell

@property (nonatomic,weak) id<ProductCellDelegate>delegate;

@end
