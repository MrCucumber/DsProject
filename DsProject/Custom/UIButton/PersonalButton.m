//
//  PersonalButton.m
//  DsProject
//
//  Created by Cucumber on 16/1/22.
//  Copyright © 2016年 Cucumber. All rights reserved.
//

#import "PersonalButton.h"
@interface PersonalButton () {
    CGRect       _frame;
    NSString    *_title;
    NSString    *_imageName;
    NSString    *_message;
}

/**
 *  接收传递过来的block
 **/
@property (nonatomic, strong) LoginButtonDidClick didClicked;

/**
 *  底层button按钮
 **/
@property (nonatomic, strong) UIButton *button;

/**
 *  按钮上的登录图片视图
 **/
@property (nonatomic, strong) UIImageView *imageViewIcon;

/**
 *  按钮上的显示文字标签
 **/
@property (nonatomic, strong) UILabel *labelTitle;


@property (nonatomic, strong) UILabel *labelMessage;

@end
@implementation PersonalButton

// 底层button按钮
- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(0, 0, _frame.size.width, _frame.size.height);
        _button.backgroundColor = [UIColor colorWithRed:56.0/255.0 green:63.0/255.0 blue:78.0/255.0 alpha:1];
        [_button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _button;
}

// 按钮上的登录图片视图
- (UIImageView *)imageViewIcon {
    if (!_imageViewIcon) {
        _imageViewIcon = [[UIImageView alloc] initWithFrame:CGRectMake(self.button.frame.size.width/2 - 20, 11, 17, 17)];
        _imageViewIcon.image = [UIImage imageNamed:_imageName];
//        _imageViewIcon.backgroundColor = [UIColor redColor];
    }
    
    return _imageViewIcon;
}

// 按钮上的显示文字标签
- (UILabel *)labelTitle {
    if (!_labelTitle) {
        _labelTitle = [[UILabel alloc] initWithFrame:CGRectMake( self.button.frame.size.width/2 - 25, self.imageViewIcon.frame.size.height + self.imageViewIcon.frame.origin.y, 50  , 20)];
        _labelTitle.text = _title;
        _labelTitle.textColor = [UIColor whiteColor];
        _labelTitle.textAlignment = NSTextAlignmentCenter;
        _labelTitle.font = [UIFont boldSystemFontOfSize:16.0f];
    }
    
    return _labelTitle;
}

- (UILabel *)labelMessage {
    if (!_labelMessage) {
        _labelMessage = [[UILabel alloc]initWithFrame:CGRectMake(self.imageViewIcon.frame.size.width + self.imageViewIcon.frame.origin.x + 2, 9, 45, 20)];
        _labelMessage.textColor = [UIColor whiteColor];
        _labelMessage.font = [UIFont systemFontOfSize:13.0f];
        _labelMessage.textAlignment = NSTextAlignmentLeft;
        _labelMessage.text = _message;
//        _labelMessage.backgroundColor = [UIColor orangeColor];
    }
    return _labelMessage;
}

#pragma mark - private method

// 视图布局
- (void)layout {
    [self addSubview:self.button];
    [self.button addSubview:self.imageViewIcon];
    [self.button addSubview:self.labelMessage];
    [self.button addSubview:self.labelTitle];
}

// 底层按钮的点击事件
- (void)click {
    if (self.didClicked) {
        self.didClicked(self);
    }
}

// 登录按钮的回调事件
- (void)loginButtonDidClicked:(LoginButtonDidClick)block {
    self.didClicked = block;
}

#pragma mark - public method

// 初始化方法
- (id)initWithFrame:(CGRect)frame title:(NSString *)title imageName:(NSString *)imageName message:(NSString *)message {
    self = [super initWithFrame:frame];
    
    if (self) {
        _frame      = frame;
        _title      = title;
        _imageName  = imageName;
        _message = message;
        
        [self layout]; // 页面布局
        
//        self.layer.borderColor = [UIColor whiteColor].CGColor; // 边框颜色
//        self.layer.borderWidth = 0.5f; // 边框粗细
    }
    
    return self;
}

@end
