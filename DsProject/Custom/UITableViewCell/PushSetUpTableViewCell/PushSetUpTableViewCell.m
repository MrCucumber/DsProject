//
//  PushSetUpTableViewCell.m
//  DsProject
//
//  Created by Cucumber on 16/2/5.
//  Copyright © 2016年 Cucumber. All rights reserved.
//

#import "PushSetUpTableViewCell.h"

@implementation PushSetUpTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self layoutPushSetUpTableViewCell];
    }
    return self;
}

- (void)layoutPushSetUpTableViewCell {
    [self addSubview:self.labelText];
    [self addSubview:self.switchButton];

}
#pragma mark - 私有方法
// 开关事件
- (void)switchValueChange:(id)sender {
    if ([(UISwitch *)sender isOn]) {
        NSLog(@"开关开启");
    } else {
        NSLog(@"开关关闭");
    }
    
}
#pragma mark - 懒加载

- (UILabel *)labelText {
    if (!_labelText) {
        _labelText = [[UILabel alloc]initWithFrame:CGRectMake(18, 0, 100, 44)];
    }
    return _labelText;
}
- (UISwitch *)switchButton {
    if (!_switchButton) {
        _switchButton = [[UISwitch alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 60 , 8, 50, 18)];
        [_switchButton addTarget:self action:@selector(switchValueChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _switchButton;
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
