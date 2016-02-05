
//
//  RegisterViewController.m
//  DsProject
//
//  Created by 黄哲俊 on 15/12/10.
//  Copyright © 2015年 own. All rights reserved.
//

#import "RegisterViewController.h"
#import "ProtocolViewController.h"

@interface RegisterViewController ()

@property (nonatomic, strong) UIView *viewAgnPassword;
@property (nonatomic, strong) UIView *viewYzm;
@property (nonatomic, strong) UITextField *textFieldPhone;
@property (nonatomic, strong) UITextField *textFieldPassword;
@property (nonatomic, strong) UITextField *textFieldAgnPassword;
@property (nonatomic, strong) UITextField *textFieldYzm;
@property (nonatomic, strong) UIButton *buttonYzm;
@property (nonatomic, strong) NSString *strState;//状态
@property (nonatomic, strong) NSString *strBtnState; // 按钮状态

@property (nonatomic, strong) UIButton *buttonMan;
@property (nonatomic, strong) UIButton *buttonWoman;

@property (nonatomic, strong) UIImageView *imgPhone;
@property (nonatomic, strong) UIImageView *imgPassword;
@property (nonatomic, strong) UIImageView *imgAgnPassword;
@property (nonatomic, strong) UIImageView *imgYzm;

@property (nonatomic, strong) UIScrollView *scrollView;


@end

@implementation RegisterViewController

#pragma mark - 生命周期

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"注册";
    self.strState = @"0";
    self.strBtnState = @"0"; // 0 为选择 1 男 2女
    [self createRegisterView];  // 够贱一个注册view
}

