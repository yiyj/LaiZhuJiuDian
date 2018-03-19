//
//  ActionSheetView.m
//  RongYiDai
//
//  Created by 易元江 on 2017/8/16.
//  Copyright © 2017年 hanlesi. All rights reserved.
//

#import "ActionSheetView.h"

#define Space 10

@interface ActionSheetView () <UITableViewDelegate,UITableViewDataSource>

/** 头部视图 */
@property (nonatomic, strong) UIView *headView;

/** 背景蒙层 */
@property (nonatomic, strong) UIView *maskView;

/** 数组元素 */
@property (nonatomic, strong) NSArray *dataSource;

/** 取消文字 */
@property (nonatomic, copy) NSString *cancelTitle;

/** 操作信息背景视图 */
@property (nonatomic, strong) UIView *backView;

/** 取消按键位置视图 */
@property (nonatomic, strong) UIView *cancleView;

@property (nonatomic, copy) void(^cancelBlock)(void);

@property (nonatomic, copy) void(^selectBlock)(NSInteger);

@property (nonatomic, copy) void(^selectBlockString)(NSString *);

@property (nonatomic, strong) UITableView *tableView;



@end

@implementation ActionSheetView

#pragma mark -- 初始化
- (instancetype)initWithTitleView:(UIView *)titleView
                       optionsArr:(NSArray *)optionsArr
                      cancelTitle:(NSString *)cancelTitle
                      cancelBlock:(void (^)(void))cancelBlock
                      selectBlock:(void (^)(NSInteger))selectBlock
                      selectBlockString:(void (^)(NSString *))selectBlockString
{
    
    
    if (self = [super init]) {
        
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        self.dataSource = [NSArray array];
        self.headView = titleView;
        self.dataSource = optionsArr;
        self.cancelTitle = cancelTitle;
        self.cancelBlock = cancelBlock;
        self.selectBlock = selectBlock;
        self.selectBlockString = selectBlockString;
        
        [self createUI];
        
    }
    return self;
    
}

#pragma mark -- 界面添加布局
- (void)createUI
{
    self.frame = [UIScreen mainScreen].bounds;
    [self addSubview:self.maskView];
    [self addSubview:self.backView];
    [self.backView addSubview:self.headView];
    [self.backView addSubview:self.tableView];
    [self.backView addSubview:self.cancleView];

}

#pragma mark -- 懒加载
- (UIView *)backView
{
    if (!_backView) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = [UIColor clearColor];
    }
    return _backView;
}

- (UIView *)maskView
{
    if (!_maskView) {
        _maskView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _maskView.backgroundColor = [UIColor clearColor];
    }
    return _maskView;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.rowHeight = 44.0;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorInset = UIEdgeInsetsMake(0, -50, 0, 0);
    }
    return _tableView;
}

- (UIView *)headView
{
    if (!_headView) {
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth-2*Space, 44)];
        _headView.backgroundColor = [UIColor whiteColor];
        //裁剪
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_headView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight  cornerRadii:CGSizeMake(6, 6)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = _headView.bounds;
        maskLayer.path = maskPath.CGPath;
        _headView.layer.mask = maskLayer;
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _headView.frame.size.width, 39)];
        titleLabel.text = @"请选择";
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [_headView addSubview:titleLabel];
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, _headView.frame.size.height-0.5, _headView.frame.size.width, 0.5)];
        lineView.backgroundColor = [UIColor grayColor];
        [_headView addSubview:lineView];
    }
    return _headView;
}


- (UIView *)cancleView
{
    if (!_cancleView) {
        
        _cancleView = [[UIView alloc] initWithFrame:CGRectMake(0, self.backView.height - 44 - 5, ScreenWidth-2*Space, 44)];
        _cancleView.backgroundColor = [UIColor whiteColor];
        //裁剪
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_cancleView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(6, 6)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = _cancleView.bounds;
        maskLayer.path = maskPath.CGPath;
        _cancleView.layer.mask = maskLayer;
        
        UIButton *cancleButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth-2*Space, 44)];
        [cancleButton setTitle:_cancelTitle forState:UIControlStateNormal];
        [cancleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [cancleButton addTarget:self action:@selector(cancleButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_cancleView addSubview:cancleButton];
    }
    return _cancleView;
}

#pragma mark -- 取消按键点击事件
- (void)cancleButtonClick
{
    self.cancelBlock();
    [self dismissView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
    
    cell.textLabel.text = self.dataSource[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section == 0 ? self.dataSource.count : 1;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (self.selectBlock) {
        self.selectBlock(indexPath.row);
    }
    
    if (self.selectBlockString) {
        self.selectBlockString(self.dataSource[indexPath.row]);
    }
    
    [self dismissView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self showView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissView];
}

- (void)showView
{
    CGFloat height = ScreenHeight - 160;
    CGFloat tableHeight = ScreenHeight - 160 - 10 - 44 - 44;
    
    if ((self.tableView.rowHeight*self.dataSource.count) <= ScreenHeight - 160) {
        
        height = self.tableView.rowHeight*self.dataSource.count + 44 + 44 + 10;
        tableHeight  = self.tableView.rowHeight*self.dataSource.count;
    }
    self.backView.frame = CGRectMake(Space, ScreenHeight, ScreenWidth-2*Space, height);
    
    self.tableView.frame = CGRectMake(0, 44, ScreenWidth-2*Space, tableHeight);
    
    self.cancleView.frame = CGRectMake(0, tableHeight + 44 + 5, ScreenWidth - 2*Space, 44);
    
    [UIView animateWithDuration:0.5 animations:^{
        
        CGRect rect = self.backView.frame;
        
        rect.origin.y = ScreenHeight - height;
        
        self.backView.frame = rect;
        
    }];
}

- (void)dismissView
{
    [UIView animateWithDuration:0.5 animations:^{
        CGRect rect = self.backView.frame;
        
        rect.origin.y += self.backView.bounds.size.height;
        
        self.backView.frame = rect;
        
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
