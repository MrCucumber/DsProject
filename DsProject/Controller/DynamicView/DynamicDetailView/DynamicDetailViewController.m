//
//  DynamicDetailViewController.m
//  DsProject
//
//  Created by Cucumber on 16/1/28.
//  Copyright © 2016年 Cucumber. All rights reserved.
//

#import "DynamicDetailViewController.h"
#import "DynamicDetailTableViewCell.h"

@interface DynamicDetailViewController ()<UITableViewDataSource, UITableViewDelegate>


@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *viewTop;

@property (nonatomic, strong) UIImageView *imgHead;
@property (nonatomic, strong) UILabel *labelName;
@property (nonatomic, strong) UIButton *buttonFollow;
@property (nonatomic, strong) UILabel *labelHotTitle;
@property (nonatomic, strong) UILabel *labelHotNum;
@property (nonatomic, strong) UILabel *labelTime;

@property (nonatomic, strong) UITextView *textViewDynamicDetail;

@property (nonatomic, strong) UIImageView *imageViewPicture;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UITextField *textfieldComment;


@end

@implementation DynamicDetailViewController

#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"动态详情";
    [self layoutDynamicDetailView];
    
}
- (void)layoutDynamicDetailView {
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.viewTop];
    [self.viewTop addSubview:self.imgHead];
    [self.viewTop addSubview:self.labelName];
    [self.viewTop addSubview:self.buttonFollow];
    
    [self.viewTop addSubview:self.labelHotTitle];
    [self.viewTop addSubview:self.labelHotNum];
    [self.viewTop addSubview:self.labelTime];
    [self.viewTop addSubview:self.textViewDynamicDetail];
    
    for (int i = 0; i < 9; i++) {

        //计算出来行数和列数
        int row =i/3;
        
        //列
        int cloumn =i%3;
        
        
        //设置按钮的宽高
        float buttonWidth = (SCREEN_WIDTH - 50)/3,buttonHeight=(SCREEN_WIDTH - 50)/3;
        
        //设置横向的间隔 5为按钮数  6为间隔数
        float cloumnInterval = 10;
        //设置纵向的间隔
        float rowInterval =10;
        
        self.imageViewPicture = [[UIImageView alloc]initWithFrame:CGRectMake(15+cloumn*(cloumnInterval+buttonWidth), self.textViewDynamicDetail.bottom+row*(rowInterval+buttonHeight), buttonWidth, buttonHeight)];
        self.imageViewPicture.backgroundColor = [UIColor redColor];
        [self.viewTop addSubview:self.imageViewPicture];
        
        self.viewTop.frame = CGRectMake(0, 0, SCREEN_WIDTH, 150 + (row + 1)*(rowInterval+buttonHeight));
    }
    [self.scrollView addSubview:self.tableView];
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, self.tableView.bottom);
}

#pragma mark - UITableViewDelegate && UITableViewDataSource

// 列表行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

// 列表高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

// 列表头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 32;
}

// 列表尾高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return 65;
    } else {
        return 0;
    }
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        UIView *viewForHeader = [[UIView alloc]init];
        viewForHeader.backgroundColor = [UIColor whiteColor];
        
        UIImageView *imgComment = [[UIImageView alloc]initWithFrame:CGRectMake(13, 7, 15, 17)];
        imgComment.image = [UIImage imageNamed:@"icon_comment"];
        [viewForHeader addSubview:imgComment];
        
        UILabel *labelComment = [[UILabel alloc]initWithFrame:CGRectMake(imgComment.right + 6, 7, 35, 20)];
        labelComment.text = @"评价";
        labelComment.font=[UIFont systemFontOfSize:15.0f];
        [viewForHeader addSubview:labelComment];
        
        UILabel *labelCommentNum = [[UILabel alloc]initWithFrame:CGRectMake(labelComment.right, 7, 55, 20)];
        labelCommentNum.text = @"(12)";
        labelCommentNum.font = [UIFont systemFontOfSize:14.0f];
        labelCommentNum.textColor = [UIColor grayColor];
        [viewForHeader addSubview:labelCommentNum];
        
        UIView *viewLayer = [[UIView alloc]initWithFrame:CGRectMake(10, 31, SCREEN_WIDTH - 10, 0.5)];
        viewLayer.backgroundColor = [UIColor grayColor];
        [viewForHeader addSubview:viewLayer];
        
        return viewForHeader;
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 0) {
        UIView *viewFooter = [[UIView alloc]init];
        viewFooter.backgroundColor = [UIColor whiteColor];
        
        UIView *viewComment = [[UIView alloc]initWithFrame:CGRectMake(15, 13, SCREEN_WIDTH - 30, 34)];
        viewComment.layer.borderWidth = 0.5;
        viewComment.layer.borderColor = [UIColor grayColor].CGColor;
        [viewComment.layer setCornerRadius:3];
        [viewFooter addSubview:viewComment];
        
        UIImageView *imgWrite = [[UIImageView alloc]initWithFrame:CGRectMake(11, 10, 17, 14)];
        imgWrite.image = [UIImage imageNamed:@"icon_DynamicDetailWrite"];
        [viewComment addSubview:imgWrite];
        
        self.textfieldComment = [[UITextField alloc]initWithFrame:CGRectMake(imgWrite.right + 5, 0, viewComment.width - 11 - 5 - imgWrite.width - 45, 34)];
        self.textfieldComment.placeholder = @"我要评论";
        [viewComment addSubview:self.textfieldComment];
        
        UIButton *buttonSend = [UIButton buttonWithType:UIButtonTypeCustom];
        buttonSend.frame = CGRectMake(viewComment.width - 45, 5, 40, 25);
        buttonSend.backgroundColor = [UIColor colorWithRed:27.0/255.0 green:169.0/255.0 blue:143.0/255.0 alpha:1];
        buttonSend.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [buttonSend setTitle:@"发送" forState:UIControlStateNormal];
        [buttonSend setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [buttonSend.layer setCornerRadius:3];
        [viewComment addSubview:buttonSend];
        
        
        
        return viewFooter;
    }
    return nil;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"identifierDiscoverTableViewCell";
    DynamicDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[DynamicDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    
    //    [cell.imgViewDiscover sd_setImageWithURL:[NSURL URLWithString:[[self.arrayData objectAtIndex:indexPath.row] objectForKey:@"ImageUrl"]]];
    
    return cell;
}

#pragma mark -懒加载
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
        _viewTop = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
        _viewTop.backgroundColor = [UIColor whiteColor];
    }
    return _viewTop;
}

