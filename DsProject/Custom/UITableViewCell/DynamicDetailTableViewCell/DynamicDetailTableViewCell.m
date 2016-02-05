//
//  DynamicDetailTableViewCell.m
//  DsProject
//
//  Created by Cucumber on 16/1/29.
//  Copyright © 2016年 Cucumber. All rights reserved.
//

#import "DynamicDetailTableViewCell.h"

@implementation DynamicDetailTableViewCell
#pragma mark - 生命周期
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self layoutDynamicDetailTableViewCell];
    }
    return self;
}

- (void)layoutDynamicDetailTableViewCell {
    [self addSubview:self.viewBottom];
    [self.viewBottom addSubview:self.imgHead];
    [self.viewBottom addSubview:self.labelName];
    [self.viewBottom addSubview:self.labelTime];
    [self.viewBottom addSubview:self.labelComment];
}

#pragma mark - 生命周期 
- (UIView *)viewBottom {
    if (!_viewBottom) {
        _viewBottom = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 90)];
        _viewBottom.backgroundColor = [UIColor whiteColor];
    }
    return _viewBottom;
}

- (UIImageView *)imgHead {
    if (!_imgHead) {
        _imgHead = [[UIImageView alloc]initWithFrame:CGRectMake(17, 8, 28, 28)];
        _imgHead.backgroundColor = [UIColor yellowColor];
        [_imgHead.layer setCornerRadius:14];
    }
    return _imgHead;
}

- (UILabel *)labelName {
    if (!_labelName) {
        _labelName = [[UILabel alloc]initWithFrame:CGRectMake(self.imgHead.frame.origin.x + self.imgHead.frame.size.width + 11, 12, 100, 20)];
        _labelName.text  = @"猪宝贝*快乐";
        _labelName.textColor = [UIColor colorWithRed:27.0/255.0 green:169.0/255.0 blue:143.0/255.0 alpha:1];
    }
    return _labelName;
}

- (UILabel *)labelTime {
    if (!_labelTime) {
        _labelTime = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 130, 12, 113, 20)];
        _labelTime.text = @"2015-12-01 14:50";
        _labelTime.textColor = [UIColor lightGrayColor];
        _labelTime.font = [UIFont systemFontOfSize:13.0f];
    }
    return _labelTime;
}

- (UILabel *)labelComment {
    if (!_labelComment) {
        _labelComment = [[UILabel alloc]initWithFrame:CGRectMake(50, self.labelName.frame.size.height + self.labelName.frame.origin.y + 15, SCREEN_WIDTH - 50 - 13, 30)];
        _labelComment.backgroundColor = [UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1];
        _labelComment.text = @"我也好想参加啊！";
        _labelComment.font = [UIFont systemFontOfSize:14.0f];
    }
    return _labelComment;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
