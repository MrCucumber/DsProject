
//
//  ActivityDetailViewController.m
//  DsProject
//
//  Created by Cucumber on 16/1/25.
//  Copyright © 2016年 Cucumber. All rights reserved.
//

#import "ActivityDetailViewController.h"

@interface ActivityDetailViewController ()

@property (nonatomic, strong) UIImageView *imgTop;                  // 头部背景图
@property (nonatomic, strong) UIView *viewBottom;                   // view透明
@property (nonatomic, strong) UIView *viewTop;                      // view 上部不透明
@property (nonatomic, strong) UIImageView *imgFire;                 // 火焰图片
@property (nonatomic, strong) UILabel *labelHot;                    // 热度
@property (nonatomic, strong) UILabel *labelHotNum;                 // 热度数量

@property (nonatomic, strong) UIView *viewMiddle;                   // 中间底部view
@property (nonatomic, strong) UIImageView *imgActivityName;         // 活动名称
@property (nonatomic, strong) UIImageView *imgStartTime;            // 开始时间
@property (nonatomic, strong) UIImageView *imgEndTime;              // 结束时间
@property (nonatomic, strong) UIImageView *imgActivityAddress;      // 活动地址
@property (nonatomic, strong) UIImageView *imgActivityIntroduce;    // 活动介绍

@property (nonatomic, strong) UILabel *labelNameTitle;              // label活动名称
@property (nonatomic, strong) UILabel *labelStartTimeTitle;         // label 开始时间
@property (nonatomic, strong) UILabel *labelEndTimeTitle;           // label 结束时间
@property (nonatomic, strong) UILabel *labelAddressTitle;           // label 地址title
@property (nonatomic, strong) UILabel *labelActivityIntroduceTitle; // 活动介绍

@property (nonatomic, strong) UILabel *labelName;                   // 显示活动名称
@property (nonatomic, strong) UILabel *labelStartTime;              // 开始时间
@property (nonatomic, strong) UILabel *labelEndTime;                // 结束时间
@property (nonatomic, strong) UILabel *labelAddress;                // 地址label

@property (nonatomic, strong) UITextView *textView;                 //textview

@property (nonatomic, strong) UIButton *buttonAdd;                  // 按钮添加

@property (nonatomic, strong) UILabel *labelJoinNum;                // 参加数量
@property (nonatomic, strong) UILabel *labelPeopelNum;              // 人数

@property (nonatomic, strong) UIScrollView *scrollView;

// 线。。
@property (nonatomic, strong) UIView *viewLayer;
@property (nonatomic, strong) UIView *viewLayer1;
@property (nonatomic, strong) UIView *viewLayer2;

@property (nonatomic, strong) UIView *viewActivityIntroduce;


@property (nonatomic, strong) NSString *strState;
@property (nonatomic, strong) UIButton *buttonRight;




@end

