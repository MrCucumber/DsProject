
//
//  ForgetPasswordViewController.m
//  DsProject
//
//  Created by 黄哲俊 on 15/12/10.
//  Copyright © 2015年 own. All rights reserved.
//

#import "ForgetPasswordViewController.h"

@interface ForgetPasswordViewController ()<UITextFieldDelegate>
@property (nonatomic, strong)UIButton *buttonYzm;               // 验证码按钮
@property (nonatomic, strong)UIButton *buttonSumbit;            // 提交重设密码
@property (nonatomic, strong)UIView *viewAgnPassword;           // view再次输入密码
@property (nonatomic, strong)UIView *viewYzm;                   // view验证码
@property (nonatomic, strong)UITextField *textFieldPhone;       // 输入框手机
@property (nonatomic, strong)UITextField *textFieldPassword;    // 密码输入框
@property (nonatomic, strong)UITextField *textFieldAgnPassword; // 再次输入密码
@property (nonatomic, strong)UITextField *textFieldYzm;         // 验证码

@property (nonatomic, strong) UIImageView *imgPhone;
@property (nonatomic, strong) UIImageView *imgPassword;
@property (nonatomic, strong) UIImageView *imgAgnPassword;
@property (nonatomic, strong) UIImageView *imgYzm;

@property (nonatomic, strong) UIScrollView *scrollView;



@end

@implementation ForgetPasswordViewController


# pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"忘记密码";
    [self createForgetPasswordView];// 创建一个忘记密码页面
}

// 创建一个忘记密码页面
- (void)createForgetPasswordView {

    [self.view addSubview:self.scrollView];
    //logoImage
    UIImageView *imgDj = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_log"]];
    imgDj.frame = CGRectMake(SCREEN_WIDTH/2 - imgDj.frame.size.width/2, 54 , 100, 143);
    imgDj.contentMode = UIViewContentModeScaleAspectFit;
    [self.scrollView addSubview:imgDj];
    
    // 手机号view
    UIView *viewPhone = [[UIView alloc]initWithFrame:CGRectMake(63, imgDj.bottom + 81, SCREEN_WIDTH - 63 - 63, 32)];
    viewPhone.backgroundColor = [UIColor colorWithRed:57.0/255.0 green:63.0/255.0 blue:78.0/255 alpha:1];
    [viewPhone.layer setCornerRadius:2];
    [self.scrollView addSubview:viewPhone];
    
    // 输入密码view
    UIView *viewPassword = [[UIView alloc]initWithFrame:CGRectMake(63, viewPhone.bottom +18, SCREEN_WIDTH - 63 - 63, 32)];
    viewPassword.backgroundColor = [UIColor colorWithRed:57.0/255.0 green:63.0/255.0 blue:78.0/255 alpha:1];
    [viewPassword.layer setCornerRadius:2];
    [self.scrollView addSubview:viewPassword];
    
    // 在此输入密码view
    self.viewAgnPassword = [[UIView alloc]initWithFrame:CGRectMake(63, viewPassword.bottom + 18, SCREEN_WIDTH - 63 - 63, 32)];
    self.viewAgnPassword.backgroundColor = [UIColor colorWithRed:57.0/255.0 green:63.0/255.0 blue:78.0/255.0 alpha:1];
    [self.viewAgnPassword.layer setCornerRadius:2];
    [self.scrollView addSubview:self.viewAgnPassword];
    
    // 验证码view
    self.viewYzm = [[UIView alloc]initWithFrame:CGRectMake(63, self.viewAgnPassword.bottom + 18, SCREEN_WIDTH - 63 -63 -12 -82, 32)];
    self.viewYzm.backgroundColor = [UIColor colorWithRed:57.0/255.0 green:63.0/255.0 blue:78.0/255.0 alpha:1];
    [self.viewYzm.layer setCornerRadius:2];
    [self.scrollView addSubview:self.viewYzm];
    
    
    self.imgPhone = [[UIImageView alloc]initWithFrame:CGRectMake(10, 6, 20, 20)];
    self.imgPhone.image = [UIImage imageNamed:@"icon_iPhone"];
    [viewPhone addSubview:self.imgPhone];
    
    self.imgPassword = [[UIImageView alloc]initWithFrame:CGRectMake(10, 6, 20, 20)];
    self.imgPassword.image = [UIImage imageNamed:@"icon_password"];
    [viewPassword addSubview:self.imgPassword];
    
    self.imgAgnPassword = [[UIImageView alloc]initWithFrame:CGRectMake(10, 6, 20, 20)];
    self.imgAgnPassword.image = [UIImage imageNamed:@"icon_password"];
    [self.viewAgnPassword addSubview:self.imgAgnPassword];
    
    self.imgYzm = [[UIImageView alloc]initWithFrame:CGRectMake(10, 6, 20, 20)];
    self.imgYzm.image = [UIImage imageNamed:@"icon_Code"];
    [self.viewYzm addSubview:self.imgYzm];

    [viewPhone addSubview:self.textFieldPhone];         // textfield手机号
    [viewPassword addSubview:self.textFieldPassword];      // textfield密码
    [self.viewAgnPassword addSubview:self.textFieldAgnPassword];   // textfield在此输入密码
    [self.viewYzm addSubview:self.textFieldYzm];           // textfield验证码
    [self.scrollView addSubview:self.buttonYzm];              // button验证码 按钮
    [self.scrollView addSubview:self.buttonSumbit];           // button 提交按钮
    
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, self.buttonSumbit.bottom + 30);
    
    UITapGestureRecognizer *taper = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapsion)];
    taper.numberOfTouchesRequired=1;
    [self.scrollView addGestureRecognizer:taper];

}

