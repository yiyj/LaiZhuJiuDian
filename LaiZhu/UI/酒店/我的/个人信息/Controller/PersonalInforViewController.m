//
//  PersonalInforViewController.m
//  LaiZhu
//
//  Created by apple on 2018/2/27.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "PersonalInforViewController.h"
#import "TZImagePickerController.h"
#import "ActionSheetView.h"

@class YYJTextFiled;

@interface PersonalInforViewController ()<UIActionSheetDelegate,TZImagePickerControllerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate>
/** 头像 */
@property (weak, nonatomic) IBOutlet UIButton *iconBtn;
/** 昵称 */
@property (weak, nonatomic) IBOutlet YYJTextFiled *nickName;
/** 性别 */
@property (weak, nonatomic) IBOutlet UILabel *sex;
/** 年龄 */
@property (weak, nonatomic) IBOutlet YYJTextFiled *age;
/** 手机 */
@property (weak, nonatomic) IBOutlet UILabel *mobPhone;



@end

@implementation PersonalInforViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Personal information";
    //导航栏
    [self setupNav];
    //界面设置
    [self setupContent];                    
}


- (IBAction)buttonClick:(UIButton *)sender {
    
    if ([sender.titleLabel.text isEqualToString:@"性别"]) {
        
        ActionSheetView *action = [[ActionSheetView alloc] initWithTitleView:nil optionsArr:@[@"Man", @"Woman",@"Secrecy"] cancelTitle:@"Cancel" cancelBlock:^{
            
        } selectBlock:^(NSInteger index) {
            
        } selectBlockString:^(NSString *selectString) {
            
            self.sex.text = selectString;
            
        }];
        [self.view addSubview:action];
        
    }else { // 头像
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth-20, 43)];
        label.backgroundColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"Replace the head";
        label.font = Font(15);
        
        ActionSheetView *action = [[ActionSheetView alloc] initWithTitleView:label optionsArr:@[@"Photograph", @"Select from the album"] cancelTitle:@"Cancel" cancelBlock:^{
            
        } selectBlock:^(NSInteger index) {
            if (index == 0) {
                
                //拍照
                if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {  //打开照相机
                    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                    picker.title = @"Head portrait";
                    picker.delegate = self;
                    picker.allowsEditing = YES;
                    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                    [self presentViewController:picker animated:YES completion:nil];
                }
            }else{
                
                // 从相册中选
                TZImagePickerController *imagePicker = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
                imagePicker.title = @"Head portrait";
                //跳转
                [self presentViewController:imagePicker animated:YES completion:nil];
                
                [imagePicker setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
                    
                    UIImage *image = photos.firstObject;
                    //                    NSData *data = UIImagePNGRepresentation(image);
                    NSData *data = UIImageJPEGRepresentation(image, 0.5f);
                    
                    //                    [self.headerImage setBackgroundImage:[UIImage imageWithData:data] forState:UIControlStateNormal];
                    [self.iconBtn setBackgroundImage:image forState:UIControlStateNormal];
                    
//                    NSString *base64Encoded = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
//                    YYJNSLog(@"%@",base64Encoded);
                    
                }];
            }
        } selectBlockString:^(NSString *selectString) {
            
        }];
        [self.view addSubview:action];
    }
}

#pragma mark -- UIImagePickerController
- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info

{
    [self dismissViewControllerAnimated:YES completion:^{
        
        NSString *medicType = [info objectForKey:UIImagePickerControllerMediaType];
        
        //判断选中的是不是图片
        if ([medicType isEqualToString:(NSString *)kUTTypeImage])
        {
            //得到选中的图片
            UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
            NSData *data = UIImageJPEGRepresentation(image, 0.5f);
            
            [self.iconBtn setBackgroundImage:image forState:UIControlStateNormal];
            
//            NSString *base64Encoded = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
            
        }
    }];
    
}

#pragma mark -- 界面设置
- (void)setupContent
{
    self.iconBtn.layer.cornerRadius = self.iconBtn.width/2;
    self.nickName.delegate = self;
    self.age.delegate = self;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == self.nickName) {
        
    }else if (textField == self.age) {
        
    }
    [self submitMyInfromationClick];
}


#pragma mark - 导航栏
- (void)setupNav
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(poToController) image:@"导航栏返回" highImage:nil];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(submitMyInfromationClick) title:@"keep" titleColor:@"#FFFFFF" font:14];

}

#pragma mark -- 保存我的信息
- (void)submitMyInfromationClick
{
    
}

- (void)poToController
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