@implementation ActivityDetailViewController
#pragma mark - 生命周期
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.strState = @"0";
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title  = @"活动详情";
    
    // 导航栏左侧按钮
    self.buttonRight = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.buttonRight setFrame:CGRectMake(0, 0, 40, 40)];
    [self.buttonRight addTarget:self action:@selector(collectAct) forControlEvents:UIControlEventTouchUpInside];
    self.buttonRight.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [self.buttonRight setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    [self.buttonRight setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.buttonRight setTitle:@"收藏" forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.buttonRight];
    
    [self layoutActivityDetailView];
}
- (void)layoutActivityDetailView {
    
    [self.view addSubview:self.scrollView];
    
    [self.scrollView addSubview:self.imgTop];
    [self.scrollView addSubview:self.viewMiddle];
    
    [self.imgTop addSubview:self.viewBottom];
    [self.imgTop addSubview:self.viewTop];
    [self.viewTop addSubview:self.imgFire];
    [self.viewTop addSubview:self.labelHot];
    [self.viewTop addSubview:self.labelHotNum];
    
    [self.viewMiddle addSubview:self.imgActivityName];
    [self.viewMiddle addSubview:self.imgStartTime];
    [self.viewMiddle addSubview:self.imgEndTime];
    [self.viewMiddle addSubview:self.imgActivityAddress];
    [self.viewMiddle addSubview:self.imgActivityIntroduce];
    
    [self.viewMiddle addSubview:self.labelNameTitle];
    [self.viewMiddle addSubview:self.labelStartTimeTitle];
    [self.viewMiddle addSubview:self.labelEndTimeTitle];
    [self.viewMiddle addSubview:self.labelAddressTitle];
    
    [self.viewMiddle addSubview:self.labelActivityIntroduceTitle];
    
    [self.viewMiddle addSubview:self.labelName];
    [self.viewMiddle addSubview:self.labelStartTime];
    [self.viewMiddle addSubview:self.labelEndTime];
    [self.viewMiddle addSubview:self.labelAddress];
    
    [self.viewMiddle addSubview:self.viewLayer];
    [self.viewMiddle addSubview:self.viewLayer1];
    [self.viewMiddle addSubview:self.viewLayer2];
    
    
    [self.scrollView addSubview:self.viewActivityIntroduce];
    [self.viewActivityIntroduce addSubview:self.imgActivityIntroduce];
    [self.viewActivityIntroduce addSubview:self.labelActivityIntroduceTitle];
    [self.viewActivityIntroduce addSubview:self.textView];
    
    [self.scrollView addSubview:self.buttonAdd];
    [self.scrollView addSubview:self.labelJoinNum];
    [self.scrollView addSubview:self.labelPeopelNum];

    self.viewActivityIntroduce.frame = CGRectMake(0, self.viewMiddle.bottom + 20, SCREEN_WIDTH, 30 + self.textView.contentSize.height+10);
    self.buttonAdd.frame = CGRectMake(10, self.viewActivityIntroduce.bottom + 10, SCREEN_WIDTH - 20, 38);
    self.labelJoinNum.frame = CGRectMake(0, self.buttonAdd.bottom + 10, SCREEN_WIDTH, 20);
    self.labelPeopelNum.frame = CGRectMake(0, self.labelJoinNum.bottom + 8, SCREEN_WIDTH, 20);


    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, self.labelPeopelNum.bottom + 30);
}

#pragma mark - 私有方法
- (void)collectAct {
    if ([self.strState isEqualToString:@"0"]) {
        self.buttonRight.selected = YES;
        self.strState = @"1";
    }else if([self.strState isEqualToString:@"1"]) {
        self.strState = @"0";
        self.buttonRight.selected = NO;
    }

}
#pragma mark － 懒加载
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
        _scrollView.backgroundColor = [UIColor colorWithRed:243.0/255.0 green:244.0/255.0 blue:248.0/255.0 alpha:1];
        _scrollView.bounces = NO;
    }
    return _scrollView;
}

- (UIImageView *)imgTop {
    if (!_imgTop) {
        _imgTop = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 148.5)];
        _imgTop.image = [UIImage imageNamed:@"activityBottom"];
    }
    return _imgTop;
}

- (UIView *)viewBottom {
    if (!_viewBottom) {
        _viewBottom = [[UIView alloc]initWithFrame:CGRectMake(0, self.imgTop.height - 35, SCREEN_WIDTH, 35)];
        _viewBottom.backgroundColor = [UIColor whiteColor];
        _viewBottom.alpha = 0.7;
    }
    return _viewBottom;
}

- (UIView *)viewTop {
    if (!_viewTop) {
        _viewTop = [[UIView alloc]initWithFrame:CGRectMake(0, self.imgTop.height - 35, SCREEN_WIDTH, 35)];
        _viewTop.backgroundColor = [UIColor clearColor];
    }
    return _viewTop;
}

- (UIImageView *)imgFire {
    if (!_imgFire) {
        _imgFire = [[UIImageView alloc]initWithFrame:CGRectMake(self.viewTop.frame.size.width - 96, 7, 13, 17)];
        _imgFire.image = [UIImage imageNamed:@"icon_hotFire"];
    }
    return _imgFire;
}

