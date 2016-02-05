//
//  DynamicTableViewCell.m
//  DsProject
//
//  Created by Cucumber on 16/1/27.
//  Copyright © 2016年 Cucumber. All rights reserved.
//

#import "DynamicTableViewCell.h"
#import "UIView+Layout.h"



@implementation DynamicTableViewCell


#pragma mark - 生命周期
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self layoutDynamicTableViewCell];
    }
    return self;
}

- (void)layoutDynamicTableViewCell {
    UIView *viewBottom = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
    viewBottom.backgroundColor = [UIColor whiteColor];
    [self addSubview:viewBottom];
    
    [viewBottom addSubview:self.imgHead];
    [viewBottom addSubview:self.labelNick];
    [viewBottom addSubview:self.labelTime];
    [viewBottom addSubview:self.labelMessage];
    [viewBottom addSubview:self.imgPicture];
    [viewBottom addSubview:self.imgPicture1];
    [viewBottom addSubview:self.imgPicture2];
    
}

#pragma mark - 懒加载
- (UIImageView *)imgHead {
    if (!_imgHead) {
        _imgHead = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 28, 28)];
        _imgHead.image = [UIImage imageNamed:@""];
        _imgHead.backgroundColor  = [UIColor redColor];
        [_imgHead.layer setCornerRadius:14];
    }
    return _imgHead;
}

- (UILabel *)labelNick {
    if (!_labelNick) {
        _labelNick = [[UILabel alloc]initWithFrame:CGRectMake(self.imgHead.right + 10, 10, 100, 20)];
        _labelNick.text = @"&开心快乐&";
        _labelNick.textColor = [UIColor colorWithRed:0.0/255.0 green:164.0/255.0 blue:135.0/255.0 alpha:1];
//        _labelNick.backgroundColor = [UIColor yellowColor];
    }
    return _labelNick;
}

- (UILabel *)labelTime {
    if (!_labelTime) {
        _labelTime = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 150, 10, 130, 20)];
        _labelTime.text = @"2015-12-22 10:56";
        _labelTime.textColor = [UIColor lightGrayColor];
//        _labelTime.backgroundColor = [UIColor greenColor];
        _labelTime.font = [UIFont systemFontOfSize:14.0f];
        _labelTime.textAlignment = NSTextAlignmentRight;
    }
    return _labelTime;
}

- (UILabel *)labelMessage {
    if (!_labelMessage) {
        _labelMessage = [[UILabel alloc]initWithFrame:CGRectMake(self.imgHead.right + 10, self.labelNick.bottom, SCREEN_WIDTH - self.labelNick.frame.origin.x- 20, 20)];
        _labelMessage.text = @"今天天气好晴朗，好呀嘛好晴朗，今天天气好晴朗，好呀嘛好晴朗";
        _labelMessage.font = [UIFont systemFontOfSize:14.0f];
    }
    return _labelMessage;
    
}

- (UIImageView *)imgPicture {
    if (!_imgPicture) {
        _imgPicture = [[UIImageView alloc]initWithFrame:CGRectMake(self.labelNick.frame.origin.x, self.labelMessage.bottom +5, 80, 80)];
        _imgPicture.backgroundColor = [UIColor purpleColor];
    }
    return _imgPicture;
}


- (UIImageView *)imgPicture1 {
    if (!_imgPicture1) {
        _imgPicture1 = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - self.labelNick.frame.origin.x - 240)/3 +80 + self.labelNick.frame.origin.x , self.labelMessage.bottom+5, 80, 80)];
        _imgPicture1.backgroundColor = [UIColor purpleColor];
    }
    return _imgPicture1;
}

- (UIImageView *)imgPicture2 {
    if (!_imgPicture2) {
        _imgPicture2 = [[UIImageView alloc]initWithFrame:CGRectMake(((SCREEN_WIDTH - self.labelNick.frame.origin.x - 240)/3 +80)*2 + self.labelNick.frame.origin.x, self.labelMessage.bottom+5, 80, 80)];
        _imgPicture2.backgroundColor = [UIColor purpleColor];
    }
    return _imgPicture2;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
