//
//  NoLoginLeadViewController.m
//  DsProject
//
//  Created by 黄哲俊 on 15/12/8.
//  Copyright © 2015年 own. All rights reserved.
//

#import "NoLoginLeadViewController.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"

@interface NoLoginLeadViewController ()
@property (nonatomic, strong)UIScrollView *scrollview;      //  scrollview
@property (nonatomic, strong)UIButton *buttonLogin;         //  按钮登陆
@property (nonatomic, strong)UIButton *buttonRegister;      //  按钮注册
@property (nonatomic, strong)UIPageControl *pageControl;    //  分页符



@end

@implementation NoLoginLeadViewController

#pragma mark - 生命周期

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"三联画12321";
    [self createLeadView];// 够贱一个未登录引导页面
}
// 够贱一个未登录引导页面
- (void)createLeadView {
    
    [self.view addSubview:self.scrollview];
    [self.view addSubview:self.buttonLogin];
    [self.view addSubview:self.buttonRegister];
    
    
    for (int i = 0; i<3; i++) {
        //设置滑动图片
        UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        NSString *name =[NSString stringWithFormat:@"00%d.jpg",i];
        imageView.contentMode = UIViewContentModeScaleAspectFit
        ;
        imageView.image =[UIImage imageNamed:name];
        [self.scrollview addSubview:imageView];
    }
    
    UIImageView *imageLogo = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH/2 - 50), 121 , 100, 150)];
    imageLogo.image = [UIImage imageNamed:@"icon_log"];
    [self.scrollview addSubview:imageLogo];
    
    self.scrollview.pagingEnabled =YES;
    self.scrollview.showsHorizontalScrollIndicator =NO;
    self.scrollview.showsVerticalScrollIndicator =NO;
    self.scrollview.contentSize =CGSizeMake(SCREEN_WIDTH*3, 0);
//    self.scrollview.delegate =self;
    
    //3.创建分页符
    self.pageControl =[[UIPageControl alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-48 - 40, SCREEN_WIDTH, 40)];
    //设置点数
    self.pageControl.numberOfPages =3;
    
    //设置从第一个点开始
    self.pageControl.currentPage =0;

    //设置当前选中的点的颜色  默认为白色
//    self.pageControl.currentPageIndicatorTintColor =[UIColor redColor];
    //设置除了选中的点外其他的点的颜色
//    self.pageControl.pageIndicatorTintColor =[UIColor blueColor];
    [self.pageControl addTarget:self action:@selector(pageClick:) forControlEvents:UIControlEventValueChanged];
    //添加到大的滑动试图
    [self.view addSubview:self.pageControl];
}

// 轮播图片滑动scrollview
-(UIScrollView *)scrollview {
    if (!_scrollview) {
        _scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-48)];
    }
    return _scrollview;
}


#pragma mark - 私有方法

-(void)pageClick:(UIPageControl *)page
{
    [self.scrollview setContentOffset:CGPointMake(page.currentPage*SCREEN_WIDTH, 0)];
}

// 跳转到登录页面
- (void)pushLoginViewAct {
    
    LoginViewController *vc = [[LoginViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];

}

// 跳转到注册页面
- (void)pushRegisterViewAct {
    
    RegisterViewController *vc = [[RegisterViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];

}

#pragma mark - 懒加载
-(UIButton *)buttonLogin {
    if (!_buttonLogin) {
        _buttonLogin = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonLogin.frame = CGRectMake(0, SCREEN_HEIGHT-48, SCREEN_WIDTH/2-0.5, 48);
        _buttonLogin.backgroundColor = [UIColor colorWithRed:57.0/255.0 green:63.0/255.0 blue:79.0/255.0 alpha:1];
        [_buttonLogin setTitle:@"登  录" forState:UIControlStateNormal];
        [_buttonLogin addTarget:self action:@selector(pushLoginViewAct) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonLogin;
}

-(UIButton *)buttonRegister {
    if (!_buttonRegister) {
        _buttonRegister = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonRegister.frame = CGRectMake(SCREEN_WIDTH/2+0.5, SCREEN_HEIGHT-48, SCREEN_WIDTH/2-0.5, 48);
        _buttonRegister.backgroundColor = [UIColor colorWithRed:57.0/255.0 green:63.0/255.0 blue:79.0/255.0 alpha:1];
        [_buttonRegister setTitle:@"注  册" forState:UIControlStateNormal];
        [_buttonRegister addTarget:self action:@selector(pushRegisterViewAct) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonRegister;
}

@end
