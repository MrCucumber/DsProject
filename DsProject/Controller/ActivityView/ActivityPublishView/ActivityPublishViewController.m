//
//  ActivityPublishViewController.m
//  DsProject
//
//  Created by Cucumber on 16/1/22.
//  Copyright © 2016年 Cucumber. All rights reserved.
//

#import "ActivityPublishViewController.h"
#import "MXPullDownMenu.h"

@interface ActivityPublishViewController ()<MXPullDownMenuDelegate> {
    NSMutableArray *chooseArray ;

}
@property (nonatomic, strong) UILabel *labelActivityName;
@property (nonatomic, strong) UILabel *labelPeopleNum;
@property (nonatomic, strong) UILabel *labelStartTime;
@property (nonatomic, strong) UILabel *labelEndTime;
@property (nonatomic, strong) UILabel *labelActivityType;
@property (nonatomic, strong) UILabel *labelWhoCanSee;
@property (nonatomic, strong) UILabel *labelAddress;

@property (nonatomic, strong) UITextField *textfieldActivityName;
@property (nonatomic, strong) UITextField *textfieldPeopleNum;
@property (nonatomic, strong) UITextField *textfieldStartTime;
@property (nonatomic, strong) UITextField *textfieldEndTime;
@property (nonatomic, strong) UITextField *textfieldAddress;

@property (nonatomic, strong) UITextView *textView;

@property (nonatomic, strong) UIButton *buttonPublic;
@property (nonatomic, strong) UIButton *buttonFriend;
@property (nonatomic, strong) UIButton *buttonActivityPublish;

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *viewTop;
@property (nonatomic, strong) UIView *viewLayer;
//@property (nonatomic, strong) UIView *viewButtonType;

@property (nonatomic, strong) NSString *strButtonState;



@end

@implementation ActivityPublishViewController

#pragma mark - 生命周期

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.strButtonState = @"0";
    self.buttonPublic.selected = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"发起活动";
    [self layoutActivityPublish];
}

- (void)layoutActivityPublish {
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.viewTop];
    
    [self.scrollView addSubview:self.textView];

    
    [self.viewTop addSubview:self.labelActivityName];
    [self.viewTop addSubview:self.labelPeopleNum];
    [self.viewTop addSubview:self.labelStartTime];
    [self.viewTop addSubview:self.labelEndTime];
    [self.viewTop addSubview:self.labelActivityType];
    [self.viewTop addSubview:self.labelWhoCanSee];
    [self.viewTop addSubview:self.labelAddress];
    
    [self.viewTop addSubview:self.textfieldActivityName];
    [self.viewTop addSubview:self.textfieldPeopleNum];
    [self.viewTop addSubview:self.textfieldStartTime];
    [self.viewTop addSubview:self.textfieldEndTime];
    [self.viewTop addSubview:self.textfieldAddress];
    
    [self.viewTop addSubview:self.buttonPublic];
    [self.viewTop addSubview:self.buttonFriend];

    [self.scrollView addSubview:self.buttonActivityPublish];

    
    chooseArray = [NSMutableArray arrayWithArray:@[
                                                   @[@"请选择活动类别",@"跑步",@"跳舞",@"足球",@"自行车",@"攀岩"]
                                                   ]];
    MXPullDownMenu *menu = [[MXPullDownMenu alloc] initWithArray:chooseArray selectedColor:[UIColor greenColor]];
    menu.delegate = self;
    menu.frame = CGRectMake(self.labelActivityType.right, self.textfieldEndTime.bottom + 2, SCREEN_WIDTH - 22 - self.labelActivityType.width, 40);

    [self.scrollView addSubview:menu];

    
    for (int i = 1; i<7; i++) {
        self.viewLayer = [[UIView alloc]initWithFrame:CGRectMake(15, 44.5 * i, SCREEN_WIDTH - 15, 0.5)];
        self.viewLayer.backgroundColor = [UIColor lightGrayColor];
        [self.viewTop addSubview:self.viewLayer];
    }
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, self.buttonActivityPublish.bottom + 30);
    
    
    

}
// 实现代理.
#pragma mark - MXPullDownMenuDelegate

- (void)PullDownMenu:(MXPullDownMenu *)pullDownMenu didSelectRowAtColumn:(NSInteger)column row:(NSInteger)row
{
    NSLog(@"%ld -- %ld", (long)column, (long)row);
}



