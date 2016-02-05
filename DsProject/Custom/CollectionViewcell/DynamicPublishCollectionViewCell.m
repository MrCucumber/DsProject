//
//  DynamicPublishCollectionViewCell.m
//  DsProject
//
//  Created by Cucumber on 16/2/3.
//  Copyright © 2016年 Cucumber. All rights reserved.
//

#import "DynamicPublishCollectionViewCell.h"

@implementation DynamicPublishCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self layoutDynamicPublishCollectionViewCell];
    }
    return self;
}

- (void)layoutDynamicPublishCollectionViewCell {
    self.imgCellView= [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, (SCREEN_WIDTH - 75)/4, (SCREEN_WIDTH - 75)/4)];
    self.imgCellView.image = [UIImage imageNamed:@"btn_addDynamic"];
    self.imgCellView.backgroundColor  = [UIColor redColor];
    [self addSubview:self.imgCellView];
}
@end
