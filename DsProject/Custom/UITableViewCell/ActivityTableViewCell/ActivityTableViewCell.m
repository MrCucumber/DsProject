//
//  ActivityTableViewCell.m
//  DsProject
//
//  Created by Cucumber on 16/1/22.
//  Copyright © 2016年 Cucumber. All rights reserved.
//

#import "ActivityTableViewCell.h"
@interface ActivityTableViewCell ()

@property (nonatomic, strong) UILabel *labelHotTitle;
@property (nonatomic, strong) UIImageView *imgHot;
@property (nonatomic, strong) UIView *viewTop;
@property (nonatomic, strong) UIView *viewBottom;

@end

@implementation ActivityTableViewCell

#pragma mark - 生命周期
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self layoutActivityTableViewCell];
    }
    return self;
}

- (void) layoutActivityTableViewCell {
    [self addSubview:self.imgBottom];
    [self.imgBottom addSubview:self.viewBottom];
    [self.viewBottom addSubview:self.viewTop];
    [self.viewTop addSubview:self.imgHot];
    [self.viewTop addSubview:self.labelHotTitle];
    [self.viewTop addSubview:self.labelHotNum];
}

#pragma mark － 懒加载

- (UIImageView *)imgBottom {
    if (!_imgBottom) {
        _imgBottom = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150)];
    }
    return _imgBottom;
}

- (UIView *)viewBottom {
    if (!_viewBottom) {
        _viewBottom = [[UIView alloc]initWithFrame:CGRectMake(0, self.imgBottom.bottom - 35, [UIScreen mainScreen].bounds.size.width, 35)];
        _viewBottom.backgroundColor = [UIColor whiteColor];
        _viewBottom.alpha = 0.7;
    }
    return _viewBottom;
}

- (UIView *)viewTop {
    if (!_viewTop) {
        _viewTop = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 35)];
        _viewTop.backgroundColor = [UIColor clearColor];
    }
    return _viewTop;
}

- (UIImageView *)imgHot {
    if (!_imgHot) {
        _imgHot = [[UIImageView alloc]initWithFrame:CGRectMake(self.viewTop.frame.size.width - 96, 7, 13, 17)];
        _imgHot.image = [UIImage imageNamed:@"icon_hotFire"];
    }
    return _imgHot;
}

- (UILabel *)labelHotTitle {
    if (!_labelHotTitle) {
        _labelHotTitle = [[UILabel alloc]initWithFrame:CGRectMake(self.imgHot.frame.size.width + self.imgHot.frame.origin.x + 2 , 5, 30, 25)];
        _labelHotTitle.text = @"热度";
        _labelHotTitle.textAlignment = NSTextAlignmentCenter;
        _labelHotTitle.font = [UIFont systemFontOfSize:14.0f];
    }
    return _labelHotTitle;
}

- (UILabel *)labelHotNum {
    if (!_labelHotNum) {
        _labelHotNum = [[UILabel alloc]initWithFrame:CGRectMake(self.labelHotTitle.frame.size.width + self.labelHotTitle.frame.origin.x , 5, 55, 25)];
        _labelHotNum.text = @"(99)";
        _labelHotNum.textColor = [UIColor grayColor];
        _labelHotNum.font = [UIFont systemFontOfSize:13.0f];
        _labelHotNum.textAlignment = NSTextAlignmentLeft;
    }
    return _labelHotNum;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
