//
//  DynamicTableViewCell.h
//  DsProject
//
//  Created by Cucumber on 16/1/27.
//  Copyright © 2016年 Cucumber. All rights reserved.
//

#import <UIKit/UIKit.h>

// 获取屏幕宽度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

// 获取屏幕高度
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


@interface DynamicTableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *imgHead;
@property (nonatomic, strong) UILabel *labelNick;
@property (nonatomic, strong) UILabel *labelTime;
@property (nonatomic, strong) UILabel *labelMessage;
@property (nonatomic, strong) UIImageView *imgPicture;
@property (nonatomic, strong) UIImageView *imgPicture1;
@property (nonatomic, strong) UIImageView *imgPicture2;

@end
