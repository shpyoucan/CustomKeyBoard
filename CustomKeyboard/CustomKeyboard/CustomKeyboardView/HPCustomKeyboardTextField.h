//
//  HPCustomKeyboardTextField.h
//  CustomKeyboard
//
//  Created by 沈和平 on 16/10/10.
//  Copyright © 2016年 SHP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPCustomKeyboardTextField : UITextField


/**
 *  限制输入密码位数,默认限制6位
 */
@property (assign,nonatomic) NSInteger limitNumber;

/**
 *  textField文本改变回调
 */
@property (copy,nonatomic) void(^changeTextFieldBlock)(NSString *text);

- (instancetype)initWithFrame:(CGRect)frame randomKeyboard:(BOOL)random;

@end
