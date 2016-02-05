//
//  PushSetUpTableViewCell.h
//  DsProject
//
//  Created by Cucumber on 16/2/5.
//  Copyright © 2016年 Cucumber. All rights reserved.
//

#import <UIKit/UIKit.h>

// 获取屏幕宽度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

// 获取屏幕高度
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface PushSetUpTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *labelText;
@property (nonatomic, strong) UISwitch *switchButton;

@end
