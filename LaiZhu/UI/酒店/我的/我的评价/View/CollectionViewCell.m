//
//  CollectionViewCell.h
//  多选图片
//
//  Created by apple on 2016/10/24.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imagev];
        [self addSubview:self.deleteButton];
    }
    return self;
}

- (UIImageView *)imagev{
    if (!_imagev) {
        self.imagev = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, self.width-20, self.height-15)];
//        _imagev.backgroundColor = [UIColor blueColor];
    }
    return _imagev;
}
- (UIButton *)deleteButton{
    if (!_deleteButton) {
        self.deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _deleteButton.frame = CGRectMake(CGRectGetWidth(self.bounds)-20, 0, 20, 20);
        [_deleteButton setBackgroundImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    }
    return _deleteButton;
}

@end