- (UILabel *)labelHot {
    if (!_labelHot) {
        _labelHot = [[UILabel alloc]initWithFrame:CGRectMake(self.imgFire.frame.size.width + self.imgFire.frame.origin.x + 2 , 5, 30, 25)];
        _labelHot.text = @"热度";
        _labelHot.textAlignment = NSTextAlignmentCenter;
        _labelHot.font = [UIFont systemFontOfSize:14.0f];
    }
    return _labelHot;
}

- (UILabel *)labelHotNum {
    if (!_labelHotNum) {
        _labelHotNum = [[UILabel alloc]initWithFrame:CGRectMake(self.labelHot.frame.size.width + self.labelHot.frame.origin.x , 5, 55, 25)];
        _labelHotNum.text = @"(99)";
        _labelHotNum.textColor = [UIColor grayColor];
        _labelHotNum.font = [UIFont systemFontOfSize:13.0f];
        _labelHotNum.textAlignment = NSTextAlignmentLeft;
    }
    return _labelHotNum;
}

- (UIView *)viewMiddle {
    if (!_viewMiddle) {
        _viewMiddle = [[UIView alloc]initWithFrame:CGRectMake(0, self.imgTop.bottom, SCREEN_WIDTH, 44*4 +1.5)];
        _viewMiddle.backgroundColor = [UIColor whiteColor];
        _viewMiddle.layer.borderWidth = 0.5;
        _viewMiddle.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
    return _viewMiddle;
}

- (UIImageView *)imgActivityName {
    if (!_imgActivityName) {
        _imgActivityName = [[UIImageView alloc]initWithFrame:CGRectMake(15, 14, 17, 17)];
        _imgActivityName.image = [UIImage imageNamed:@"icon_ActivityDetailName"];
    }
    return _imgActivityName;
}

- (UIImageView *)imgStartTime {
    if (!_imgStartTime) {
        _imgStartTime = [[UIImageView alloc]initWithFrame:CGRectMake( 15, self.imgActivityName.bottom + 27+0.5, 17, 17)];
        _imgStartTime.image = [UIImage imageNamed:@"icon_ActivityDetailStartTime"];
    }
    return _imgStartTime;
}
- (UIImageView *)imgEndTime {
    if (!_imgEndTime) {
        _imgEndTime = [[UIImageView alloc]initWithFrame:CGRectMake( 15, self.imgStartTime.bottom + 27+0.5, 17, 17)];
        _imgEndTime.image = [UIImage imageNamed:@"icon_ActivityDetailStartTime"];
    }
    return _imgEndTime;
}
- (UIImageView *)imgActivityAddress {
    if (!_imgActivityAddress) {
        _imgActivityAddress = [[UIImageView alloc]initWithFrame:CGRectMake( 15, self.imgEndTime.bottom + 27+0.5, 17, 17)];
        _imgActivityAddress.image = [UIImage imageNamed:@"icon_ActivityDetailAddress"];
    }
    return _imgActivityAddress;
}

- (UILabel *)labelNameTitle {
    if (!_labelNameTitle) {
        _labelNameTitle = [[UILabel alloc]initWithFrame:CGRectMake(self.imgActivityName.right + 5, 0, 75, 44)];
        _labelNameTitle.text = @"活动名称：";
        _labelNameTitle.font = [UIFont systemFontOfSize:15.0f];
//        _labelNameTitle.backgroundColor = [UIColor redColor];
    }
    return _labelNameTitle;
}

- (UILabel *)labelStartTimeTitle {
    if (!_labelStartTimeTitle) {
        _labelStartTimeTitle = [[UILabel alloc]initWithFrame:CGRectMake(self.imgActivityName.right + 5, self.labelNameTitle.bottom + 0.5, 75, 44)];
        _labelStartTimeTitle.text = @"开始时间：";
        _labelStartTimeTitle.font = [UIFont systemFontOfSize:15.0f];
//        _labelStartTimeTitle.backgroundColor = [UIColor redColor];
    }
    return _labelStartTimeTitle;
}

- (UILabel *)labelEndTimeTitle {
    if (!_labelEndTimeTitle) {
        _labelEndTimeTitle = [[UILabel alloc]initWithFrame:CGRectMake(self.imgActivityName.right + 5, self.labelStartTimeTitle.bottom + 0.5, 75, 44)];
        _labelEndTimeTitle.text = @"结束时间：";
        _labelEndTimeTitle.font = [UIFont systemFontOfSize:15.0f];
//        _labelEndTimeTitle.backgroundColor = [UIColor redColor];
    }
    return _labelEndTimeTitle;
}

- (UILabel *)labelAddressTitle {
    if (!_labelAddressTitle) {
        _labelAddressTitle = [[UILabel alloc]initWithFrame:CGRectMake(self.imgActivityName.right + 5, self.labelEndTimeTitle.bottom + 0.5, 75, 44)];
        _labelAddressTitle.text = @"活动地点：";
        _labelAddressTitle.font = [UIFont systemFontOfSize:15.0f];
//        _labelAddressTitle.backgroundColor = [UIColors redColor];
    }
    return _labelAddressTitle;
}

- (UILabel *)labelName {
    if (!_labelName) {
        _labelName = [[UILabel alloc]initWithFrame:CGRectMake(self.labelNameTitle.right, 0, SCREEN_WIDTH - self.labelNameTitle.width - self.labelNameTitle.origin.x, 44)];
//        _labelName.backgroundColor = [UIColor orangeColor];
        _labelName.text = @"跑步";
    }
    return _labelName;
}

- (UILabel *)labelStartTime {
    if (!_labelStartTime) {
        _labelStartTime = [[UILabel alloc]initWithFrame:CGRectMake(self.labelNameTitle.right, self.labelName.bottom + 0.5, SCREEN_WIDTH - self.labelNameTitle.width - self.labelNameTitle.origin.x, 44)];
//        _labelStartTime.backgroundColor = [UIColor orangeColor];
        _labelStartTime.text = @"2015-11-11 06:30";
    }
    return _labelStartTime;
}

- (UILabel *)labelEndTime {
    if (!_labelEndTime) {
        _labelEndTime = [[UILabel alloc]initWithFrame:CGRectMake(self.labelNameTitle.right, self.labelStartTime.bottom + 0.5, SCREEN_WIDTH - self.labelNameTitle.width - self.labelNameTitle.origin.x, 44)];
//        _labelEndTime.backgroundColor = [UIColor orangeColor];
        _labelEndTime.text = @"2015-11-21 06:30";

    }
    return _labelEndTime;
}

- (UILabel *)labelAddress {
    if (!_labelAddress) {
        _labelAddress = [[UILabel alloc]initWithFrame:CGRectMake(self.labelNameTitle.right, self.labelEndTime.bottom + 0.5, SCREEN_WIDTH - self.labelNameTitle.width - self.labelNameTitle.origin.x, 44)];
//        _labelAddress.backgroundColor = [UIColor orangeColor];
        _labelAddress.text = @"印度墨尔本市宝山区万达广场";
    }
    return _labelAddress;
}

- (UIView *)viewLayer {
    if (!_viewLayer) {
        _viewLayer = [[UIView alloc]initWithFrame:CGRectMake(0, self.labelName.bottom, SCREEN_WIDTH, 1)];
        _viewLayer.backgroundColor = [UIColor lightGrayColor];
    }
    return _viewLayer;
}

- (UIView *)viewLayer1 {
    if (!_viewLayer1) {
        _viewLayer1 = [[UIView alloc]initWithFrame:CGRectMake(0, self.labelStartTime.bottom, SCREEN_WIDTH, 1)];
        _viewLayer1.backgroundColor = [UIColor lightGrayColor];
    }
    return _viewLayer1;
}

- (UIView *)viewLayer2 {
    if (!_viewLayer2) {
        _viewLayer2 = [[UIView alloc]initWithFrame:CGRectMake(0, self.labelEndTime.bottom, SCREEN_WIDTH, 1)];
        _viewLayer2.backgroundColor = [UIColor lightGrayColor];
    }
    return _viewLayer2;
}

- (UIView *)viewActivityIntroduce {
    if (!_viewActivityIntroduce) {
        _viewActivityIntroduce = [[UIView alloc]initWithFrame:CGRectMake(0, self.viewMiddle.bottom + 20, SCREEN_WIDTH, 135)];
        _viewActivityIntroduce.backgroundColor = [UIColor whiteColor];
    }
    return _viewActivityIntroduce;
}

- (UIImageView *)imgActivityIntroduce {
    if (!_imgActivityIntroduce) {
        _imgActivityIntroduce = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, 17, 17)];
        _imgActivityIntroduce.image = [UIImage imageNamed:@"icon_ActivityDetailList"];
    }
    return _imgActivityIntroduce;
}

