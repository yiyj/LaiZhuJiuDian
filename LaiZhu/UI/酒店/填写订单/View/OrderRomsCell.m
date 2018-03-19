//
//  OrderRomsCell.m
//  LaiZhu
//
//  Created by apple on 2018/2/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "OrderRomsCell.h"
#import "RomsCollectionViewCell.h"

@interface OrderRomsCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

/** 房间数选择视图 */
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) NSIndexPath *indexPath;
@property (strong, nonatomic) NSMutableArray *roms;

@end

@implementation OrderRomsCell

- (void)orderRomsCellWithNumber:(NSInteger)num indexPath:(NSIndexPath *)indexPath
{
    self.indexPath = indexPath;
    
    self.romNumber.text = [NSString stringWithFormat:@"%ld",(long)num];
    
    [self.collectionView reloadData];
}

#pragma mark -- 点击按键是否展示房间数选择视图
- (IBAction)isShowCollectionViewClick:(UIButton *)sender {
    
    if (self.height == 50.0f) {
        sender.selected = NO;
    }else {
        sender.selected = YES;
    }
    
    sender.selected = !(sender.selected);
    
    CGFloat rowHeight = 50.0f;
    
    //行数 每行romsNum个
    NSInteger low = 10 / romsNum;
    
    if (sender.selected) {
        rowHeight = 65.0 + 50 * low;
    }else {
        rowHeight = 50.0f;
    }
    
    if ([self.delegate respondsToSelector:@selector(orderRomsCellWithHeight:indexPath:peoples:)]) {
        [self.delegate orderRomsCellWithHeight:rowHeight indexPath:self.indexPath peoples:[self.romNumber.text integerValue]];
    }
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
    flowlayout.minimumLineSpacing = 0;
    flowlayout.minimumInteritemSpacing = 0;
//    flowlayout.itemSize = CGSizeMake(ScreenWidth / romsNum, 30);
    [flowlayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"RomsCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"RomsCollectionViewCell"];
}

#pragma mark -- UICollectionViewDelegate
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"RomsCollectionViewCell";
    
    RomsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"RomsCollectionViewCell" owner:self options:nil]firstObject];
    }
    
    [cell romsCollectionViewCellWithRomNum:indexPath.row + 1 rom:[self.romNumber.text integerValue]];
    
    return cell;
}

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.romNumber.text = [NSString stringWithFormat:@"%ld",(long)(indexPath.row + 1)];
    
    //行数 每行romsNum个
    NSInteger low = 10 / romsNum;
    CGFloat rowHeight = 65.0 + 50 * low;
    
    if ([self.delegate respondsToSelector:@selector(orderRomsCellWithHeight:indexPath:peoples:)]) {
        [self.delegate orderRomsCellWithHeight:rowHeight indexPath:self.indexPath peoples:(indexPath.row + 1)];
    }
    
}

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(ScreenWidth / (romsNum+1), 50);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.accessoryType = UITableViewCellAccessoryNone;
    // Configure the view for the selected state
}

@end