#pragma mark - 私有方法

- (void)buttonYzmAct {
        // 先检测账户
        if (![self isPhoneNum:self.textFieldPhone.text]) { // 检测手机号
            NSLog(@"not a phone num"); // 不是一个手机号
            [self showHint:@"请输入正确的手机号"];
            return;
        } else {
            NSLog(@"a phone num"); // 是一个手机号
            [self TimeAct];

        }
}

/**
 *  判断是否为手机号
 *  规则为首位为1长度11
 */
- (BOOL)isPhoneNum:(NSString *)number {
    if ([number isEqualToString:@""] || number == nil) {
        return NO;
    }
    
    if (number.length != 11) {
        return NO;
    }
    
    if (![[number substringToIndex:1] isEqualToString:@"1"]) {
        return NO;
    }
    
    return YES;
}


- (void)forgetAct {
    // 先检测账户
    if (![self isPhoneNum:self.textFieldPhone.text]) { // 检测手机号
        NSLog(@"not a phone num"); // 不是一个手机号
        [self showHint:@"请输入正确的手机号"];
        return;
    } else {
        NSLog(@"a phone num"); // 是一个手机号
    }
    
    // 再检测密码
    if (self.textFieldPassword.text.length <= 0) {
        [self showHint:@"请输入密码"];
        return;
    }else if (![self.textFieldAgnPassword.text isEqualToString:self.textFieldPassword.text]) {
        [self showHint:@"您输入的两次密码不相同"];
    }else if ([self.textFieldYzm.text isEqualToString:@""]||self.textFieldYzm.text == nil) {
        [self showHint:@"验证码不可为空"];
    }else {
        [self.navigationController popViewControllerAnimated:YES];
        [self showHint:@"重置密码成功"];
    }
}

