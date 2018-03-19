//
//  PersonNameCell.m
//  LaiZhu
//
//  Created by apple on 2018/2/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "PersonNameCell.h"

@implementation PersonNameCell
{
    void (^_block)(NSString *inputResult);
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.textField = [[UITextField alloc] init];
        self.textField.font = [UIFont systemFontOfSize:13];
        self.textField.textColor = [UIColor colorWithHexString:@"666666"];
        self.textField.textAlignment = NSTextAlignmentLeft;
        self.textField.delegate = self;
        self.textField.backgroundColor = [UIColor whiteColor];
        self.textField.clearButtonMode = UITextFieldViewModeAlways;
        self.textField.borderStyle = UITextBorderStyleNone;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldChanging:) name:UITextFieldTextDidChangeNotification object:self.textField];

        [self.contentView addSubview:self.textField];
        
        [self autoLayout];
        
    }
    return self;
    
}

- (void)setCellInfoName:(NSString *)name withInputDesc:(NSString*)desc WithReturnBlock:(void (^)(NSString *))textFieldBlock
{
    _textField.text = name;
    _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _block = textFieldBlock;
    _textField.placeholder = desc;
}

-(void)textFieldChanging:(id)sender{
    if (_block) {
        _block(self.textField.text);
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.textField resignFirstResponder];
    
    return YES;
}
/**
 * 页面自动适配
 */
-(void)autoLayout{
    
    self.textField.x = 10;
    self.textField.height = 50;
    self.textField.y = 0;
    self.textField.width = self.width-10;
    
}

- (void)setFrame:(CGRect)frame
{
    frame.origin.y -= 0.5;//整体向上 移动0.5
    frame.size.height += 0.5;//间隔为0.5
    [super setFrame:frame];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
