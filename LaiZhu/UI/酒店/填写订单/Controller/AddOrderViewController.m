//
//  AddOrderViewController.m
//  LaiZhu
//
//  Created by apple on 2018/2/25.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "AddOrderViewController.h"
#import "OrderHeaderCell.h"
#import "OrderRomsCell.h"
#import "OrderPersonsCell.h"
#import "OrderOtherInfroCell.h"
#import "OrderPromtCell.h"
#import "OrderCostInfroCell.h"
#import "SubmitOrderViewController.h"

static NSString  *const orderTouCellId = @"OrderHeaderCell";
static NSString  *const orderRomCellId = @"OrderRomsCell";
static NSString  *const orderPersonCellId = @"OrderPersonsCell";
static NSString  *const orderOtherCellId = @"OrderOtherInfroCell";
static NSString  *const orderPromtCellId = @"OrderPromtCell";
static NSString  *const orderCostCellId = @"OrderCostInfroCell";

@interface AddOrderViewController ()<UITableViewDelegate,UITableViewDataSource,OrderRomsCellDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;

@property (weak, nonatomic) IBOutlet UILabel *totalPrice;
@property (assign, nonatomic) CGFloat romHeight;
@property (assign, nonatomic) CGFloat PersonHeight;
/** 房间数 */
@property (assign, nonatomic) NSInteger romsNumber;

@end

@implementation AddOrderViewController

- (NSMutableArray *)dataSource
{
    if (_dataSource==nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Fill in the order";
    self.romsNumber = 2;
    self.romHeight = 50.0f;
    self.PersonHeight = 50.0f;
    //导航栏
    [self setupNav];
    //界面设置
    [self setupContent];
}

#pragma mark - UITableView代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
        OrderHeaderCell *headerCell = [tableView dequeueReusableCellWithIdentifier:orderTouCellId];
        if (!headerCell) {
            headerCell = [[OrderHeaderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:orderTouCellId];
        }

        return headerCell;
        
    }else if (indexPath.row == 1) {
        
        OrderRomsCell *romsCell = [tableView dequeueReusableCellWithIdentifier:orderRomCellId];
        if (!romsCell) {
            romsCell = [[OrderRomsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:orderRomCellId];
        }
        
        romsCell.delegate = self;
        
        [romsCell orderRomsCellWithNumber:self.romsNumber indexPath:indexPath];
        
        return romsCell;
        
    }else if (indexPath.row == 2) {
        
        OrderPersonsCell *personCell = [tableView dequeueReusableCellWithIdentifier:orderPersonCellId];
        if (!personCell) {
            personCell = [[OrderPersonsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:orderPersonCellId];
        }
        NSMutableArray *arr = [NSMutableArray array];
        for (int i = 0; i < self.romsNumber; i ++) {
            [arr addObject:[NSString stringWithFormat:@"name%d",i]];
        }
        [personCell orderPersonsCellWithArray:arr indexPath:indexPath];
        
        return personCell;
        
    }else if (indexPath.row == 7) {
        
        OrderPromtCell *promtCell = [tableView dequeueReusableCellWithIdentifier:orderPromtCellId];
        if (!promtCell) {
            promtCell = [[OrderPromtCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:orderPromtCellId];
        }
        [promtCell orderPromtCellWithContent:@"Warm hint: the room is reserved to 2018-02-28"];
        
        return promtCell;
        
    }else if (indexPath.row == 8) {
        
        OrderCostInfroCell *costCell = [tableView dequeueReusableCellWithIdentifier:orderCostCellId];
        if (!costCell) {
            costCell = [[OrderCostInfroCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:orderCostCellId];
        }
        
        return costCell;
        
    }else {
        
        OrderOtherInfroCell *otherCell = [tableView dequeueReusableCellWithIdentifier:orderOtherCellId];
        if (!otherCell) {
            otherCell = [[OrderOtherInfroCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:orderOtherCellId];
        }
        [otherCell orderOtherInfroCellWithType:nil indexPath:indexPath];
        
        return otherCell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
    }
}

#pragma mark -- 房间数选择
- (void)orderRomsCellWithHeight:(CGFloat)height indexPath:(NSIndexPath *)indexPath peoples:(NSInteger)persons
{
    self.romsNumber = persons;
    self.romHeight = height;
    OrderRomsCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    //入住人根据房间数来确定
    self.PersonHeight = [cell.romNumber.text integerValue] * 50.0f;
    
    [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 90;
    }else if (indexPath.row == 1) {
        return self.romHeight;
    }else if (indexPath.row == 2) {
        return self.PersonHeight;
    }else if (indexPath.row == 3 || indexPath.row == 4 || indexPath.row == 5 || indexPath.row == 6) {
        return 50;
    }else {
        return UITableViewAutomaticDimension;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return NULL;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return NULL;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001f;
}

#pragma mark - 提交订单
- (IBAction)submitOrder:(UIButton *)sender {
    
    SubmitOrderViewController *submitVc = [[SubmitOrderViewController alloc] init];
    [self.navigationController pushViewController:submitVc animated:YES];
}

#pragma mark -- 界面设置
- (void)setupContent
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NavGaitonBarH, ScreenWidth, ScreenHeight-NavGaitonBarH-55) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [tableView registerNib:[UINib nibWithNibName:orderTouCellId bundle:nil] forCellReuseIdentifier:orderTouCellId];
    [tableView registerNib:[UINib nibWithNibName:orderRomCellId bundle:nil] forCellReuseIdentifier:orderRomCellId];
    [tableView registerNib:[UINib nibWithNibName:orderPersonCellId bundle:nil] forCellReuseIdentifier:orderPersonCellId];
    [tableView registerNib:[UINib nibWithNibName:orderOtherCellId bundle:nil] forCellReuseIdentifier:orderOtherCellId];
    [tableView registerNib:[UINib nibWithNibName:orderPromtCellId bundle:nil] forCellReuseIdentifier:orderPromtCellId];
    [tableView registerNib:[UINib nibWithNibName:orderCostCellId bundle:nil] forCellReuseIdentifier:orderCostCellId];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.tableFooterView = [UIView new];
    tableView.estimatedRowHeight = 50;
    self.tableView = tableView;
    [self.view addSubview:tableView];
}

#pragma mark -- 导航栏
- (void)setupNav
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(popToViewController) image:@"导航栏返回" highImage:nil];
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