// 够贱一个注册view 204 － 143
- (void)createRegisterView {

    [self.view addSubview:self.scrollView];
    // logoImage
    UIImageView *imgDj = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_log"]];
    imgDj.frame = CGRectMake(SCREEN_WIDTH/2 - imgDj.frame.size.width/2, 52 + 64, 100, 143);
    imgDj.contentMode = UIViewContentModeScaleAspectFit;
    [self.scrollView addSubview:imgDj];
    
    UILabel *labelSexTitle = [[UILabel alloc]initWithFrame:CGRectMake(77, imgDj.bottom + 46, 50, 20)];
    labelSexTitle.text = @"性别";
    labelSexTitle.font = [UIFont systemFontOfSize:15.0f];
    labelSexTitle.textColor = [UIColor whiteColor];
    [self.scrollView addSubview:labelSexTitle];
    
    self.buttonMan = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonMan.frame = CGRectMake(labelSexTitle.right + 15, imgDj.bottom + 46, 50, 20);
    self.buttonMan.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [self.buttonMan setImage:[UIImage imageNamed:@"icon_btnUnSelect"] forState:UIControlStateNormal];
    [self.buttonMan setImage:[UIImage imageNamed:@"icon_btnSelect"] forState:UIControlStateSelected];
    [self.buttonMan addTarget:self action:@selector(btnManAct) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonMan setTitle:@"男" forState:UIControlStateNormal];
    [self.scrollView addSubview:self.buttonMan];
    
    self.buttonWoman = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonWoman.frame = CGRectMake(self.buttonMan.right + 15, imgDj.bottom + 46, 50, 20);
    self.buttonWoman.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [self.buttonWoman setImage:[UIImage imageNamed:@"icon_btnUnSelect"] forState:UIControlStateNormal];
    [self.buttonWoman setImage:[UIImage imageNamed:@"icon_btnSelect"] forState:UIControlStateSelected];
    [self.buttonWoman setTitle:@"女" forState:UIControlStateNormal];
    [self.buttonWoman addTarget:self action:@selector(btnWomanAct) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:self.buttonWoman];

    
    
    // 手机号view
    UIView *viewPhone = [[UIView alloc]initWithFrame:CGRectMake(63, self.buttonWoman.bottom + 14, SCREEN_WIDTH - 63 - 63, 32)];
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
    
    
    [viewPhone addSubview:self.textFieldPhone];
    [viewPassword addSubview:self.textFieldPassword];
    [self.viewAgnPassword addSubview:self.textFieldAgnPassword];
    [self.viewYzm addSubview:self.textFieldYzm];
    [self.scrollView addSubview:self.buttonYzm];
    
    
    UIButton *agreeBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    agreeBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    agreeBtn.frame = CGRectMake(SCREEN_WIDTH/2 - 65, self.viewYzm.bottom + 12, 130, 30);
//        agreeBtn.backgroundColor =[UIColor redColor];
    [agreeBtn setTitle:@"我同意《动境网》协议" forState:UIControlStateNormal];
    [agreeBtn addTarget:self action:@selector(agreeTextBtn) forControlEvents:UIControlEventTouchUpInside];
    [agreeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.scrollView addSubview:agreeBtn];
    
    UIButton *btnState = [UIButton buttonWithType:UIButtonTypeCustom];
    btnState.frame = CGRectMake(agreeBtn.left - 30, self.viewYzm.bottom + 12, 30, 30);
    //    BtnState.backgroundColor = [UIColor yellowColor];
    [btnState addTarget:self action:@selector(agreeAct:) forControlEvents:UIControlEventTouchUpInside];
    UIImage * imageState = [UIImage imageNamed:@"icon_on_unSelected"];//未选中
    imageState = [imageState imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage * imageState2 = [UIImage imageNamed:@"icon_on_selected"];//选中
    imageState2 = [imageState2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [btnState setImage:imageState forState:UIControlStateNormal];
    [btnState setImage:imageState2 forState:UIControlStateSelected];
    [self.scrollView addSubview:btnState];


    // 登录按钮
    UIButton *buttonLogin = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonLogin.frame = CGRectMake(63,self.viewYzm.bottom + 55, SCREEN_WIDTH - 63 - 63, 33);
    buttonLogin.backgroundColor = [UIColor colorWithRed:35.0/255.0 green:169.0/255.0 blue:142.0/255.0 alpha:1];
    [buttonLogin setTitle:@"注册" forState:UIControlStateNormal];
    [buttonLogin addTarget:self action:@selector(registerAct) forControlEvents:UIControlEventTouchUpInside];
    [buttonLogin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonLogin.layer setCornerRadius:5.0f];
    [self.scrollView addSubview:buttonLogin];

    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, buttonLogin.bottom + 30);



}

#pragma mark - 私有方法
//同意协议点击事件
- (void)agreeAct:(UIButton *)sender{
    
    static NSString *stateA = @"0";
    if ([stateA isEqualToString:@"0"]){
        //            self.imagState.image = [UIImage imageNamed:@"F3"];
        stateA = @"1";
        sender.selected = YES;
    }else if([stateA isEqualToString:@"1"]){
        
        //            self.imagState.image = [UIImage imageNamed:@"F1"];
        stateA = @"0";
        sender.selected = NO;
        
    }
    NSLog(@"%@",stateA);
    self.strState = stateA;
//    LOG(@"----%@",self.strState);
    
}
#pragma mark － 私有方法
//跳转协议接口
- (void)agreeTextBtn {
    
    ProtocolViewController *vc = [[ProtocolViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)btnManAct {
    self.buttonMan.selected = YES;
    self.buttonWoman.selected = NO;
    self.strBtnState = @"1";
}

- (void)btnWomanAct {
    self.buttonMan.selected = NO;
    self.buttonWoman.selected = YES;
    self.strBtnState = @"2";
}

#pragma mark - 私有方法

- (void)registerAct {
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
    }else if (self.strBtnState == nil || [self.strBtnState isEqualToString:@"0"]){
        [self showHint:@"请输入性别，填写确认后不可修改"];
    }else if ([self.strState isEqualToString:@"1"]){
        [self.navigationController popViewControllerAnimated:YES];
        [self showHint:@"注册成功"];
    }else {
        [self showHint:@"请先同意协议"];
    }
}

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

- (UITextField *)textFieldPhone {
    if (!_textFieldPhone) {
        _textFieldPhone = [[UITextField alloc]initWithFrame:CGRectMake(self.imgPhone.right + 10, 2, self.viewAgnPassword.width - 40, 32)];
        _textFieldPhone.placeholder = @"请输入有效号码";
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
        [_textFieldAgnPassword setValue:[UIColor colorWithRed:83.0/255 green:89.0/255.0 blue:104.0/255.0 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
        [_textFieldAgnPassword setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
        
    }
    return _textFieldAgnPassword;
}

- (UITextField *)textFieldYzm {
    if (!_textFieldYzm) {
        _textFieldYzm = [[UITextField alloc]initWithFrame:CGRectMake(self.imgYzm.right + 10, 2, self.viewYzm.width - 40, 32)];
        _textFieldYzm.placeholder = @"验证码";
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
        [_buttonYzm setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_buttonYzm addTarget:self action:@selector(buttonYzmAct) forControlEvents:UIControlEventTouchUpInside];
        [_buttonYzm.layer setCornerRadius:2];
    }
    return _buttonYzm;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
        _scrollView.bounces = NO;
    }
    return _scrollView;
}







@end