#pragma mark -  私有方法
- (void)buttonActivityPublishAct {
    
}

- (void)buttonFriendAct {
    self.buttonFriend.selected = YES;
    self.buttonPublic.selected = NO;
    self.strButtonState = @"1";
}
- (void)buttonPublicAct {
    self.buttonPublic.selected = YES;
    self.buttonFriend.selected = NO;
    self.strButtonState = @"0";
}
#pragma mark - 懒加载

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
        _scrollView.backgroundColor = [UIColor colorWithRed:244.0/255.0 green:245.0/255.0 blue:249.0/255.0 alpha:1];
        _scrollView.bounces = NO;
    }
    return _scrollView;
}

- (UIView *)viewTop {
    if (!_viewTop) {
        _viewTop = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44*7 + 3)];
        _viewTop.backgroundColor = [UIColor whiteColor];
        _viewTop.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _viewTop.layer.borderWidth = 0.5;
    }
    return _viewTop;
}

- (UILabel *)labelActivityName {
    if (!_labelActivityName) {
        _labelActivityName = [[UILabel alloc]initWithFrame:CGRectMake(22, 0, 65, 44)];
        _labelActivityName.text = @"活动名称";
        _labelActivityName.font = [UIFont systemFontOfSize:15.0f];
    }
    return _labelActivityName;
}

- (UILabel *)labelPeopleNum {
    if (!_labelPeopleNum) {
        _labelPeopleNum = [[UILabel alloc]initWithFrame:CGRectMake(22, self.labelActivityName.bottom + 0.5, 65, 44)];
        _labelPeopleNum.text = @"活动人数";
        _labelPeopleNum.font = [UIFont systemFontOfSize:15.0f];
    }
    return _labelPeopleNum;
}

- (UILabel *)labelStartTime {
    if (!_labelStartTime) {
        _labelStartTime = [[UILabel alloc]initWithFrame:CGRectMake(22, self.labelPeopleNum.bottom + 0.5, 65, 44)];
        _labelStartTime.text = @"开始时间";
        _labelStartTime.font = [UIFont systemFontOfSize:15.0f];
    }
    return _labelStartTime;
}

- (UILabel *)labelEndTime {
    if (!_labelEndTime) {
        _labelEndTime = [[UILabel alloc]initWithFrame:CGRectMake(22, self.labelStartTime.bottom + 0.5, 65, 44)];
        _labelEndTime.text = @"结束时间";
        _labelEndTime.font = [UIFont systemFontOfSize:15.0f];
    }
    return _labelEndTime;
}

- (UILabel *)labelActivityType {
    if (!_labelActivityType) {
        _labelActivityType = [[UILabel alloc]initWithFrame:CGRectMake(22, self.labelEndTime.bottom + 0.5, 65, 44)];
        _labelActivityType.text = @"活动类别";
        _labelActivityType.font = [UIFont systemFontOfSize:15.0f];
    }
    return _labelActivityType;
}

- (UILabel *)labelWhoCanSee {
    if (!_labelWhoCanSee) {
        _labelWhoCanSee = [[UILabel alloc]initWithFrame:CGRectMake(22, self.labelActivityType.bottom + 0.5, 65, 44)];
        _labelWhoCanSee.text = @"谁可以看";
        _labelWhoCanSee.font = [UIFont systemFontOfSize:15.0f];
    }
    return _labelWhoCanSee;
}

- (UILabel *)labelAddress {
    if (!_labelAddress) {
        _labelAddress = [[UILabel alloc]initWithFrame:CGRectMake(22, self.labelWhoCanSee.bottom + 0.5, 65, 44)];
        _labelAddress.text = @"活动地点";
        _labelAddress.font = [UIFont systemFontOfSize:15.0f];
    }
    return _labelAddress;
}

- (UITextField *)textfieldActivityName {
    if (!_textfieldActivityName) {
        _textfieldActivityName = [[UITextField alloc]initWithFrame:CGRectMake(self.labelActivityName.right , 0, SCREEN_WIDTH - self.labelActivityName.width - 22 , 44)];
        _textfieldActivityName.placeholder = @"    请输入您发起活动的名称";
    }
    return _textfieldActivityName;
}

