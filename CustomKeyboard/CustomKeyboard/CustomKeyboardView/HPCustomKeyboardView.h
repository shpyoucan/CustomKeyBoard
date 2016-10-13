//
//  HPCustomKeyboardView.h
//  CustomKeyboard
//
//  Created by 沈和平 on 16/9/20.
//  Copyright © 2016年 SHP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPCustomKeyboardView : UIView

/**
 *  点击键盘回调
 */
@property (copy,nonatomic) void(^clickActionBlock)(NSInteger index);

- (instancetype)initWithRandomKeyboard:(BOOL)random;

@end
