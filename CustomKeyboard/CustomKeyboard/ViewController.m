//
//  ViewController.m
//  CustomKeyboard
//
//  Created by 沈和平 on 16/9/20.
//  Copyright © 2016年 SHP. All rights reserved.
//

#import "ViewController.h"

#import "HPCustomKeyboardView.h"

#import "HPCustomKeyboardTextField.h"

@interface ViewController ()<UITextFieldDelegate>

@property (weak,nonatomic) UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"自定义键盘";
    self.view.backgroundColor = [UIColor grayColor];
    
    HPCustomKeyboardTextField *field = [[HPCustomKeyboardTextField alloc]initWithFrame:CGRectMake(50, 80, 180, 50) randomKeyboard:YES];
    field.borderStyle = UITextBorderStyleRoundedRect;
    
    field.changeTextFieldBlock = ^(NSString *text){
    };
    field.placeholder = @"自定义密码键盘";
    [self.view addSubview:field];
    
}

@end









