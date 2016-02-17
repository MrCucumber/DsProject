//
//  LoginViewController.m
//  DsProject
//
//  Created by 黄哲俊 on 15/12/8.
//  Copyright © 2015年 own. All rights reserved.
//

#import "LoginViewController.h"
#import "ForgetPasswordViewController.h"

#define NUMBERS @"0123456789"
@interface LoginViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textFieldPhone; // 手机账户textfield
@property (nonatomic, strong) UITextField *textFieldPassword; // 密码textfield
//@property (nonatomic, strong) UITextField *textFieldYzm; // 验证码textfield
//@property (nonatomic, strong) UILabel *labelYzm; // 验证码label
@property (nonatomic, strong) NSString *strState;

@property (nonatomic, strong) UIView *viewPassword;

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation LoginViewController

#pragma mark - 生命周期

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"登录";
    [self creatLoginView]; // creatLoginView

}

// 够贱一个登录页面
- (void)creatLoginView {
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
    self.scrollView.bounces = NO;
    [self.view addSubview:self.scrollView];
    
    //logoImage
    UIImageView *imgDj = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_log"]];
    imgDj.frame = CGRectMake(SCREEN_WIDTH/2 - imgDj.frame.size.width/2, 52, 100, 150);
    imgDj.contentMode = UIViewContentModeScaleToFill;
    [self.scrollView addSubview:imgDj];
    
    
    // 手机号view
    UIView *viewPhone = [[UIView alloc]initWithFrame:CGRectMake(63, 150+65 +52, SCREEN_WIDTH - 63 - 63, 32)];
    viewPhone.backgroundColor = [UIColor colorWithRed:57.0/255.0 green:63.0/255.0 blue:78.0/255 alpha:1];
    [viewPhone.layer setCornerRadius:2];
    [self.scrollView addSubview:viewPhone];
    
    
    // 输入密码view
    self.viewPassword = [[UIView alloc]initWithFrame:CGRectMake(63, 150 + 52 + 65 + 50, SCREEN_WIDTH - 63 - 63, 32)];
    self.viewPassword.backgroundColor = [UIColor colorWithRed:57.0/255.0 green:63.0/255.0 blue:78.0/255 alpha:1];
    [self.viewPassword.layer setCornerRadius:2];
    [self.scrollView addSubview:self.viewPassword];
    
//    // 验证码view
//    UIView *viewYzm = [[UIView alloc]initWithFrame:CGRectMake(63, 150 + 52 + 65 + 50 + 50, (SCREEN_WIDTH - 63 -63)/4*3 - 10, 32)];
//    viewYzm.backgroundColor = [UIColor colorWithRed:57.0/255.0 green:63.0/255.0 blue:78.0/255.0 alpha:1];
//    [viewYzm.layer setCornerRadius:2];
//    [self.scrollView addSubview:viewYzm];
//    
//    // 验证码label
//    self.labelYzm = [[UILabel alloc]initWithFrame:CGRectMake(63 + (SCREEN_WIDTH - 63 -63)/4*3 , 150 + 52 + 65 +50 + 50 , (SCREEN_WIDTH - 63 -63)/4, 32)];
//    self.labelYzm.text = @"R45G";
//    self.labelYzm.textAlignment = NSTextAlignmentCenter;
//    self.labelYzm.textColor = [UIColor lightGrayColor];
//    self.labelYzm.backgroundColor = [UIColor colorWithRed:57.0/255.0 green:63.0/255.0 blue:78.0/255 alpha:1];
//    [self.labelYzm.layer setCornerRadius:2];
//    [self.scrollView addSubview:self.labelYzm];
    
    //image 手机号
    UIImageView *imgPhone = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_iPhone"]];
    imgPhone.frame = CGRectMake(10, 8, 17, 17);
    //    imgPhone.contentMode = UIViewContentModeScaleToFill;
    [viewPhone addSubview:imgPhone];
    
    //image 验证码
    UIImageView *imgPassword = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_password"]];
    imgPassword.frame = CGRectMake(10, 8, 17, 17);
    //    imgPhone.contentMode = UIViewContentModeScaleToFill;
    [self.viewPassword addSubview:imgPassword];
    
    
//    //image 验证码
//    UIImageView *imgYzm = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_Code"]];
//    imgYzm.frame = CGRectMake(10, 8, 17, 17);
//    //    imgPhone.contentMode = UIViewContentModeScaleToFill;
//    [viewYzm addSubview:imgYzm];
    
    self.textFieldPhone = [[UITextField alloc]initWithFrame:CGRectMake(30, 2, SCREEN_WIDTH - 63 - 63 - 30, 32)];
    self.textFieldPhone.placeholder = @"手机号";
    self.textFieldPhone.delegate = self;
    [self.textFieldPhone setValue:[UIColor colorWithRed:83.0/255 green:89.0/255.0 blue:104.0/255.0 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
    [self.textFieldPhone setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    [viewPhone addSubview:self.textFieldPhone];
    
    
    self.textFieldPassword = [[UITextField alloc]initWithFrame:CGRectMake(30, 2, SCREEN_WIDTH - 63 - 63 - 30, 32)];
    self.textFieldPassword.placeholder = @"密 码";
    self.textFieldPassword.delegate = self;
    self.textFieldPassword.secureTextEntry = YES;
    [self.textFieldPassword setValue:[UIColor colorWithRed:83.0/255 green:89.0/255.0 blue:104.0/255.0 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
    [self.textFieldPassword setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    [self.viewPassword addSubview:self.textFieldPassword];
    
//    self.textFieldYzm = [[UITextField alloc]initWithFrame:CGRectMake(30, 2, (SCREEN_WIDTH - 63 -63)/4*3 - 40, 32)];
//    self.textFieldYzm.placeholder = @"验证码";
//    [self.textFieldYzm setValue:[UIColor colorWithRed:83.0/255 green:89.0/255.0 blue:104.0/255.0 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
//    [self.textFieldYzm setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
//    [viewYzm addSubview:self.textFieldYzm];
    
//    //13 记住密码按钮
//    UIButton *buttonRemeber = [UIButton buttonWithType:UIButtonTypeCustom];
//    buttonRemeber.frame = CGRectMake(74, viewYzm.bottom + 12, 30, 30);
//    [buttonRemeber addTarget:self action:@selector(agreeAct:) forControlEvents:UIControlEventTouchUpInside];
//    UIImage * imageState = [UIImage imageNamed:@"icon_on_unSelected"];//未选中
//    imageState = [imageState imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    UIImage * imageState2 = [UIImage imageNamed:@"icon_on_selected"];//选中
//    imageState2 = [imageState2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [buttonRemeber setImage:imageState forState:UIControlStateNormal];
//    [buttonRemeber setImage:imageState2 forState:UIControlStateSelected];
//    [self.scrollView addSubview:buttonRemeber];
    
//    // 记住手机号label
//    UILabel *labelRemember =[[UILabel alloc]initWithFrame:CGRectMake(74 + 30, viewYzm.bottom +12,70, 30)];
//    labelRemember.text = @"记住手机号";
//    labelRemember.textColor = [UIColor colorWithRed:156.0/255.0 green:164.0/255.0 blue:181.0/255 alpha:1];
//    labelRemember.font = [UIFont systemFontOfSize:13.0f];
//    [self.scrollView addSubview:labelRemember];
    

    
    // 登录按钮
    UIButton *buttonLogin = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonLogin.frame = CGRectMake(63, self.viewPassword.bottom + 22, SCREEN_WIDTH - 63 - 63, 33);
    buttonLogin.backgroundColor = [UIColor colorWithRed:35.0/255.0 green:169.0/255.0 blue:142.0/255.0 alpha:1];
    [buttonLogin setTitle:@"登录" forState:UIControlStateNormal];
    [buttonLogin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonLogin addTarget:self action:@selector(pushLoginFinish) forControlEvents:UIControlEventTouchUpInside];
    [buttonLogin.layer setCornerRadius:5.0f];
    [self.scrollView addSubview:buttonLogin];
    
    // 忘记密码按钮
    UIButton *buttonForget = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonForget.frame =CGRectMake(SCREEN_WIDTH/2 - 40, buttonLogin.bottom + 12,80, 30);
    [buttonForget setTitle:@"忘记密码？" forState:UIControlStateNormal];
    [buttonForget addTarget:self action:@selector(pushForgetViewAct) forControlEvents:UIControlEventTouchUpInside];
    [buttonForget setTitleColor:[UIColor colorWithRed:156.0/255.0 green:164.0/255.0 blue:181.0/255 alpha:1] forState:UIControlStateNormal];
    
    buttonForget.titleLabel.font = [UIFont systemFontOfSize:13.0];
    [self.scrollView addSubview:buttonForget];
    
    
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, buttonForget.bottom + 30);
    
    
    UITapGestureRecognizer *taper = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapsion)];
    taper.numberOfTouchesRequired=1;
    [self.scrollView addGestureRecognizer:taper];

    
    
}

#pragma mark － 似有方法
// 注册页面跳转
- (void)pushForgetViewAct {
    ForgetPasswordViewController *vc = [[ForgetPasswordViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
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
// 登陆页面跳转
- (void)pushLoginFinish {
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
    }else {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"kNotificationLoginStateChanged" object:@YES];
        [self showHint:@"登陆成功"];

    }
}
/**
 *  登录事件
 *  点击登录后，先检测账户输入是否正确。
 *  如果账户不正确，提示。否则继续检查密码
 *
 */
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
    }
    return YES;
}

@end
