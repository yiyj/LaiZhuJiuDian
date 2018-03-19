//
//  GuideViewController.m
//  FireFightingSchool
//
//  Created by apple on 2017/12/14.
//  Copyright © 2017年 highles. All rights reserved.
//

#import "GuideViewController.h"
#import "GuiCollectionViewCell.h"

@interface GuideViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    NSInteger _time;
}
@property(nonatomic,strong)NSTimer *timer;
@property (strong,nonatomic) UICollectionView *collectionView;
@property (strong,nonatomic) NSIndexPath *indexPath;

@end

@implementation GuideViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    //自动布局
    self.extendedLayoutIncludesOpaqueBars = YES;
    if (@available(iOS 11.0, *)) {
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    //确定是水平滚动，还是垂直滚动
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 0;//行距
    flowLayout.minimumInteritemSpacing = 0;//列距
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];//滑动方向
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) collectionViewLayout:flowLayout];
    self.collectionView.pagingEnabled = YES;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    [self.collectionView registerNib:[UINib nibWithNibName:@"GuiCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"GuiCollectionViewCell"];
    [self.view addSubview:self.collectionView];
    
    
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeFire) userInfo:nil repeats:YES];
}
#pragma mark -- UICollectionViewDataSource
//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(ScreenWidth, ScreenHeight);
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"GuiCollectionViewCell";
    GuiCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"GuiCollectionViewCell" owner:self options:nil]firstObject];
    }

    if (indexPath.row == 0) {
        cell.leadingImage.image = [UIImage imageNamed:@"引导页1"];
    }else {
        cell.leadingImage.image = [UIImage imageNamed:@"引导页2"];
        cell.button.hidden = NO;
        [cell.button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    self.indexPath = indexPath;
    
    return cell;
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (self.indexPath.row == 1) {
        [self btnClick];
    }
}

- (void)timeFire
{
    _time--;
    
    if (_time<=-1) {
        [self btnClick];
    }
}


- (void)btnClick
{
    [self.timer invalidate];
    self.timer = nil;
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    [window switchLoginViewController];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
