//
//  YYJTextFiled.m
//  ErShouFangFangDong
//
//  Created by 瀚乐思 on 2017/9/19.
//  Copyright © 2017年 highles. All rights reserved.
//

#import "YYJTextFiled.h"

static NSString *const PlacerholderColorKeyPath = @"_placeholderLabel.textColor";


@implementation YYJTextFiled


- (void)awakeFromNib
{
    [super awakeFromNib];
    self.tintColor = self.textColor;
    
    [self imageViewWith:nil];
    [self resignFirstResponder];
}

- (void)imageViewWith:(NSString *)imageName
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 15)];
    view.contentMode = UIViewContentModeCenter;
    UIImageView *searchIcon = [[UIImageView alloc]init];
    searchIcon.image = [UIImage imageNamed:imageName];
    searchIcon.x = 15;
    searchIcon.y = 0;
    searchIcon.width = 15;
    searchIcon.height = 15;
    [view addSubview:searchIcon];
    
    if (imageName != nil || imageName.length != 0) {
        
        if ([imageName isEqualToString:@""]) {
            view.width = 20;
        }
        self.leftView = view;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self resignFirstResponder];
}


- (BOOL)becomeFirstResponder
{
    [self setValue:[UIColor lightGrayColor] forKeyPath:PlacerholderColorKeyPath];
    
    return [super becomeFirstResponder];
}


- (void)placeholderColor:(UIColor *)color
{
    [self setValue:color forKeyPath:PlacerholderColorKeyPath];
}

- (BOOL)resignFirstResponder
{
    [self setValue:[UIColor lightGrayColor] forKeyPath:PlacerholderColorKeyPath];
    
    return [super resignFirstResponder];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
