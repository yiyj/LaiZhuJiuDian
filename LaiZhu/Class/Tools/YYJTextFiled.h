//
//  YYJTextFiled.h
//  ErShouFangFangDong
//
//  Created by 瀚乐思 on 2017/9/19.
//  Copyright © 2017年 highles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYJTextFiled : UITextField

@property (nonatomic,copy) NSString *string;

/** 🔍图片 */
- (void)imageViewWith:(NSString *)imageName;
/** PlacerholderColor */
- (void)placeholderColor:(UIColor *)color;

@end
