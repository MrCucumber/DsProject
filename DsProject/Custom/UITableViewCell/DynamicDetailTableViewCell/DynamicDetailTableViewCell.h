//
//  DynamicDetailTableViewCell.h
//  DsProject
//
//  Created by Cucumber on 16/1/29.
//  Copyright © 2016年 Cucumber. All rights reserved.
//

#import <UIKit/UIKit.h>

// 获取屏幕宽度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

// 获取屏幕高度
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface DynamicDetailTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *imgHead;
@property (nonatomic, strong) UILabel *labelName;
@property (nonatomic, strong) UILabel *labelTime;

@property (nonatomic, strong) UIView *viewBottom;
@property (nonatomic, strong) UILabel *labelComment;
@end
