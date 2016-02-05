//
//  AppDelegate+TabBar.m
//  SMProject
//
//  Created by Little An on 15/10/14.
//  Copyright © 2015年 Little An. All rights reserved.
//

#import "AppDelegate+TabBar.h"

#import "PersonalViewController.h"
#import "ActivityViewController.h"
#import "DynamicViewController.h"

@implementation AppDelegate (TabBar)

// 设置自定义的tabbar
- (UITabBarController *)setupCustomTabBarController {
    // 活动选项卡
    ActivityViewController *activityVC = [[ActivityViewController alloc] init];
    UINavigationController  *navigationActivityVC = [[UINavigationController alloc] initWithRootViewController:activityVC];
    navigationActivityVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"活动"
                                                                 image:[[UIImage imageNamed:@"icon_tab_activity"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                         selectedImage:[[UIImage imageNamed:@"icon_tab_select_activity"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    // 动态选项卡
    DynamicViewController *dynamicVC = [[DynamicViewController alloc] init];
    UINavigationController *navigationDynamicVC = [[UINavigationController alloc] initWithRootViewController:dynamicVC];
    navigationDynamicVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"动态"
                                                                  image:[[UIImage imageNamed:@"icon_tab_dynamic"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                          selectedImage:[[UIImage imageNamed:@"icon_tab_select_dynamic"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    // 个人
    PersonalViewController *personalVC = [[PersonalViewController alloc] init];
    UINavigationController *navigationPersonVC = [[UINavigationController alloc] initWithRootViewController:personalVC];
    navigationPersonVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的"
                                                                    image:[[UIImage imageNamed:@"icon_tab_personal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                            selectedImage:[[UIImage imageNamed:@"icon_tab_select_personal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    
    // 设置导航栏控制器
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [tabBarController setViewControllers:[NSArray arrayWithObjects:navigationActivityVC, navigationDynamicVC, navigationPersonVC, nil]];
    
    // 设置控制器背景颜色
      [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:57.0/225.0 green:63.0/255.0 blue:80.0/255.0 alpha:1]];



    
    // 设置文字颜色
    NSDictionary *dicNormal = @{NSForegroundColorAttributeName: [UIColor lightGrayColor]};
    NSDictionary *dicSelect = @{NSForegroundColorAttributeName: COLOR(93, 190, 232, 1)};
    
    [[UITabBarItem appearance] setTitleTextAttributes:dicNormal forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:dicSelect forState:UIControlStateSelected];
    
    /*
     下面两行代码隐藏tabbar上的黑线
     查看shadowImage的说明，解释来一定要先设置backgroundImage
     Default is nil. When non-nil, a custom shadow image to show instead of the default shadow image. For a custom shadow to be shown, a custom background image must also be set with -setBackgroundImage: (if the default background image is used, the default shadow image will be used).
     */
    [tabBarController.tabBar setBackgroundImage:[UIImage imageNamed:@"icon_tabbar_imageViewDefault"]]; // 先设置背景颜色
    
//    [tabBarController.tabBar setShadowImage:[[UIImage alloc] init]]; // 设置边缘阴影
    
    return tabBarController;
}

@end
