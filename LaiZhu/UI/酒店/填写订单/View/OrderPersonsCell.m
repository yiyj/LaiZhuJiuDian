//
//  OrderPersonsCell.m
//  LaiZhu
//
//  Created by apple on 2018/2/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "OrderPersonsCell.h"
#import "PersonNameCell.h"

@interface OrderPersonsCell()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *personTableView;

@property (strong, nonatomic) NSIndexPath *indexPath;

@property (strong, nonatomic) NSMutableArray *names;

@end

@implementation OrderPersonsCell

- (void)orderPersonsCellWithArray:(NSArray *)names indexPath:(NSIndexPath *)indexPath
{
    self.names = (NSMutableArray *)names;
    self.indexPath = indexPath;
    [self.personTableView reloadData];
}

#pragma mark - tableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.names.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString  *identifier = [NSString stringWithFormat:@"PersonNameCell%ld",(long)indexPath.row];

    PersonNameCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell =[[PersonNameCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell setCellInfoName:@"" withInputDesc:@"Fill in only one name" WithReturnBlock:^(NSString *result) {
//            [self.names replaceObjectAtIndex:indexPath.row withObject:result];
        }];
    }
    
//    cell.textField.text = self.names[indexPath.row];
      
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.personTableView.separatorInset = UIEdgeInsetsZero;
    self.personTableView.delegate = self;
    self.personTableView.dataSource = self;
    [self.personTableView registerNib:[UINib nibWithNibName:@"PersonNameCell" bundle:nil] forCellReuseIdentifier:@"PersonNameCell"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.accessoryType = UITableViewCellAccessoryNone;
    // Configure the view for the selected state
}

@end