- (UITextField *)textfieldPeopleNum {
    if (!_textfieldPeopleNum) {
        _textfieldPeopleNum = [[UITextField alloc]initWithFrame:CGRectMake(self.labelActivityName.right , self.textfieldActivityName.bottom + 0.5, SCREEN_WIDTH - self.labelActivityName.width - 22 , 44)];
        _textfieldPeopleNum.placeholder = @"    请输入活动人数";
    }
    return _textfieldPeopleNum;
}

- (UITextField *)textfieldStartTime {
    if (!_textfieldStartTime) {
        _textfieldStartTime = [[UITextField alloc]initWithFrame:CGRectMake(self.labelActivityName.right , self.textfieldPeopleNum.bottom + 0.5, SCREEN_WIDTH - self.labelActivityName.width - 22 , 44)];
        _textfieldStartTime.placeholder = @"    请输入活动开始时间";
    }
    return _textfieldStartTime;
}

- (UITextField *)textfieldEndTime {
    if (!_textfieldEndTime) {
        _textfieldEndTime = [[UITextField alloc]initWithFrame:CGRectMake(self.labelActivityName.right , self.textfieldStartTime.bottom + 0.5, SCREEN_WIDTH - self.labelActivityName.width - 22 , 44)];
        _textfieldEndTime.placeholder = @"    请输入活动结束时间";
    }
    return _textfieldEndTime;
}

- (UITextField *)textfieldAddress {
    if (!_textfieldAddress) {
        _textfieldAddress = [[UITextField alloc]initWithFrame:CGRectMake(self.labelActivityName.right , self.labelWhoCanSee.bottom + 0.5, SCREEN_WIDTH - self.labelActivityName.width - 22 , 44)];
        _textfieldAddress.placeholder = @"    请输入活动地点";
    }
    return _textfieldAddress;
}

- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc]initWithFrame:CGRectMake(0, self.viewTop.bottom + 15, SCREEN_WIDTH, 130)];
        _textView.text = @"请您简单介绍活动详情";
    }
    return _textView;
}

- (UIButton *)buttonActivityPublish {
    if (!_buttonActivityPublish) {
        _buttonActivityPublish = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonActivityPublish.frame = CGRectMake(12, self.textView.bottom + 14, SCREEN_WIDTH - 24, 38);
        _buttonActivityPublish.backgroundColor = [UIColor colorWithRed:0.0/255.0 green:168.0/255.0 blue:143.0/255.0 alpha:1];
        [_buttonActivityPublish setTitle:@"发布活动" forState:UIControlStateNormal];
        [_buttonActivityPublish setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_buttonActivityPublish.layer setCornerRadius:2.0f];
        [_buttonActivityPublish addTarget:self action:@selector(buttonActivityPublishAct) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonActivityPublish;
}

- (UIButton *)buttonPublic {
    if (!_buttonPublic) {
        _buttonPublic = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonPublic.frame = CGRectMake(self.labelWhoCanSee.right + 10, self.labelActivityType.bottom, 55, 44);
        _buttonPublic.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [_buttonPublic setImage:[UIImage imageNamed:@"icon_btnUnSelect"] forState:UIControlStateNormal];
        [_buttonPublic setImage:[UIImage imageNamed:@"icon_btnSelect"] forState:UIControlStateSelected];
        [_buttonPublic setTitle:@" 公众" forState:UIControlStateNormal];
        [_buttonPublic addTarget:self action:@selector(buttonPublicAct) forControlEvents:UIControlEventTouchUpInside];
        [_buttonPublic setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _buttonPublic;
}

- (UIButton *)buttonFriend {
    if (!_buttonFriend) {
        _buttonFriend = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonFriend.frame = CGRectMake(self.buttonPublic.right + 20, self.labelActivityType.bottom, 55, 44);
        _buttonFriend.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [_buttonFriend setImage:[UIImage imageNamed:@"icon_btnUnSelect"] forState:UIControlStateNormal];
        [_buttonFriend setImage:[UIImage imageNamed:@"icon_btnSelect"] forState:UIControlStateSelected];
        [_buttonFriend setTitle:@" 好友" forState:UIControlStateNormal];
        [_buttonFriend addTarget:self action:@selector(buttonFriendAct) forControlEvents:UIControlEventTouchUpInside];
        [_buttonFriend setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _buttonFriend;
}








@end
