//
//  EvaluationViewController.m
//  LaiZhu
//
//  Created by apple on 2018/3/6.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "EvaluationViewController.h"
#import "BRPlaceholderTextView.h"
#import "CollectionViewCell.h"
#import "TZImagePickerController.h"
#import "XFStepView.h"

static NSString *headerID = @"header";
static NSString *footerID = @"footer";

@interface EvaluationViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UITextViewDelegate,UIActionSheetDelegate,TZImagePickerControllerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,XFStepViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) BRPlaceholderTextView *noteTextView;
@property (nonatomic,strong) UIButton * sureBtn;
//评价等级
@property (strong, nonatomic) RateView *rateVw;

@property (nonatomic ,strong) NSMutableArray *photosArray;
@property (nonatomic ,strong) NSMutableArray *assestArray;
@property BOOL isSelectOriginalPhoto;

@end

@implementation EvaluationViewController

- (NSMutableArray *)photosArray{
    if (!_photosArray) {
        self.photosArray = [NSMutableArray array];
    }
    return _photosArray;
}

- (NSMutableArray *)assestArray{
    if (!_assestArray) {
        self.assestArray = [NSMutableArray array];
    }
    return _assestArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Publication evaluation";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];

    //界面设置
    [self setupContent];
    
    
}

#pragma mark - 代理方法
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    if (indexPath.row == _photosArray.count) {
        cell.imagev.image = [UIImage imageNamed:@"评价"];
        //        cell.imagev.backgroundColor = [UIColor redColor];
        cell.deleteButton.hidden = YES;
        
    }else{
        cell.imagev.image = _photosArray[indexPath.row];
        cell.deleteButton.hidden = NO;
    }
    cell.deleteButton.tag = 100 + indexPath.row;
    [cell.deleteButton addTarget:self action:@selector(deletePhotos:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void)deletePhotos:(UIButton *)sender{
    [_photosArray removeObjectAtIndex:sender.tag - 100];
    [_assestArray removeObjectAtIndex:sender.tag - 100];
    [_collectionView performBatchUpdates:^{
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:sender.tag-100 inSection:0];
        [_collectionView deleteItemsAtIndexPaths:@[indexPath]];
    } completion:^(BOOL finished) {
        [_collectionView reloadData];
    }];
}

#pragma mark - UIActionSheetDelegate
//根据被点击的按钮做出反应，0对应destructiveButton，之后的button依次排序
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 0) {
        NSLog(@"拍照");
        //拍照
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {  //打开照相机
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.title = @"";
            picker.delegate = self;
            picker.allowsEditing = YES;
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:picker animated:YES completion:nil];
        }
        
    }else if (buttonIndex == 1) {
        NSLog(@"相册");
        // 从相册中选
        TZImagePickerController *imagePicker = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:self];
        [imagePicker setSortAscendingByModificationDate:NO];
        imagePicker.isSelectOriginalPhoto = _isSelectOriginalPhoto;
        imagePicker.selectedAssets = _assestArray;
        imagePicker.allowPickingVideo = NO;
        [self presentViewController:imagePicker animated:YES completion:nil];
        
    }
}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto
{
    self.photosArray = [NSMutableArray arrayWithArray:photos];
    self.assestArray = [NSMutableArray arrayWithArray:assets];
    _isSelectOriginalPhoto = isSelectOriginalPhoto;
    [self.collectionView reloadData];
    
}

#pragma mark -- UIImagePickerController
- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:YES completion:^{
        
        NSString *medicType = [info objectForKey:UIImagePickerControllerMediaType];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        
        //判断选中的是不是图片
        if ([medicType isEqualToString:(NSString *)kUTTypeImage])
        {
            //得到选中的图片
            UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
            
            [self.photosArray addObject:image];
            
            [self.collectionView reloadData];
            
        }else {
            //得到选中的不是图片
        }
    }];
}

//取消ActionSheet时调用
- (void)actionSheetCancel:(UIActionSheet *)actionSheet
{
    [actionSheet removeFromSuperview];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == _photosArray.count) {
        //添加新图片
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Choose Picture" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Photograph", @"Select from the album", nil];
        actionSheet.actionSheetStyle = UIActionSheetStyleDefault;//默认风格，灰色背景，白色文字
        [actionSheet showInView:self.view];
    }else{
        [self checkLocalPhoto];
    }
}

