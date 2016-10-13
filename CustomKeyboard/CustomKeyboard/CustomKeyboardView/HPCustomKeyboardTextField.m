//
//  HPCustomKeyboardTextField.m
//  CustomKeyboard
//
//  Created by 沈和平 on 16/10/10.
//  Copyright © 2016年 SHP. All rights reserved.
//

#import "HPCustomKeyboardTextField.h"
#import "HPCustomKeyboardView.h"

@interface HPCustomKeyboardTextField()

/**
 *  键盘是否随机排列
 */
@property (assign,nonatomic) BOOL random;

@end

@implementation HPCustomKeyboardTextField

- (instancetype)initWithFrame:(CGRect)frame randomKeyboard:(BOOL)random {
    _random = random;
    return [self initWithFrame:frame];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        _limitNumber = 6;
        [self UIConfig];
    }
    
    return self;
}

- (void)UIConfig {
    
    HPCustomKeyboardView *customKeyboardView = [[HPCustomKeyboardView alloc]initWithRandomKeyboard:_random];
    
    customKeyboardView.clickActionBlock = ^(NSInteger index){
        
        if (index == 10) {
            [self resignFirstResponder];
            
        }else if (index == 12 ) {
            
            if (self.text.length > 0) {
                self.text = [self.text substringToIndex:self.text.length - 1];
            }
            
        }else {
            self.text = [self.text stringByAppendingString:[NSString stringWithFormat:@"%ld", (long)index]];
        }
        
        if (self.text.length >= _limitNumber) {
            self.text = [self.text substringToIndex:_limitNumber];
        }
        
        if (_changeTextFieldBlock) {
            
            _changeTextFieldBlock(self.text);
            
        }
        
    };
    self.inputView = customKeyboardView;
}

@end
