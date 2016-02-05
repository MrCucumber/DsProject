//
//  PersonalViewController.m
//  DsProject
//
//  Created by 黄哲俊 on 15/12/15.
//  Copyright © 2015年 own. All rights reserved.
//

#import "PersonalViewController.h"
#import "PersonalButton.h"
#import "MyCollectViewController.h"
#import "MyActivityViewController.h"
#import "PersonalInformationViewController.h"
#import "AboutUsViewController.h"
#import "MyDynamicViewController.h"
#import "ConcernAndFollowersViewController.h"
#import "PushSetUpViewController.h"
//#import "PersonTableViewCell.h"

@interface PersonalViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIImageView *imgViewTop;
@property (nonatomic, strong) UIImageView *imgViewHead;
@property (nonatomic, strong) UILabel *labelName;
@property (nonatomic, strong) UILabel *labelSex;
@property (nonatomic, strong) UILabel *labelAge;

@property (nonatomic, strong) UIView *viewBtn;
@property (nonatomic, strong) PersonalButton *buttonDynamic;
@property (nonatomic, strong) PersonalButton *buttonConcern;
@property (nonatomic, strong) PersonalButton *buttonFollowers;

@property (nonatomic, strong) UIButton *buttonQuite;
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *arrayData;           // 接收数据数组





@end

@implementation PersonalViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"个人";


    [self layoutView];
}

- (void)layoutView {
    
    [self.view addSubview:self.scrollView];
    
    [self.scrollView addSubview:self.imgViewTop];// 顶部试图
    [self setupTopView]; // 设置顶部视图
    
    [self.scrollView addSubview:self.viewBtn]; // 按钮view
    [self setupBtnView]; // 设置按钮view
    
    [self.scrollView addSubview:self.tableView];
    

}

// 设置顶部试图
- (void)setupTopView {
    // 头像
    self.imgViewHead = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
    self.imgViewHead.backgroundColor = [UIColor grayColor];
    self.imgViewHead.frame = CGRectMake(32, 38, 40, 40);
    [self.imgViewHead.layer setCornerRadius:20];
    [self.imgViewTop addSubview:self.imgViewHead];
    
    self.labelName = [[UILabel alloc]initWithFrame:CGRectMake(self.imgViewHead.right + 13, 41, 80, 20)];
    self.labelName.text = @"快乐天使";
    self.labelName.font = [UIFont systemFontOfSize:16.0f];
    self.labelName.textColor = [UIColor whiteColor];
    [self.imgViewTop addSubview:self.labelName];
    
    // label 性别
    self.labelSex = [[UILabel alloc]initWithFrame:CGRectMake(self.imgViewHead.right + 13, self.labelName.bottom, 20, 20)];
    self.labelSex.text = @"女";
    self.labelSex.font = [UIFont systemFontOfSize:14.0f];
    self.labelSex.textColor = [UIColor whiteColor];
    [self.imgViewTop addSubview:self.labelSex];
    
    // label 年龄
    self.labelAge = [[UILabel alloc]initWithFrame:CGRectMake(self.labelSex.right, self.labelName.bottom, 50, 20)];
    self.labelAge.text = @"85后";
    self.labelAge.font = [UIFont systemFontOfSize:14.0f];
    self.labelAge.textColor = [UIColor whiteColor];
    [self.imgViewTop addSubview:self.labelAge];

}

- (void)setupBtnView {
    
    self.buttonDynamic = [[PersonalButton alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/3- 1, 60) title:@"动态" imageName:@"icon_Dynamic" message:@"504"];
    [self.buttonDynamic loginButtonDidClicked:^(PersonalButton *sender) {
        //
        NSLog(@"boom");
        MyDynamicViewController *vc = [[MyDynamicViewController alloc]init];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }];
    [self.viewBtn addSubview:self.buttonDynamic];
    
    self.buttonConcern = [[PersonalButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3, 0, SCREEN_WIDTH/3- 1, 60) title:@"关注" imageName:@"icon_Concern" message:@"12"];
    [self.buttonConcern loginButtonDidClicked:^(PersonalButton *sender) {
        //
        NSLog(@"shaka");
        ConcernAndFollowersViewController *vc = [[ConcernAndFollowersViewController alloc]initWithStrState:@"0"];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        self.hidesBottomBarWhenPushed = NO;

    }];
    [self.viewBtn addSubview:self.buttonConcern];
    
    self.buttonFollowers = [[PersonalButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3*2, 0, SCREEN_WIDTH/3 - 1, 60) title:@"粉丝" imageName:@"icon_Followers" message:@"486"];
    [self.buttonFollowers loginButtonDidClicked:^(PersonalButton *sender) {
        //
        ConcernAndFollowersViewController *vc = [[ConcernAndFollowersViewController alloc]initWithStrState:@"1"];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        self.hidesBottomBarWhenPushed = NO;

        NSLog(@"laka");
    }];
    [self.viewBtn addSubview:self.buttonFollowers];
    

    
}

