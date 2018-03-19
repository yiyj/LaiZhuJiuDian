//
//  PersonNameCell.h
//  LaiZhu
//
//  Created by apple on 2018/2/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonNameCell : UITableViewCell<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;

/**
 设置cell信息
 
 @param name 入住人名字
 @param desc  占位文字信息
 @param textFieldBlock 输入内容回调
 */
-(void)setCellInfoName:(NSString*)name withInputDesc:(NSString*)desc WithReturnBlock:(void (^)(NSString *result))textFieldBlock;

@end
