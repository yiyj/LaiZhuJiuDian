//
//  TimeViewController.m
//  LaiZhu
//
//  Created by apple on 2018/2/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "TimeViewController.h"
#import "CalendarHomeViewController.h"

@interface TimeViewController ()
{
    UIView *_mainView;
    CalendarHomeViewController *_chvc;
}
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) NSMutableArray *datas;


@end

@implementation TimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Time";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(popToViewController) image:@"导航栏返回" highImage:nil];

    self.dataArray=[[NSMutableArray alloc] init];
    self.datas=[[NSMutableArray alloc] init];
    
    _chvc = [[CalendarHomeViewController alloc]init];
    _chvc.view.frame=CGRectMake(0, NavGaitonBarH, self.view.frame.size.width, self.view.frame.size.height - NavGaitonBarH);
    [self.view addSubview:_chvc.view];
    
    [_chvc setHotelToDay:9000 ToDateforString:nil];
    
    __block typeof(self) weakSelf = self;
    
    [self mainViewClass:0];
    
    _chvc.calendarblock = ^(CalendarDayModel *model){
        
        NSLog(@"%@",[model toString]);
        
        NSString *month = @"Dec";
        if (model.month == 1) {
            month = @"Jan";
        }else if (model.month == 2) {
            month = @"Feb";
        }else if (model.month == 3) {
            month = @"Mar";
        }else if (model.month == 4) {
            month = @"Apr";
        }else if (model.month == 5) {
            month = @"May";
        }else if (model.month == 6) {
            month = @"June";
        }else if (model.month == 7) {
            month = @"July";
        }else if (model.month == 8) {
            month = @"Aug";
        }else if (model.month == 9) {
            month = @"Sept";
        }else if (model.month == 10) {
            month = @"Oct";
        }else if (model.month == 11) {
            month = @"Nov";
        }
        if (model.style==CellDayTypeClick) {
            
            [weakSelf.dataArray addObject:[NSString stringWithFormat:@"%@ %ld",month,model.day]];
            [weakSelf.datas addObject:[model toString]];
            
            NSSet *sets = [NSSet setWithArray:weakSelf.dataArray];
            weakSelf.dataArray=[[sets allObjects] mutableCopy];
            
            [weakSelf.datas sortUsingComparator:^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
                return [obj1 compare:obj2];
            }];
            
            NSSet *set = [NSSet setWithArray:weakSelf.dataArray];
            weakSelf.dataArray=[[set allObjects] mutableCopy];
            
            [weakSelf.dataArray sortUsingComparator:^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
                return [obj1 compare:obj2];
            }];
            
        }else {
            [weakSelf.datas removeObject:model.toString];

            [weakSelf.dataArray removeObject:[NSString stringWithFormat:@"%@ %ld",month,model.day]];
        }
        
        [weakSelf mainViewClass:weakSelf.dataArray.count];
    };
}

-(void)mainViewClass:(NSInteger)num
{
    
    [_mainView removeFromSuperview];
    
    _mainView=[[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-50,self.view.frame.size.width,50)];
    _mainView.backgroundColor=[UIColor grayColor];
    [self.view addSubview:_mainView];
    
    
    UILabel * lable =[[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    lable.font=[UIFont systemFontOfSize:14.0f];
    lable.textColor=[UIColor whiteColor];
    lable.textAlignment=NSTextAlignmentCenter;
    lable.numberOfLines = 2;
    [_mainView addSubview:lable];
    
    if(num==0) {
        lable.text=@"Please choose the time to stay";
    }
    if(num==1) {
        lable.text=@"Please choose the time to leave the shop";
    }
    if(num==2){
    
        NSDate *date = [NSDate date];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"YYYY-MM-dd"];
        NSDate* date1 = [formatter dateFromString:[self.datas objectAtIndex:0]];
        NSDate* date2 = [formatter dateFromString:[self.datas objectAtIndex:1]];
        NSDate *currenDate = [formatter dateFromString:[formatter stringFromDate:date]];
        
        NSLog(@"%@",currenDate);
        NSLog(@"%@",date1);
        NSLog(@"%@",date2);
        
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        //选中两日期间间隔天数
        NSDateComponents *comps = [gregorian components:NSCalendarUnitDay fromDate:date1 toDate:date2  options:0];
        NSInteger days = [comps day];
        //选中最小日期间距离当前日期的天数
        NSDateComponents *currentComps = [gregorian components:NSCalendarUnitDay fromDate:date toDate:date1  options:0];
        NSInteger currentDays = [currentComps day];
        //选中最大日期间距离当前日期的天数
        NSDateComponents *maxComps = [gregorian components:NSCalendarUnitDay fromDate:date toDate:date2  options:0];
        NSInteger maxDays = [maxComps day];
        
        lable.text=[NSString stringWithFormat:@"%@Booked---%@Leaving\n%ldNights",[self.dataArray objectAtIndex:0],[self.dataArray objectAtIndex:1],(long)days];
        
        //通知
        NSDictionary *timeDict = @{
                                   @"Booked" : [self.dataArray objectAtIndex:0],
                                   @"Leaving" :[self.dataArray objectAtIndex:1]
                                   };
        NSDictionary *timeNightsDict = @{
                                   @"Booked" : [self.dataArray objectAtIndex:0],
                                   @"Leaving": [self.dataArray objectAtIndex:1],
                                   @"nights" : [NSString stringWithFormat:@"%ld",(long)days]
                                   };
        if (currentDays > 30 || maxDays > 30) {
            [self.view makeToast:@"Please choose a time less than 30 days from the current date" duration:ToastTime position:CSToastPositionCenter];
        }else if (days > 30) {
            [self.view makeToast:@"Please choose two dates that are less than 30 days" duration:ToastTime position:CSToastPositionCenter];
        }else {
            //首页通知
            [[NSNotificationCenter defaultCenter] postNotificationName:@"OrdingTime" object:nil userInfo:timeDict];
            //酒店详情通知
            [[NSNotificationCenter defaultCenter] postNotificationName:@"JDetaillNoti" object:nil userInfo:timeNightsDict];
            
            //两个均选择就返回
            [self popToViewController];
        }       
    }
    
}

- (void)popToViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
