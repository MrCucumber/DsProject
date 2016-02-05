//
//  PushSetUpViewController.m
//  DsProject
//
//  Created by Cucumber on 16/2/4.
//  Copyright © 2016年 Cucumber. All rights reserved.
//

#import "PushSetUpViewController.h"
#import "PushSetUpTableViewCell.h"

@interface PushSetUpViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation PushSetUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"推送设置";
    [self layoutPushSetUpView];
}

- (void)layoutPushSetUpView {
    UIView *viewBottom = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
    viewBottom.backgroundColor = [UIColor colorWithRed:247.0/255.0 green:247.0/255.0 blue:247.0/255.0 alpha:1];
    [self.view addSubview:viewBottom];
    [viewBottom addSubview:self.tableView];
}
#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

// 列表行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }else if (section == 1) {
        return 2;
    }else {
        return 0;
    }
}

// 列表头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 20;
    }else if(section == 1) {
        return 20;
    }else {
        return 0;
    }
}
// 列表内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        static NSString *identifier = @"PersonViewMiddle";
        
        PushSetUpTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[PushSetUpTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
//        cell.imageView.image = [UIImage imageNamed:@[@"icon_MyCollect", @"icon_MyActivity"][indexPath.row]];
        cell.labelText.text = @[@"评价与@", @"关注",@"粉丝"][indexPath.row];
        cell.selectionStyle = NO; // 关闭单行选择效果

        
        
        return cell;
    } else if (indexPath.section == 1) {
        static NSString *identifier = @"MyTableViewBottom";
        
        PushSetUpTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[PushSetUpTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        
        
//        cell.imageView.image = [UIImage imageNamed:@[@"icon_PersonalInformation", @"icon_SettingUp", @"icon_Share", @"icon_About"][indexPath.row]];
        cell.labelText.text = @[@"每日提醒", @"活动提醒"][indexPath.row];
        cell.selectionStyle = NO; // 关闭单行选择效果

        
        return cell;
    }else {
        return nil;
    }
    return nil;
}

#pragma mark － 懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 5 * 44 + 40) ];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc]init];
//        _tableView.tableFooterView.backgroundColor = [UIColor grayColor];
        _tableView.bounces = NO;

    }
    return _tableView;
}


@end
