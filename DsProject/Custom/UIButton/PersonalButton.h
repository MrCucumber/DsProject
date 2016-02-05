//
//  PersonalButton.h
//  DsProject
//
//  Created by Cucumber on 16/1/22.
//  Copyright © 2016年 Cucumber. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PersonalButton;

/**
 *  定义回调类型
 **/
typedef void (^LoginButtonDidClick) (PersonalButton *sender);

@interface PersonalButton : UIView


/**
 *  LoginButton的初始化方法
 **/
- (id)initWithFrame:(CGRect)frame title:(NSString *)title imageName:(NSString *)imageName message:(NSString *)message;

/**
 *  登录按钮的回调事件
 **/
- (void)loginButtonDidClicked:(LoginButtonDidClick)block;

@end
