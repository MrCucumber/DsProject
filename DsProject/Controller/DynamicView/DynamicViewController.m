//
//  DynamicViewController.m
//  DsProject
//
//  Created by 黄哲俊 on 15/12/15.
//  Copyright © 2015年 own. All rights reserved.
//

#import "DynamicViewController.h"
#import "DynamicTableViewCell.h"
#import "DynamicDetailViewController.h"
#import "DynamicPublishViewController.h"

@interface DynamicViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UIImageView *imgViewTop;
@property (nonatomic, strong) UIImageView *imgViewHead;
@property (nonatomic, strong) UILabel *labelName;
@property (nonatomic, strong) UILabel *labelSex;
@property (nonatomic, strong) UILabel *labelAge;
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIView *viewButton;
@property (nonatomic, strong) UIButton *buttonAll;
@property (nonatomic, strong) UIButton *buttonFriend;


@end

@implementation DynamicViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.buttonAll.selected = YES;
    self.buttonFriend.backgroundColor = [UIColor colorWithRed:91.0/255.0 green:99.0/255.0 blue:120.0/255.0 alpha:1];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 导航栏左侧按钮
    UIButton *buttonRight = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonRight setFrame:CGRectMake(0, 0, 40, 40)];
    [buttonRight setImage:[UIImage imageNamed:@"icon_DynamicPublish"] forState:UIControlStateNormal];
        [buttonRight addTarget:self action:@selector(pushDynamicPublish) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:buttonRight];

    self.navigationItem.title = @"动态";
    [self layoutDynamicView]; // 布局动态页面
}
// 布局动态页面
- (void)layoutDynamicView {
    [self.view addSubview:self.imgViewTop];
    [self.imgViewTop addSubview:self.imgViewHead];
    [self.imgViewTop addSubview:self.labelAge];
    [self.imgViewTop addSubview:self.labelName];
    [self.imgViewTop addSubview:self.labelSex];
    
    [self.view addSubview:self.viewButton];
    [self.viewButton addSubview:self.buttonAll];
    [self.viewButton addSubview:self.buttonFriend];
    
    [self.view addSubview:self.tableView];

}

#pragma mark - tableViewDelegate & tabledatasours
// 列表行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

// 列表高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"identifierDiscoverTableViewCell";
    DynamicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[DynamicTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
//    cell.imgBottom.image = [UIImage imageNamed:@"activityBottom"];
    
    
    //    [cell.imgViewDiscover sd_setImageWithURL:[NSURL URLWithString:[[self.arrayData objectAtIndex:indexPath.row] objectForKey:@"ImageUrl"]]];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DynamicDetailViewController *vc = [[DynamicDetailViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

#pragma mark - 私有方法
- (void)pushDynamicPublish {
    DynamicPublishViewController *vc = [[DynamicPublishViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

- (void)buttonAllAct {
    
    self.buttonAll.selected = YES;
    self.buttonFriend.selected = NO;
    self.buttonFriend.backgroundColor = [UIColor colorWithRed:91.0/255.0 green:99.0/255.0 blue:120.0/255.0 alpha:1];
    self.buttonAll.backgroundColor = [UIColor colorWithRed:57.0/255.0 green:63.0/255.0 blue:79.0/255.0 alpha:1];
    
}

- (void)buttonFriendAct {
    self.buttonAll.selected = NO;
    self.buttonFriend.selected = YES;
    self.buttonAll.backgroundColor = [UIColor colorWithRed:91.0/255.0 green:99.0/255.0 blue:120.0/255.0 alpha:1];
    self.buttonFriend.backgroundColor = [UIColor colorWithRed:57.0/255.0 green:63.0/255.0 blue:79.0/255.0 alpha:1];

}
#pragma mark -懒加载
- (UIImageView *)imgViewTop {
    if (!_imgViewTop) {
        _imgViewTop = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 115)];
        _imgViewTop.image = [UIImage imageNamed:@""];
        _imgViewTop.backgroundColor = [UIColor orangeColor];
    }
    return _imgViewTop;
}

- (UIImageView *)imgViewHead {
    if (!_imgViewHead) {
        _imgViewHead = [[UIImageView alloc]initWithFrame:CGRectMake(32, 38, 40, 40)];
        _imgViewHead.image = [UIImage imageNamed:@""];
        _imgViewHead.backgroundColor = [UIColor grayColor];
        [_imgViewHead.layer setCornerRadius:20];
    }
    return _imgViewHead;
}

- (UILabel *)labelSex {
    if (!_labelSex) {
        _labelSex = [[UILabel alloc]initWithFrame:CGRectMake(self.imgViewHead.right + 13, self.labelName.bottom, 20, 20)];
        _labelSex.text = @"女";
        _labelSex.font = [UIFont systemFontOfSize:14.0f];
        _labelSex.textColor = [UIColor whiteColor];
    }
    return _labelSex;
}
- (UILabel *)labelAge {
    if (!_labelAge) {
        _labelAge = [[UILabel alloc]initWithFrame:CGRectMake(self.labelSex.right, self.labelName.bottom, 50, 20)];
        _labelAge.text = @"85后";
        _labelAge.font = [UIFont systemFontOfSize:14.0f];
        _labelAge.textColor = [UIColor whiteColor];
    }
    return _labelAge;
}
- (UILabel *)labelName {
    if (!_labelName) {
        _labelName = [[UILabel alloc]initWithFrame:CGRectMake(self.imgViewHead.right + 13, 41, 80, 20)];
        _labelName.text = @"快乐天使";
        _labelName.font = [UIFont systemFontOfSize:16.0f];
        _labelName.textColor = [UIColor whiteColor];
    }
    return _labelName;
}

- (UIView *)viewButton {
    if (!_viewButton) {
        _viewButton = [[UIView alloc]initWithFrame:CGRectMake(0, self.imgViewTop.bottom, SCREEN_WIDTH, 44)];
    }
    return _viewButton;
}

- (UIButton *)buttonAll {
    if (!_buttonAll) {
        _buttonAll = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonAll.frame = CGRectMake(0, 0, SCREEN_WIDTH/2, 44);
        [_buttonAll setTitle:@"全部" forState:UIControlStateNormal];
        [_buttonAll setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_buttonAll addTarget:self action:@selector(buttonAllAct) forControlEvents:UIControlEventTouchUpInside];
        [_buttonAll setTitleColor:[UIColor colorWithRed:156.0/255.0 green:164.0/255.0 blue:180.0/255.0 alpha:1] forState:UIControlStateSelected];
    }
    return _buttonAll;
}

- (UIButton *)buttonFriend {
    if (!_buttonFriend) {
        _buttonFriend = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonFriend.frame = CGRectMake(SCREEN_WIDTH/2, 0, SCREEN_WIDTH/2, 44);
        [_buttonFriend setTitle:@"好友" forState:UIControlStateNormal];
        [_buttonFriend setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_buttonFriend addTarget:self action:@selector(buttonFriendAct) forControlEvents:UIControlEventTouchUpInside];
        [_buttonFriend setTitleColor:[UIColor colorWithRed:156.0/255.0 green:164.0/255.0 blue:180.0/255.0 alpha:1] forState:UIControlStateSelected];
    }
    return _buttonFriend;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.viewButton.bottom, SCREEN_WIDTH, SCREEN_HEIGHT - self.viewButton.height - self.imgViewTop.height - 64 - 49) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = NO;
    }
    return _tableView;
}


@end

