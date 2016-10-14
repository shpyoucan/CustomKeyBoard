# CustomKeyBoard
自定义数字交易密码键盘

1.基本使用：
      HPCustomKeyboardTextField *field = [[HPCustomKeyboardTextField alloc]initWithFrame:CGRectMake(50, 80, 180, 50) randomKeyboard:YES];
    field.borderStyle = UITextBorderStyleRoundedRect;
    // 键入改变值时回调
    field.changeTextFieldBlock = ^(NSString *text){
    };
    [self.view addSubview:field];
    
2.一些属性：
  - (instancetype)initWithFrame:(CGRect)frame randomKeyboard:(BOOL)random; random标识键盘是否随机排列。
  @property (assign,nonatomic) NSInteger limitNumber;最多输入几位数字，默认6位。