- (void)checkLocalPhoto{
    
    TZImagePickerController *imagePicker = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:self];
    [imagePicker setSortAscendingByModificationDate:NO];
    imagePicker.isSelectOriginalPhoto = _isSelectOriginalPhoto;
    imagePicker.selectedAssets = _assestArray;
    imagePicker.allowPickingVideo = NO;
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}

// 视图(页眉或页脚)
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    // 如果当前想要的是头部视图
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID forIndexPath:indexPath];
        headerView.backgroundColor = [UIColor colorWithHexString:@"#F0F0F0"];
        self.noteTextView = [[BRPlaceholderTextView alloc] initWithFrame:CGRectMake(15, 10, ScreenWidth-30, 150)];
        self.noteTextView.maxTextLength = 300;
        [self.noteTextView setTextColor:[UIColor colorWithHexString:@"#333333"]];
        self.noteTextView.delegate = self;
        self.noteTextView.font = [UIFont boldSystemFontOfSize:15.5];
        self.noteTextView.placeholder= @"Talk about your evaluation of the hotel ";
        [self.noteTextView setPlaceholderColor:[UIColor lightGrayColor]];
        [self.noteTextView setPlaceholderOpacity:1];
        self.noteTextView.textContainerInset = UIEdgeInsetsMake(5, 15, 5, 15);
        self.noteTextView.layer.masksToBounds = YES;
        self.noteTextView.layer.cornerRadius = 2.5;
        [headerView addSubview:self.noteTextView];
        
        return headerView;
        
    } else { // 返回每一组的尾部视图
        UICollectionReusableView *footerView =  [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerID forIndexPath:indexPath];
        footerView.backgroundColor = [UIColor colorWithHexString:@"#F0F0F0"];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 5, 45, 30)];
        label.textColor = [UIColor colorWithHexString:@"#7c7c7c"];
        label.font = Font(10);
        label.text = @"综合评价";
        [footerView addSubview:label];

        XFStepView *stepView = [[XFStepView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(label.frame), 0, 150, 35) Titles:[NSArray arrayWithObjects:@"一星级", @"二星级", @"三星级", @"四星级", @"五星级", nil]];
        stepView.delegate = self;
        [stepView setStepIndex:0];
        [footerView addSubview:stepView];
        
        UIButton *submit = [UIButton buttonWithType:UIButtonTypeCustom];
        [submit setBackgroundImage:[UIImage imageNamed:@"登录"] forState:UIControlStateNormal];
        submit.x = 15;
        submit.y = CGRectGetMaxY(stepView.frame) + 20;
        submit.size = CGSizeMake(ScreenWidth - 30, submit.currentBackgroundImage.size.height);
        [submit setTitle:@"Submit" forState:UIControlStateNormal];
        [submit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        submit.titleLabel.font = Font(15);
        [submit addTarget:self action:@selector(submitEvalutionClik) forControlEvents:UIControlEventTouchUpInside];
        [footerView addSubview:submit];
        
        return footerView;
    }
}

#pragma mark -- XFStepViewDelegate
- (void)buttonStep:(int)index
{
    switch (index) {
        case 0:
            //一颗星
            
            break;
        case 1:
            //两颗星
            
            break;
        case 2:
            //三颗星

            break;
        case 3:
            //四颗星
            
            break;
        case 4:
            //五颗星
        
            break;
        default:
            break;
    }
    
}

#pragma mark -- 提交
- (void)submitEvalutionClik
{
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(ScreenWidth, 100);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(ScreenWidth, 175);
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.photosArray.count+1;
}

#pragma mark -- 界面设置
- (void)setupContent
{
    if (IS_IPhone5) {
        //自动布局
        self.extendedLayoutIncludesOpaqueBars = YES;
        if (@available(iOS 11.0, *)) {
            self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    UICollectionViewFlowLayout *flowyout = [[UICollectionViewFlowLayout alloc] init];
    flowyout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowyout.minimumLineSpacing = 0.0f;
    flowyout.minimumInteritemSpacing = 0.0f;
    flowyout.itemSize = CGSizeMake(ScreenWidth/ 3, ScreenWidth/ 3);

    //创建
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, NavGaitonBarH, ScreenWidth, ScreenHeight - NavGaitonBarH) collectionViewLayout:flowyout];
    self.collectionView.backgroundColor = [UIColor colorWithHexString:@"#F0F0F0"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerID];
    [self.view addSubview:self.collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
