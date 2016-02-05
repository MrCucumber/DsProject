//
//  ActivityListTableViewCell.m
//  DsProject
//
//  Created by Cucumber on 16/1/22.
//  Copyright © 2016年 Cucumber. All rights reserved.
//

#import "ActivityListTableViewCell.h"
@interface ActivityListTableViewCell()
@property (nonatomic, strong) UIView *viewBottom;
@property (nonatomic, strong) UILabel *labelNameTitle;

@end

@implementation ActivityListTableViewCell

#pragma mark - 生命周期
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self layoutActivityListTableViewCell];
    }
    return self;
}

- (void)layoutActivityListTableViewCell {
    [self addSubview:self.viewBottom];
    [self.viewBottom addSubview:self.imgHead];
    [self.viewBottom addSubview:self.labelTitle];
    [self.viewBottom addSubview:self.labelNameTitle];
    [self.viewBottom addSubview:self.labelName];
    [self.viewBottom addSubview:self.labelMessage];
    [self.viewBottom addSubview:self.labelExpire];
}

#pragma mark － 懒加载

- (UIView *)viewBottom {
    if (!_viewBottom) {
        _viewBottom = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 83)];
        _viewBottom.backgroundColor = [UIColor whiteColor];
    }
    return _viewBottom;
}
- (UIImageView *)imgHead {
    if (!_imgHead) {
        _imgHead = [[UIImageView alloc]initWithFrame:CGRectMake(11, 9, 68, 68)];
        _imgHead.backgroundColor = [UIColor orangeColor];
    }
    return _imgHead;
}
- (UILabel *)labelTitle {
    if (!_labelTitle) {
        _labelTitle = [[UILabel alloc]initWithFrame:CGRectMake(self.imgHead.frame.origin.x + self.imgHead.frame.size.width + 10, 9, SCREEN_WIDTH - 11 - self.imgHead.frame.size.width - 10 - 40, 20)];
        _labelTitle.text = @"2015-12-12环城跑";
        _labelTitle.font = [UIFont systemFontOfSize:16.0f];
//        _labelTitle.backgroundColor = [UIColor lightGrayColor];
    }
    return _labelTitle;
}
- (UILabel *)labelNameTitle {
    if (!_labelNameTitle) {
        _labelNameTitle = [[UILabel alloc]initWithFrame:CGRectMake(self.imgHead.frame.origin.x + self.imgHead.frame.size.width + 10, self.labelTitle.frame.size.height + self.labelTitle.frame.origin.y, 50, 15)];
        _labelNameTitle.text = @"发起人:";
        _labelNameTitle.textColor  = [UIColor grayColor];
        _labelNameTitle.font = [UIFont systemFontOfSize:13.0f];
//        _labelNameTitle.backgroundColor = [UIColor greenColor];
    }
    return _labelNameTitle;
}
- (UILabel *)labelName {
    if (!_labelName) {
        _labelName = [[UILabel alloc]initWithFrame:CGRectMake(self.labelNameTitle.frame.origin.x + self.labelNameTitle.frame.size.width, self.labelTitle.frame.size.height + self.labelTitle.frame.origin.y, SCREEN_WIDTH - 11 - self.imgHead.frame.size.width - 10 - 40, 15)];
        _labelName.text = @"李宁";
        _labelName.font = [UIFont systemFontOfSize:13.0f];
//        _labelName.backgroundColor = [UIColor grayColor];
    }
    return _labelName;
}

- (UILabel *)labelMessage {
    if (!_labelMessage) {
        _labelMessage = [[UILabel alloc]initWithFrame:CGRectMake(self.imgHead.frame.origin.x + self.imgHead.frame.size.width + 10,  self.labelName.frame.size.height + self.labelName.frame.origin.y, SCREEN_WIDTH - 11 - self.imgHead.frame.size.width - 10 - 40, 30)];
        _labelMessage.text = @"冬日到了，暖暖的午后，冬日到了，暖暖的午后，冬日到了，暖暖的午后，冬日到了，暖暖的午后，冬日到了，暖暖的午后";
        _labelMessage.font = [UIFont systemFontOfSize:11.0f];
        _labelMessage.textColor  = [UIColor grayColor];
//        _labelMessage.backgroundColor = [UIColor redColor];
        _labelMessage.lineBreakMode = NSLineBreakByTruncatingTail;
        _labelMessage.numberOfLines = 2;
    }
    return _labelMessage;
}

//- (UILabel *)labelExpire {
//    if (!_labelExpire) {
//        _labelExpire = [UILabel alloc]initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
//    }
//}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