- (UIImageView *)imgHead {
    if (!_imgHead) {
        _imgHead = [[UIImageView alloc]initWithFrame:CGRectMake(14, 11, 28, 28)];
        _imgHead.backgroundColor = [UIColor redColor];
        [_imgHead.layer setCornerRadius:14];
    }
    return _imgHead;
}

- (UILabel *)labelName {
    if (!_labelName) {
        _labelName = [[UILabel alloc]initWithFrame:CGRectMake(self.imgHead.right+7, 15, 100, 20)];
        _labelName.text = @"&开心快乐&";
    }
    return _labelName;
}

- (UIButton *)buttonFollow {
    if (!_buttonFollow) {
        _buttonFollow = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonFollow.frame = CGRectMake(self.labelName.right + 6, 15, 40, 20);
        _buttonFollow.backgroundColor = [UIColor colorWithRed:27.0/255.0 green:169.0/255.0 blue:143.0/255.0 alpha:1];
        _buttonFollow.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [_buttonFollow setTitle:@"关注" forState:UIControlStateNormal];
        [_buttonFollow setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_buttonFollow.layer setCornerRadius:3];
        
    }
    return _buttonFollow;
}

- (UILabel *)labelHotTitle {
    if (!_labelHotTitle) {
        _labelHotTitle = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 80, 8, 30, 20)];
        _labelHotTitle.text = @"热度";
        _labelHotTitle.font = [UIFont systemFontOfSize:12.0f];
    }
    return _labelHotTitle;
}

- (UILabel *)labelHotNum {
    if (!_labelHotNum) {
        _labelHotNum = [[UILabel alloc]initWithFrame:CGRectMake(self.labelHotTitle.right, 8, 45, 20)];
        _labelHotNum.text = @"9999+";
        _labelHotNum.textColor = [UIColor colorWithRed:248.0/255.0 green:196.0/255.0 blue:83.0/255.0 alpha:1];
        _labelHotNum.font = [UIFont systemFontOfSize:13.0f];
        _labelHotNum.textAlignment = NSTextAlignmentCenter;
    }
    return _labelHotNum;
}

- (UILabel *)labelTime {
    if (!_labelTime) {
        _labelTime = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 130, self.labelHotTitle.bottom, 110, 20)];
        _labelTime.text = @"2015-12-23 10:50";
        _labelTime.font = [UIFont systemFontOfSize:13.0f];
        _labelTime.textColor = [UIColor lightGrayColor];
    }
    return _labelTime;
}

- (UITextView *)textViewDynamicDetail {
    if (!_textViewDynamicDetail) {
        _textViewDynamicDetail = [[UITextView alloc]initWithFrame:CGRectMake(16, self.labelName.bottom + 14, SCREEN_WIDTH - 32, 90)];
        _textViewDynamicDetail.text = @"        上体微向前倾，两腿微弯，同时左脚利用右脚掌的灯里跃出约85里面，前脚掌先着地，身体重心前移，右脚照此法动作；上体保持正直，两臂前后自然摆动，向前败笔是大臂略直";
        _textViewDynamicDetail.font = [UIFont systemFontOfSize:15.0f];
    }
    return _textViewDynamicDetail;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.viewTop.bottom + 17 , SCREEN_WIDTH, 90 * 4 + 32 +65)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = NO;
    }
    return _tableView;
}


@end
