//
//  BaseViewController.h
//  DsProject
//
//  Created by 黄哲俊 on 15/12/8.
//  Copyright © 2015年 own. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+HUD.h"
#import "UIView+Layout.h"


// 获取屏幕宽度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

// 获取屏幕高度
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

/* ------------------------------    颜色    ------------------------------ */

// 白色
#define WHITECOLOR [UIColor whiteColor]

// 透明色
#define CLEARCOLOR [UIColor clearColor]

// RGBA颜色
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]



@interface BaseViewController : UIViewController

- (void)keyboardShouldReturn;// 收起键盘

@end
