//
//  MyActivityViewController.m
//  DsProject
//
//  Created by Cucumber on 16/1/31.
//  Copyright © 2016年 Cucumber. All rights reserved.
//

#import "MyActivityViewController.h"
#import "ActivityListTableViewCell.h"
#import "ActivityDetailViewController.h"

@interface MyActivityViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIImageView *imgViewTop;
@property (nonatomic, strong) UIImageView *imgViewHead;
@property (nonatomic, strong) UILabel *labelName;
@property (nonatomic, strong) UILabel *labelSex;
@property (nonatomic, strong) UILabel *labelAge;

@property (nonatomic, strong) UIView *viewButton;
@property (nonatomic, strong) UIButton *buttonPublish;
@property (nonatomic, strong) UIButton *buttonJoin;
@property (nonatomic, strong) UIButton *buttonWait;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MyActivityViewController

#pragma mark － 生命周期
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.buttonPublish.selected = YES;
    self.buttonJoin.backgroundColor = [UIColor colorWithRed:91.0/255.0 green:99.0/255.0 blue:120.0/255.0 alpha:1];
    self.buttonWait.backgroundColor = [UIColor colorWithRed:91.0/255.0 green:99.0/255.0 blue:120.0/255.0 alpha:1];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的活动";
    [self layoutMyActivityView];
}

- (void)layoutMyActivityView {
    
    [self.view addSubview:self.imgViewTop];
    [self.imgViewTop addSubview:self.imgViewHead];
    [self.imgViewTop addSubview:self.labelAge];
    [self.imgViewTop addSubview:self.labelName];
    [self.imgViewTop addSubview:self.labelSex];
    
    [self.view addSubview:self.viewButton];
    [self.viewButton addSubview:self.buttonPublish];
    [self.viewButton addSubview:self.buttonJoin];
    [self.viewButton addSubview:self.buttonWait];

    
    [self.view addSubview:self.tableView];

}
// 列表头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

// 列表行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

// 列表高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 83;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"identifierDiscoverTableViewCell";
    ActivityListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[ActivityListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //    [cell.imgViewDiscover sd_setImageWithURL:[NSURL URLWithString:[[self.arrayData objectAtIndex:indexPath.row] objectForKey:@"ImageUrl"]]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ActivityDetailViewController *vc = [[ActivityDetailViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}
#pragma mark － 私有方法
- (void)buttonPublishAct {
    
    self.buttonPublish.selected = YES;
    self.buttonJoin.selected = NO;
    self.buttonWait.selected = NO;
    self.buttonPublish.backgroundColor = [UIColor colorWithRed:57.0/255.0 green:63.0/255.0 blue:79.0/255.0 alpha:1];
    self.buttonJoin.backgroundColor = [UIColor colorWithRed:91.0/255.0 green:99.0/255.0 blue:120.0/255.0 alpha:1];
    self.buttonWait.backgroundColor = [UIColor colorWithRed:91.0/255.0 green:99.0/255.0 blue:120.0/255.0 alpha:1];

}

- (void)buttonJoinAct {
    self.buttonPublish.selected = NO;
    self.buttonJoin.selected = YES;
    self.buttonWait.selected = NO;
    self.buttonJoin.backgroundColor = [UIColor colorWithRed:57.0/255.0 green:63.0/255.0 blue:79.0/255.0 alpha:1];
    self.buttonPublish.backgroundColor = [UIColor colorWithRed:91.0/255.0 green:99.0/255.0 blue:120.0/255.0 alpha:1];
    self.buttonWait.backgroundColor = [UIColor colorWithRed:91.0/255.0 green:99.0/255.0 blue:120.0/255.0 alpha:1];

}

- (void)buttonWaitAct {
    
    self.buttonPublish.selected = NO;
    self.buttonJoin.selected = NO;
    self.buttonWait.selected = YES;
    self.buttonWait.backgroundColor = [UIColor colorWithRed:57.0/255.0 green:63.0/255.0 blue:79.0/255.0 alpha:1];
    self.buttonPublish.backgroundColor = [UIColor colorWithRed:91.0/255.0 green:99.0/255.0 blue:120.0/255.0 alpha:1];
    self.buttonJoin.backgroundColor = [UIColor colorWithRed:91.0/255.0 green:99.0/255.0 blue:120.0/255.0 alpha:1];

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


- (UIView *)viewButton {
    if (!_viewButton) {
        _viewButton = [[UIView alloc]initWithFrame:CGRectMake(0, self.imgViewTop.bottom, SCREEN_WIDTH, 44)];
        _viewButton.backgroundColor = [UIColor colorWithRed:57.0/255.0 green:63.0/255.0 blue:79.0/255.0 alpha:1];

    }
    return _viewButton;
}

- (UIButton *)buttonPublish {
    if (!_buttonPublish) {
        _buttonPublish = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonPublish.frame = CGRectMake(0, 0, SCREEN_WIDTH/3 - 1, 44);
        [_buttonPublish setTitle:@"我发布的" forState:UIControlStateNormal];
        [_buttonPublish setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_buttonPublish addTarget:self action:@selector(buttonPublishAct) forControlEvents:UIControlEventTouchUpInside];
        [_buttonPublish setTitleColor:[UIColor colorWithRed:156.0/255.0 green:164.0/255.0 blue:180.0/255.0 alpha:1] forState:UIControlStateSelected];
    }
    return _buttonPublish;
}
- (UIButton *)buttonJoin {
    if (!_buttonJoin) {
        _buttonJoin = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonJoin.frame = CGRectMake(SCREEN_WIDTH/3, 0, SCREEN_WIDTH/3 , 44);
        [_buttonJoin setTitle:@"我参与的" forState:UIControlStateNormal];
        [_buttonJoin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_buttonJoin addTarget:self action:@selector(buttonJoinAct) forControlEvents:UIControlEventTouchUpInside];
        [_buttonJoin setTitleColor:[UIColor colorWithRed:156.0/255.0 green:164.0/255.0 blue:180.0/255.0 alpha:1] forState:UIControlStateSelected];
    }
    return _buttonJoin;
}
- (UIButton *)buttonWait {
    if (!_buttonWait) {
        _buttonWait = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonWait.frame = CGRectMake(SCREEN_WIDTH/3 * 2 + 1, 0, SCREEN_WIDTH/3, 44);
        [_buttonWait setTitle:@"待确认的" forState:UIControlStateNormal];
        [_buttonWait setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_buttonWait addTarget:self action:@selector(buttonWaitAct) forControlEvents:UIControlEventTouchUpInside];
        [_buttonWait setTitleColor:[UIColor colorWithRed:156.0/255.0 green:164.0/255.0 blue:180.0/255.0 alpha:1] forState:UIControlStateSelected];
    }
    return _buttonWait;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.viewButton.bottom, SCREEN_WIDTH, SCREEN_HEIGHT -self.imgViewTop.height - 64 - self.viewButton.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    return _tableView;
}





@end
