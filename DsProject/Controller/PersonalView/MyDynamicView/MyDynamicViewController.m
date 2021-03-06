//
//  MyDynamicViewController.m
//  DsProject
//
//  Created by Cucumber on 16/1/31.
//  Copyright © 2016年 Cucumber. All rights reserved.
//

#import "MyDynamicViewController.h"
#import "DynamicDetailViewController.h"
#import "DynamicTableViewCell.h"
#import "DynamicPublishViewController.h"


@interface MyDynamicViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UIImageView *imgViewTop;
@property (nonatomic, strong) UIImageView *imgViewHead;
@property (nonatomic, strong) UILabel *labelName;
@property (nonatomic, strong) UILabel *labelSex;
@property (nonatomic, strong) UILabel *labelAge;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MyDynamicViewController

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的动态";
    
    // 导航栏左侧按钮
    UIButton *buttonRight = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonRight setFrame:CGRectMake(0, 0, 40, 40)];
    [buttonRight setImage:[UIImage imageNamed:@"icon_DynamicPublish"] forState:UIControlStateNormal];
    [buttonRight addTarget:self action:@selector(pushDynamicPublish) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:buttonRight];
    
    [self layoutMyDynamicView];
}

- (void)layoutMyDynamicView {
    
    [self.view addSubview:self.imgViewTop];
    [self.imgViewTop addSubview:self.imgViewHead];
    [self.imgViewTop addSubview:self.labelAge];
    [self.imgViewTop addSubview:self.labelName];
    [self.imgViewTop addSubview:self.labelSex];
    
    [self.view addSubview:self.tableView];

}

#pragma mark - tableViewDelegate & tabledatasours

// 列表头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

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

#pragma mark - 似有方法
// 发起活动
- (void)pushDynamicPublish {
    DynamicPublishViewController *vc = [[DynamicPublishViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 懒加载

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
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.imgViewTop.bottom, SCREEN_WIDTH, SCREEN_HEIGHT  - self.imgViewTop.height - 64 ) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = NO;
    }
    return _tableView;
}



@end