-(void)TimeAct{
    
    __block int timeout=59; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self.buttonYzm setTitle:@"获取验证码" forState:UIControlStateNormal];
                self.buttonYzm.userInteractionEnabled = YES;
            });
        }else{
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                //NSLog(@"____%@",strTime);
                
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                self.buttonYzm.titleLabel.font = [UIFont systemFontOfSize:15];
                [self.buttonYzm setTitle:[NSString stringWithFormat:@"剩余%@秒",strTime] forState:UIControlStateNormal];
                [UIView commitAnimations];
                self.buttonYzm.userInteractionEnabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

#pragma mark - 懒加载

//- (UITextField *)textFieldPhone {
//    if (!_textFieldPhone) {
//        _textFieldPhone = [[UITextField alloc]initWithFrame:CGRectMake(15, 2, SCREEN_WIDTH - 63 - 63 - 15, 32)];
//        _textFieldPhone.placeholder = @"手机号";
//        [_textFieldPhone setValue:[UIColor colorWithRed:83.0/255 green:89.0/255.0 blue:104.0/255.0 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
//        [_textFieldPhone setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
//
//    }
//    return _textFieldPhone;
//}
//
//- (UITextField *)textFieldPassword {
//    if (!_textFieldPassword) {
//        _textFieldPassword = [[UITextField alloc]initWithFrame:CGRectMake(15, 2, SCREEN_WIDTH - 63 - 63 - 15, 32)];
//        _textFieldPassword.placeholder = @"手机密码";
//        [_textFieldPassword setValue:[UIColor colorWithRed:83.0/255 green:89.0/255.0 blue:104.0/255.0 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
//        [_textFieldPassword setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
//
//
//    }
//    return _textFieldPassword;
//}
//
//- (UITextField *)textFieldAgnPassword {
//    if (!_textFieldAgnPassword) {
//        _textFieldAgnPassword = [[UITextField alloc]initWithFrame:CGRectMake(15, 2, SCREEN_WIDTH - 63 - 63 - 15, 32)];
//        _textFieldAgnPassword.placeholder = @"确认密码";
//        [_textFieldAgnPassword setValue:[UIColor colorWithRed:83.0/255 green:89.0/255.0 blue:104.0/255.0 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
//        [_textFieldAgnPassword setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
//
//    }
//    return _textFieldAgnPassword;
//}
//
//- (UITextField *)textFieldYzm {
//    if (!_textFieldYzm) {
//        _textFieldYzm = [[UITextField alloc]initWithFrame:CGRectMake(15, 2, SCREEN_WIDTH - 63 - 63 - 15, 32)];
//        _textFieldYzm.placeholder = @"验证码";
//        [_textFieldYzm setValue:[UIColor colorWithRed:83.0/255 green:89.0/255.0 blue:104.0/255.0 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
//        [_textFieldYzm setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
//
//    }
//    return _textFieldYzm;
//}

- (UITextField *)textFieldPhone {
    if (!_textFieldPhone) {
        _textFieldPhone = [[UITextField alloc]initWithFrame:CGRectMake(self.imgPhone.right + 10, 2, self.viewAgnPassword.width - 40, 32)];
        _textFieldPhone.placeholder = @"请输入有效号码";
        _textFieldPhone.delegate = self;
        [_textFieldPhone setValue:[UIColor colorWithRed:83.0/255 green:89.0/255.0 blue:104.0/255.0 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
        [_textFieldPhone setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
        
    }
    return _textFieldPhone;
}

- (UITextField *)textFieldPassword {
    if (!_textFieldPassword) {
        _textFieldPassword = [[UITextField alloc]initWithFrame:CGRectMake(self.imgPassword.right + 10, 2, self.viewAgnPassword.width - 40, 32)];
        _textFieldPassword.placeholder = @"密码6到12位";
        _textFieldPassword.secureTextEntry = YES;
        _textFieldPassword.delegate = self;
        [_textFieldPassword setValue:[UIColor colorWithRed:83.0/255 green:89.0/255.0 blue:104.0/255.0 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
        [_textFieldPassword setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
        
        
    }
    return _textFieldPassword;
}

- (UITextField *)textFieldAgnPassword {
    if (!_textFieldAgnPassword) {
        _textFieldAgnPassword = [[UITextField alloc]initWithFrame:CGRectMake(self.imgAgnPassword.right + 10 , 2, self.viewAgnPassword.width - 40, 32)];
        _textFieldAgnPassword.placeholder = @"确认密码";
        _textFieldAgnPassword.secureTextEntry = YES;
        _textFieldAgnPassword.delegate = self;
        [_textFieldAgnPassword setValue:[UIColor colorWithRed:83.0/255 green:89.0/255.0 blue:104.0/255.0 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
        [_textFieldAgnPassword setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
        
    }
    return _textFieldAgnPassword;
}

- (UITextField *)textFieldYzm {
    if (!_textFieldYzm) {
        _textFieldYzm = [[UITextField alloc]initWithFrame:CGRectMake(self.imgYzm.right + 10, 2, self.viewYzm.width - 40, 32)];
        _textFieldYzm.placeholder = @"验证码";
        _textFieldYzm.delegate = self;
        [_textFieldYzm setValue:[UIColor colorWithRed:83.0/255 green:89.0/255.0 blue:104.0/255.0 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
        [_textFieldYzm setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
        
    }
    return _textFieldYzm;
}

- (UIButton *)buttonYzm {
    if (!_buttonYzm) {
        _buttonYzm = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonYzm.frame = CGRectMake(self.viewYzm.right + 12, self.viewAgnPassword.bottom + 18, 80, 32);
        _buttonYzm.backgroundColor = [UIColor colorWithRed:82.0/255.0 green:147.0/255.0 blue:134.0/255.0 alpha:1];
        _buttonYzm.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [_buttonYzm addTarget:self action:@selector(buttonYzmAct) forControlEvents:UIControlEventTouchUpInside];
        [_buttonYzm setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_buttonYzm.layer setCornerRadius:2];
    }
    return _buttonYzm;
}

- (UIButton *)buttonSumbit {
    if (!_buttonSumbit) {
        _buttonSumbit = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonSumbit.frame = CGRectMake(63, self.viewYzm.bottom + 21, SCREEN_WIDTH - 63 - 63, 32);
        _buttonSumbit.backgroundColor = [UIColor colorWithRed:35.0/255.0 green:169.0/255.0 blue:142.0/255.0 alpha:1];
        _buttonSumbit.titleLabel.textColor = [UIColor colorWithRed:142.0/255.0 green:206.0/255.0 blue:194.0/255.0 alpha:1];
        [_buttonSumbit setTitle:@"重置密码" forState:UIControlStateNormal];
        [_buttonSumbit addTarget:self action:@selector(forgetAct) forControlEvents:UIControlEventTouchUpInside];
        [_buttonSumbit.layer setCornerRadius:2];
        
    }
    return _buttonSumbit;
}
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
        _scrollView.bounces = NO;
    }
    return _scrollView;
}

// 开始编辑
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if (DEVICE_IS_IPHONE4) {
        self.view.frame = CGRectMake(0, self.view.frame.origin.y - 150, self.view.frame.size.width, self.view.frame.size.height);
    }else if (DEVICE_IS_IPHONE5) {
        self.view.frame = CGRectMake(0, self.view.frame.origin.y - 150, self.view.frame.size.width, self.view.frame.size.height);
    }else {
        return;
    }
}

// 结束编辑
-(void)textFieldDidEndEditing:(UITextField *)textField{
    self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

// 键盘收回
- (void)tapsion {
    [self keyboardShouldReturn];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.textFieldPhone) {
        [theTextField resignFirstResponder];
    }else if (theTextField == self.textFieldPassword) {
        [theTextField resignFirstResponder];
    }else if (theTextField == self.textFieldAgnPassword) {
        [theTextField resignFirstResponder];
    }else if (theTextField == self.textFieldYzm) {
        [theTextField resignFirstResponder];
    }
    return YES;
}

@end
