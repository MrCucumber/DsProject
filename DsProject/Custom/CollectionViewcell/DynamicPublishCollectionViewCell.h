//
//  DynamicPublishCollectionViewCell.h
//  DsProject
//
//  Created by Cucumber on 16/2/3.
//  Copyright © 2016年 Cucumber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DynamicPublishCollectionViewCell : UICollectionViewCell

// 获取屏幕宽度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

// 获取屏幕高度
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


@property (nonatomic, strong) UIImageView *imgCellView;
@end
