//
//  ActivityViewController.m
//  DsProject
//
//  Created by 黄哲俊 on 15/12/15.
//  Copyright © 2015年 own. All rights reserved.
//

#import "ActivityViewController.h"
#import "ActivityTableViewCell.h"
#import "ActivityPublishViewController.h"
#import "ActivityListViewController.h"

@interface ActivityViewController () <UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ActivityViewController

#pragma mark - 生命周期
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"活动";

    // 导航栏左侧按钮
    UIButton *buttonRight = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonRight setFrame:CGRectMake(0, 0, 40, 40)];
    [buttonRight setImage:[UIImage imageNamed:@"btn_acitvity_rightAdd"] forState:UIControlStateNormal];
    [buttonRight addTarget:self action:@selector(pushActivtyPublish) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:buttonRight];

    
    [self layoutActivityView]; // 构建一个活动页面
}
// 构建一个活动页面
- (void)layoutActivityView {

    [self.view addSubview:self.searchBar];
    [self.view addSubview:self.tableView];
    
}
#pragma mark - tableViewDelegate & tabledatasours

// 列表行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

// 列表高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 158;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"identifierDiscoverTableViewCell";
    ActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[ActivityTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.imgBottom.image = [UIImage imageNamed:@"activityBottom"];

    
//    [cell.imgViewDiscover sd_setImageWithURL:[NSURL URLWithString:[[self.arrayData objectAtIndex:indexPath.row] objectForKey:@"ImageUrl"]]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    ActivityListViewController *vc = [[ActivityListViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}


#pragma mark - 私有方法
- (void)pushActivtyPublish {
    ActivityPublishViewController *vc = [[ActivityPublishViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed = NO;
    
}

#pragma mark -懒加载
// 搜索框
- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 40)];
        _searchBar.backgroundColor = [UIColor clearColor];
        _searchBar.placeholder = @"搜索";
//        _searchBar.delegate = self;
    }
    return _searchBar;
}

// tableview
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64 + 40, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 40 - 49)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = NO;
    }
    return _tableView;
}

@end
