//
//  BaseViewController.m
//  DsProject
//
//  Created by 黄哲俊 on 15/12/8.
//  Copyright © 2015年 own. All rights reserved.
//

#import "BaseViewController.h"


@interface BaseViewController ()

@end

@implementation BaseViewController

// 视图将要消失
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self keyboardShouldReturn]; // 键盘收起
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupBaseViewController]; // 统一设置
    
    // 特效导航栏特效
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
}

#pragma mark - 页面布局

/**
 *  统一设置
 */
- (void)setupBaseViewController {
    // 添加空视图
    [self.view addSubview:[[UIView alloc] init]];
    
    // 设置背景颜色
    self.view.backgroundColor = [UIColor colorWithRed:33.0/255.0 green:35.0/255.0 blue:47.0/255.0 alpha:1];
    
    // 导航栏背景色
//    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:33.0/255.0 green:35.0/255.0 blue:47.0/255.0 alpha:1];
    


    // 导航栏字体颜色
//    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];

    // 导航栏左右文字颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    //设置导航栏大小 及字体颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
}


#pragma mark - 共有方法

// 键盘收起
- (void)keyboardShouldReturn {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