#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

// 列表行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }else if (section == 1) {
        return 4;
    }else if (section == 2) {
        return 1;
    }else {
        return 0;
    }
}

// 列表头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 20;
    }else {
        return 20;
    }
}
// 列表内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        static NSString *identifier = @"PersonViewMiddle";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.imageView.image = [UIImage imageNamed:@[@"icon_MyCollect", @"icon_MyActivity"][indexPath.row]];
        cell.textLabel.text = @[@"我的收藏", @"我的活动"][indexPath.row];

        
        return cell;
    } else if (indexPath.section == 1) {
        static NSString *identifier = @"MyTableViewBottom";
    
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[UITableViewCell
                     alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        
        
        cell.imageView.image = [UIImage imageNamed:@[@"icon_PersonalInformation", @"icon_SettingUp", @"icon_Share", @"icon_About"][indexPath.row]];
        cell.textLabel.text = @[@"个人资料", @"推送设置", @"分享应用", @"关于动境"][indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头

        return cell;
    }else if (indexPath.section == 2) {
        static NSString *identifier = @"MyTableViewQuite";

        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }

        self.buttonQuite = [UIButton buttonWithType:UIButtonTypeCustom];
        self.buttonQuite.frame = CGRectMake(0, 0, SCREEN_WIDTH, 44);
        self.buttonQuite.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        [self.buttonQuite setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.buttonQuite setTitle:@"退出登录" forState:UIControlStateNormal];
        [self.buttonQuite addTarget:self action:@selector(quiteAct) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:self.buttonQuite];
        self.scrollView.contentSize = CGSizeMake(0, self.tableView.bottom);

        return cell;
    }else {
        return nil;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section ==0) {
        switch (indexPath.row) {
            case 0:
            {
                MyCollectViewController *myCollectionVC = [[MyCollectViewController alloc] init];
                self.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:myCollectionVC animated:YES];
                self.hidesBottomBarWhenPushed = NO;
            }
                break;
            case 1:
            {
                MyActivityViewController *myCollectionVC = [[MyActivityViewController alloc] init];
                self.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:myCollectionVC animated:YES];
                self.hidesBottomBarWhenPushed = NO;
            }
                break;
                
            default:
                break;
        }
    }else if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
            {
                
                PersonalInformationViewController *myCollectionVC = [[PersonalInformationViewController alloc] initWithStrModifyState:@"0"];
                self.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:myCollectionVC animated:YES];
                self.hidesBottomBarWhenPushed = NO;

            }
                break;
            case 1:
            {
                PushSetUpViewController *vc = [[PushSetUpViewController alloc]init];
                self.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
                self.hidesBottomBarWhenPushed = NO;
            }
                break;

            case 2:
            {
                
            }
                break;
            case 3:
            {
                
                AboutUsViewController *myCollectionVC = [[AboutUsViewController alloc] init];
                self.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:myCollectionVC animated:YES];
                self.hidesBottomBarWhenPushed = NO;
                
            }
                break;

                
            default:
                break;
        }
    }
}

#pragma mark - 似有方法
// 退出按钮
- (void)quiteAct {
    NSLog(@"123木头人");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"kNotificationLoginStateChanged" object:@NO];
}


#pragma mark - 懒加载

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, self.view.frame.size.height- 49 - 64)];
        _scrollView.backgroundColor = [UIColor colorWithRed:243.0/255.0 green:244.0/255.0 blue:248.0/255.0 alpha:1];
        _scrollView.bounces = NO;
    }
    return _scrollView;
}

- (UIImageView *)imgViewTop {
    if (!_imgViewTop) {
        _imgViewTop  =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
        _imgViewTop.backgroundColor = [UIColor orangeColor];
        _imgViewTop.frame = CGRectMake(0, 0, self.view.frame.size.width,115);
        _imgViewTop.userInteractionEnabled = YES;
    }
    return _imgViewTop;
}

- (UIView *)viewBtn {
    if (!_viewBtn) {
        _viewBtn = [[UIView alloc]initWithFrame:CGRectMake(0, self.imgViewTop.bottom, SCREEN_WIDTH, 60)];
//        _viewBtn.backgroundColor = [UIColor colorWithRed:57.0/255.0 green:63.0/255.0 blue:78.0/255.0 alpha:1];
        _viewBtn.backgroundColor = [UIColor colorWithRed:63.0/255.0 green:71.0/255.0 blue:85.0/255.0 alpha:1];

    }
    return _viewBtn;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.viewBtn.bottom, SCREEN_WIDTH, 44 * 7 + 60) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc]init];
        _tableView.bounces = NO;
    }
    return _tableView;
}

- (NSArray *)arrayData {
    if (!_arrayData) {
        _arrayData = [NSArray array];
    }
    return _arrayData;
}



@end
