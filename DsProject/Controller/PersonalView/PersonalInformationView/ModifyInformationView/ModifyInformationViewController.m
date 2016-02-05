//
//  ModifyInformationViewController.m
//  DsProject
//
//  Created by Cucumber on 16/2/4.
//  Copyright © 2016年 Cucumber. All rights reserved.
//

#import "ModifyInformationViewController.h"

@interface ModifyInformationViewController ()

@property (nonatomic, strong) UITextField *textfieldModify;

@end

@implementation ModifyInformationViewController


#pragma mark - 生命周期
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 导航栏左侧按钮
    UIButton *buttonRight = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonRight setFrame:CGRectMake(0, 0, 40, 40)];
    [buttonRight setTitle:@"保存" forState:UIControlStateNormal];
    [buttonRight addTarget:self action:@selector(saveAct) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:buttonRight];
    
    self.navigationItem.title = @"更改";
    [self layoutModifyInformationView];
}

- (void)layoutModifyInformationView {
    
    UIView *viewBottom = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
    viewBottom.backgroundColor = [UIColor colorWithRed:244.0/255.0 green:245.0/255.0 blue:249.0/255 alpha:1];
    [self.view addSubview:viewBottom];
    
    [viewBottom addSubview:self.textfieldModify];
    
    UIView *viewLayer = [[UIView alloc]initWithFrame:CGRectMake(13, self.textfieldModify.bottom, SCREEN_WIDTH - 26, 1)];
    viewLayer.backgroundColor = [UIColor colorWithRed:167.0/255.0 green:207.0/255.0 blue:198.0/255.0 alpha:1];
    [viewBottom addSubview:viewLayer];
}

#pragma mark - 私有方法
- (void)saveAct {
    [self keyboardShouldReturn];
    if ([self.textfieldModify.text isEqualToString:@""]||self.textfieldModify.text == nil) {
        [self showHint:@"未作修改不可保存"];
        return;
    }else {
        [self showHint:@"保存成功"];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

// 键盘收回
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self keyboardShouldReturn];
}
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.textfieldModify) {
        [theTextField resignFirstResponder];
    }
    return YES;
}

#pragma mark －懒加载
- (UITextField *)textfieldModify {
    if (!_textfieldModify) {
        _textfieldModify = [[UITextField alloc]initWithFrame:CGRectMake(20, 29, SCREEN_WIDTH - 40, 20)];
        _textfieldModify.placeholder = @"&开心快乐&";
    }
    return _textfieldModify;
}

@end
