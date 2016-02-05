//
//  ActivityListTableViewCell.h
//  DsProject
//
//  Created by Cucumber on 16/1/22.
//  Copyright © 2016年 Cucumber. All rights reserved.
//

#import <UIKit/UIKit.h>

// 获取屏幕宽度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

// 获取屏幕高度
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface ActivityListTableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *imgHead;
@property (nonatomic, strong) UILabel *labelTitle;
@property (nonatomic, strong) UILabel *labelName;
@property (nonatomic, strong) UILabel *labelMessage;

@property (nonatomic, strong) UILabel *labelExpire;         // 过期


@end
