//
//  ActivityTableViewCell.h
//  DsProject
//
//  Created by Cucumber on 16/1/22.
//  Copyright © 2016年 Cucumber. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Layout.h"

// 获取屏幕宽度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

// 获取屏幕高度
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


@interface ActivityTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *labelHotNum;
@property (nonatomic, strong) UIImageView *imgBottom;

@end
