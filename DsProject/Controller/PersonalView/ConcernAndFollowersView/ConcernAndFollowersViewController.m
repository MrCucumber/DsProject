//
//  ConcernAndFollowersViewController.m
//  DsProject
//
//  Created by Cucumber on 16/2/1.
//  Copyright © 2016年 Cucumber. All rights reserved.
//

#import "ConcernAndFollowersViewController.h"
#import "PersonalInformationViewController.h"
@interface ConcernAndFollowersViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSString *strState;
@property (nonatomic, strong) UITableView *tableView;


@end

@implementation ConcernAndFollowersViewController

- (instancetype)initWithStrState:(NSString *)strState {
    self = [super init];
    if (self) {
        self.strState = strState;
    }
    return self;
}

#pragma mark - 生命周期
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([self.strState isEqualToString:@"0"]) {
        self.navigationItem.title = @"我的关注";
    }else {
        self.navigationItem.title = @"我的粉丝";
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self layoutConcernAndFollowersView];
}

- (void)layoutConcernAndFollowersView {
    [self.view addSubview:self.tableView];
}

// 列表行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

// 列表内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"identifierDiscoverTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = @"&开心快乐&";
    cell.textLabel.textColor = [UIColor colorWithRed:61.0/255.0 green:158.0/255.0 blue:134.0/255.0 alpha:1];
    cell.imageView.image = [UIImage imageNamed:@"icon_MyActivity"];
    cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;


    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.strState isEqualToString:@"0"]) {
        PersonalInformationViewController *vc = [[PersonalInformationViewController alloc]initWithStrModifyState:@"1"];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }else {
        PersonalInformationViewController *vc = [[PersonalInformationViewController alloc]initWithStrModifyState:@"2"];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];

    }

    
}
#pragma mark -懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc]init];
        _tableView.bounces = NO;
    }
    return _tableView;
}


@end
