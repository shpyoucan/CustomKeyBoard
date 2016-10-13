//
//  HPCustomKeyboardView.m
//  CustomKeyboard
//
//  Created by 沈和平 on 16/9/20.
//  Copyright © 2016年 SHP. All rights reserved.
//

#import "HPCustomKeyboardView.h"

@interface HPCustomKeyboardView()

@property (assign,nonatomic) BOOL random;

@end

@implementation HPCustomKeyboardView

- (instancetype)initWithRandomKeyboard:(BOOL)random {
    _random = random;
    return [self initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 216)];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 216);
        self.backgroundColor = [UIColor whiteColor];
        
        self.userInteractionEnabled = YES;
        
        [self UIConfig];
    }
    return self;
    
}

- (void)UIConfig {
    
    UIView *topBg = [[UIView alloc]init];
    
    UIImage *topImg = [UIImage imageNamed:@"keyboard_gou"];
    UIImageView *topImgV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, topImg.size.width, topImg.size.height)];
    topImgV.image = topImg;
    [topBg addSubview:topImgV];
    
    UILabel *topDescri = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(topImgV.frame) + 5, 0, 80, 20)];
    topDescri.text = @"国金宝安全键盘";
    topDescri.font = [UIFont systemFontOfSize:11.0];
    topDescri.textAlignment = NSTextAlignmentCenter;
    topDescri.textColor = [UIColor colorWithRed:0.400 green:0.400 blue:0.400 alpha:1.00];
    [topBg addSubview:topDescri];
    
    topBg.frame = CGRectMake( (self.bounds.size.width - topImgV.bounds.size.width - topDescri.bounds.size.width) / 2.0 , 5, CGRectGetMaxX(topDescri.frame) - CGRectGetMinX(topImgV.frame), CGRectGetMaxY(topDescri.frame));
    CGRect topImgVFrame =  topImgV.frame;
    topImgVFrame.origin.y = (topBg.bounds.size.height - topImgV.bounds.size.height) / 2.0;
    topImgV.frame = topImgVFrame;
    [self addSubview:topBg];
    
    NSArray *keyboardContent = @[@"1",
                                 @"2",
                                 @"3",
                                 @"4",
                                 @"5",
                                 @"6",
                                 @"7",
                                 @"8",
                                 @"9",
                                 @"0",];
    
    NSArray *sortArr;
    if (_random) {
        sortArr = [keyboardContent sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
            
            int index = arc4random_uniform(2);
            
            if (index) {
                return [obj1 compare:obj2];
                
            }else {
                return [obj2 compare:obj1];
            }
            
        }    ];
        
    }else {
        sortArr = keyboardContent;
    }
    
    int rows = 3;
    int columns = 4;
    CGFloat topH = CGRectGetMaxY(topBg.frame);
    CGFloat btnW = 107 * ([UIScreen mainScreen].bounds.size.width / 414.0);
    CGFloat btnH = 42;
    CGFloat spaceW = (self.bounds.size.width - rows * btnW) / (rows + 1.0);
    CGFloat spaceH = (self.bounds.size.height - topH - columns * btnH) / (columns + 1.0);
    
    for (int i = 0; i < 12; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake( (i % rows) * (btnW + spaceW) + spaceW, topH + (i / rows) * (btnH + spaceH) + spaceH, btnW, btnH);
        button.backgroundColor = [UIColor colorWithRed:0.906 green:0.906 blue:0.906 alpha:1.00];
        [button setBackgroundImage:[UIImage imageNamed:@"keyboardBG_select"] forState:UIControlStateHighlighted];
        button.layer.cornerRadius = 5.0;
        button.layer.masksToBounds = YES;
        [button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.font = [UIFont systemFontOfSize:23.0];
        [button setTitleColor:[UIColor colorWithRed:0.196 green:0.196 blue:0.196 alpha:1.00] forState:UIControlStateNormal];
        [self addSubview:button];
        
        if (i == 9 ) {
            [button setTitle:@"完成" forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:16.0];
            button.tag = 10;
            
        }else if (i == 10) {
             [button setTitle:sortArr[9] forState:UIControlStateNormal];
            button.tag = [sortArr[9] integerValue];
            
        }else if (i == 11) {
            [button setImage:[UIImage imageNamed:@"icon_delete"] forState:UIControlStateNormal];
            button.tag = 12;
            
        }else {
            [button setTitle:sortArr[i] forState:UIControlStateNormal];
            button.tag = [sortArr[i] integerValue];
            
        }
    }
    
}

- (void)clickAction:(UIButton *)sender {
    
    _clickActionBlock(sender.tag);
    
}


@end
