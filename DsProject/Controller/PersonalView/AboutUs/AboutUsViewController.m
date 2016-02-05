//
//  AboutUsViewController.m
//  DsProject
//
//  Created by Cucumber on 16/1/31.
//  Copyright © 2016年 Cucumber. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()
@property (nonatomic, strong) UILabel *labelVersion;
@property (nonatomic, strong) UIImageView *imgLogo;
@property (nonatomic, strong) UIView *viewMiddle;
@property (nonatomic, strong) UILabel *labelEmailTitle;
@property (nonatomic, strong) UILabel *labelPhoneTitle;

@property (nonatomic, strong) UILabel *labelEmail;
@property (nonatomic, strong) UILabel *labelPhone;





@end

@implementation AboutUsViewController

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"个人";
    [self layoutAboutUsView];
}

- (void)layoutAboutUsView {

    [self.view addSubview:self.imgLogo];
    
    [self.view addSubview:self.labelVersion];
    
    [self.view addSubview:self.viewMiddle];
    [self.viewMiddle addSubview:self.labelEmailTitle];
    [self.viewMiddle addSubview:self.labelPhoneTitle];
    [self.viewMiddle addSubview:self.labelEmail];
    [self.viewMiddle addSubview:self.labelPhone];
    
    UIView *viewLayer = [[UIView alloc]initWithFrame:CGRectMake(0, self.labelEmailTitle.bottom + 13, self.viewMiddle.width, 1)];
    viewLayer.backgroundColor = [UIColor colorWithRed:74.0/255.0 green:78.0/255.0 blue:91.0/255.0 alpha:1];
    [self.viewMiddle addSubview:viewLayer];
}
#pragma mark - 懒加载
- (UIImageView *)imgLogo
{
    if (!_imgLogo) {
        _imgLogo = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH/2 - 52), 121 , 105, 150)];
        _imgLogo.image = [UIImage imageNamed:@"icon_log"];
    }
    return _imgLogo;
}
- (UILabel *)labelVersion {
    if (!_labelVersion) {
        _labelVersion = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH/2 - 50), self.imgLogo.bottom+ 10, 100, 20)];
        _labelVersion.text = @"Dongjing  V1.1";
        _labelVersion.textColor = [UIColor whiteColor];
        _labelVersion.textAlignment = NSTextAlignmentCenter;
        _labelVersion.font = [UIFont systemFontOfSize:15.0f];
    }
    return _labelVersion;
}

- (UIView *)viewMiddle {
    if (!_viewMiddle) {
        _viewMiddle = [[UIView alloc]initWithFrame:CGRectMake(38, self.labelVersion.bottom +67, SCREEN_WIDTH - 76, 90)];
        _viewMiddle.layer.borderWidth = 1;
        _viewMiddle.layer.borderColor = [UIColor colorWithRed:74.0/255.0 green:78.0/255.0 blue:91.0/255.0 alpha:1].CGColor;
    }
    return _viewMiddle;
}

- (UILabel *)labelEmailTitle {
    if (!_labelEmailTitle) {
        _labelEmailTitle = [[UILabel alloc]initWithFrame:CGRectMake(12, 13, 50, 18)];
        _labelEmailTitle.text = @"邮箱";
        _labelEmailTitle.textColor = [UIColor colorWithRed:74.0/255.0 green:78.0/255.0 blue:91.0/255.0 alpha:1];
    }
    return _labelEmailTitle;
}

- (UILabel *)labelEmail {
    if (!_labelEmail) {
        _labelEmail = [[UILabel alloc]initWithFrame:CGRectMake(self.viewMiddle.width - 160, 13, 155, 18)];
        _labelEmail.text = @"dj@dongjing.com";
        _labelEmail.textAlignment = NSTextAlignmentRight;
        _labelEmail.textColor = [UIColor colorWithRed:74.0/255.0 green:78.0/255.0 blue:91.0/255.0 alpha:1];
    }
    return _labelEmail;
}

- (UILabel *)labelPhoneTitle {
    if (!_labelPhoneTitle) {
        _labelPhoneTitle = [[UILabel alloc]initWithFrame:CGRectMake(12, self.labelEmailTitle.bottom + 27, 50, 18)];
        _labelPhoneTitle.text = @"电话";
        _labelPhoneTitle.textColor = [UIColor colorWithRed:74.0/255.0 green:78.0/255.0 blue:91.0/255.0 alpha:1];
    }
    return _labelPhoneTitle;
}

- (UILabel *)labelPhone {
    if (!_labelPhone) {
        _labelPhone = [[UILabel alloc]initWithFrame:CGRectMake(self.viewMiddle.width - 160, self.labelEmail.bottom + 27, 155, 18)];
        _labelPhone.text = @"021-12345678";
        _labelPhone.textAlignment = NSTextAlignmentRight;
        _labelPhone.textColor = [UIColor colorWithRed:74.0/255.0 green:78.0/255.0 blue:91.0/255.0 alpha:1];
    }
    return _labelPhone;
}

@end