- (UILabel *)labelActivityIntroduceTitle {
    if (!_labelActivityIntroduceTitle) {
        _labelActivityIntroduceTitle = [[UILabel alloc]initWithFrame:CGRectMake(self.imgActivityIntroduce.right + 5, 10, 65, 20)];
        _labelActivityIntroduceTitle.text = @"活动介绍";
        _labelActivityIntroduceTitle.font = [UIFont systemFontOfSize:16.0f];
    }
    return _labelActivityIntroduceTitle;
}

- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc]initWithFrame:CGRectMake(15, 35, SCREEN_WIDTH - 30, 95)];
        _textView.text = @"        跑步锻炼是人们常采用的一种身体锻炼方式，这主要是因为跑步技术要求简单，无需特殊的场地、服装或器械。无论在运动场上或在马路上，甚至在田野间、树林中均可以跑步锻炼，无需特殊的场地、服装或器械。无论在运动场上或在马路上，甚至在田野间、树林中均可以跑步锻炼";
        _textView.font = [UIFont systemFontOfSize:15.0f];
        _textView.frame = CGRectMake(15, 35, SCREEN_WIDTH - 30, _textView.contentSize.height);
        _textView.editable = YES;
        _textView.bounces = NO;
    }
    return _textView;
}

- (UIButton *)buttonAdd {
    if (!_buttonAdd) {
        _buttonAdd = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonAdd.frame = CGRectMake(10, self.viewActivityIntroduce.bottom + 10, SCREEN_WIDTH - 20, 38);
        _buttonAdd.backgroundColor = [UIColor colorWithRed:27.0/255.0 green:169.0/255.0 blue:143.0/255.0 alpha:1];
        [_buttonAdd setTitle:@"报名参加" forState:UIControlStateNormal];
        [_buttonAdd setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_buttonAdd.layer setCornerRadius:4.0f];
    }
    return _buttonAdd;
}

- (UILabel *)labelJoinNum {
    if (!_labelJoinNum) {
        _labelJoinNum = [[UILabel alloc]initWithFrame:CGRectMake(0, self.buttonAdd.bottom + 10, SCREEN_WIDTH, 20)];
        _labelJoinNum.text = @"已报名参加人数";
        _labelJoinNum.font = [UIFont systemFontOfSize:14.0f];
        _labelJoinNum.textColor = [UIColor grayColor];
        _labelJoinNum.textAlignment = NSTextAlignmentCenter;
    }
    return _labelJoinNum;
}

- (UILabel *)labelPeopelNum {
    if (!_labelPeopelNum) {
        _labelPeopelNum = [[UILabel alloc]initWithFrame:CGRectMake(0, self.labelJoinNum.bottom + 8, SCREEN_WIDTH, 20)];
        _labelPeopelNum.text = @"24人";
        _labelPeopelNum.font = [UIFont systemFontOfSize:15.0f];
        _labelPeopelNum.textColor = [UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1];
        _labelPeopelNum.textAlignment = NSTextAlignmentCenter;
    }
    return _labelPeopelNum;
}
@end
