//
//  DynamicPublishViewController.m
//  DsProject
//
//  Created by Cucumber on 16/2/1.
//  Copyright © 2016年 Cucumber. All rights reserved.
//

#import "DynamicPublishViewController.h"
#import "DynamicPublishCollectionViewCell.h"

#import <QuartzCore/QuartzCore.h>
#import <QuartzCore/CoreAnimation.h>
#import <MobileCoreServices/MobileCoreServices.h>


@interface DynamicPublishViewController ()<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIAlertViewDelegate, UITextViewDelegate>

@property (nonatomic, strong) UIImageView *imgViewTop;
@property (nonatomic, strong) UIImageView *imgViewHead;
@property (nonatomic, strong) UILabel *labelName;
@property (nonatomic, strong) UILabel *labelSex;
@property (nonatomic, strong) UILabel *labelAge;

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UIAlertController *alertController;
@property (nonatomic, strong) UIImageView *imgCellView;

@property (nonatomic, strong) UIImageView *imgTemp;

@property (nonatomic, strong) NSMutableArray *arrayData;
@property (nonatomic, strong) UICollectionReusableView *collectionReusableView;

@end

@implementation DynamicPublishViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"发布动态";
    
    // 导航栏左侧按钮
    UIButton *buttonRight = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonRight setFrame:CGRectMake(0, 0, 40, 40)];
    [buttonRight setTitle:@"发表" forState:UIControlStateNormal];
    [buttonRight addTarget:self action:@selector(publishAct) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:buttonRight];

    
    self.arrayData = [NSMutableArray array];
    self.arrayData = [NSMutableArray arrayWithObjects:
                             @"btn_addDynamic",nil];
    [self layoutDynamicPublishView];

    
}

- (void)layoutDynamicPublishView {
    
    

    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.imgViewTop];
    [self.imgViewTop addSubview:self.imgViewHead];
    [self.imgViewTop addSubview:self.labelAge];
    [self.imgViewTop addSubview:self.labelName];
    [self.imgViewTop addSubview:self.labelSex];
    
    [self.scrollView addSubview:self.collectionView];
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, self.collectionView.bottom);
    
}

#pragma mark - UICollectionView代理方法

// 页眉大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (collectionView == self.collectionView) {
        return CGSizeMake(SCREEN_WIDTH, 90);
    } else {
        return CGSizeZero;
    }
}

// 页脚大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeZero;
}

// 页面/页脚 显示内容
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if ([kind isEqual:UICollectionElementKindSectionHeader]) {

        self.collectionReusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"identifierDynamicPublishCollectionView" forIndexPath:indexPath];
        [self.collectionReusableView addSubview:self.textView];

        return self.collectionReusableView;
    }
    return nil;
}



//内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
    // 显示cell内容前，先将cell上的图层清空
    for (UIView *view in [cell.contentView subviews]) {
        [view removeFromSuperview];
    }
    self.imgCellView= [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, (SCREEN_WIDTH - 75)/4, (SCREEN_WIDTH - 75)/4)];

        NSLog(@"....%ld",(long)indexPath.row);
    
    if(indexPath.row == 0){
        self.imgCellView.image = [UIImage imageNamed:self.arrayData[indexPath.row]];
    }else{
        self.imgCellView.image = self.arrayData[indexPath.row];
    }
    [cell.contentView addSubview:self.imgCellView];

    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.arrayData.count;

}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0 && indexPath.row==0)
    {
        return CGSizeMake((SCREEN_WIDTH - 75)/4, (SCREEN_WIDTH - 75)/4);
    }
    else
    {
        return CGSizeMake((SCREEN_WIDTH - 75)/4, (SCREEN_WIDTH - 75)/4);
    }
}
// 设定全局的行间距，如果想要设定指定区内Cell的最小行距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    if(section==0)
    {
        return 10.0;
    }
    else
    {
        return 10.0;
    }
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if(section==0)
    {
        return UIEdgeInsetsMake(10, 20, 10, 10);
    }
    else
    {
        return UIEdgeInsetsMake(15, 15, 15, 15);
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if(section==0)
    {
        return 5;
    }
    else
    {
        return 5;
    }
}

// 当指定indexPath处的item被选择时触发
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (collectionView == self.collectionView) {
        if (indexPath.section == 0 && indexPath.row == 0) {
            NSLog(@"indexPath");
            [self presentViewController:self.alertController animated:YES completion:nil];
        }
    }
}

#pragma mark - 照片



// 判断设备是否有摄像头
- (BOOL)isCameraAvailable{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

// 前面的摄像头是否可用
- (BOOL)isFrontCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}


// 判断是否支持某种多媒体类型：拍照，视频
- (BOOL)cameraSupportsMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType {
    __block BOOL result = NO;
    
    if ([paramMediaType length] == 0) {
        NSLog(@"Media type is empty.");
        return NO;
    }
    
    NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    [availableMediaTypes enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL*stop) {
        NSString *mediaType = (NSString *)obj;
        if ([mediaType isEqualToString:paramMediaType]) {
            result = YES;
            *stop= YES;
        }
    }];
    return result;
}



// 相册是否可用
- (BOOL)isPhotoLibraryAvailable{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary];
}

// 是否可以在相册中选择视频
- (BOOL)canUserPickVideosFromPhotoLibrary{
    return [self cameraSupportsMedia:(NSString *)kUTTypeMovie sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}

// 是否可以在相册中选择图片
- (BOOL)canUserPickPhotosFromPhotoLibrary{
    return [self cameraSupportsMedia:(NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}

// 保存图片后到相册后，调用的相关方法，查看是否保存成功
- (void) imageWasSavedSuccessfully:(UIImage *)paramImage didFinishSavingWithError:(NSError *)paramError contextInfo:(void *)paramContextInfo{
    if (paramError == nil) {
        NSLog(@"Image was saved successfully.");
    } else {
        NSLog(@"An error happened while saving the image.");
        NSLog(@"Error = %@", paramError);
    }
}

// 当得到照片或者视频后，调用该方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSLog(@"Picker returned successfully.");
    NSLog(@"%@", info);
    
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    // 判断获取类型：图片
    if ([mediaType isEqualToString:( NSString *)kUTTypeImage]) {
        UIImage *theImage = nil;
        // 判断，图片是否允许修改
        if ([picker allowsEditing]){
            theImage = [info objectForKey:UIImagePickerControllerEditedImage]; //获取用户编辑之后的图像
        } else {
            theImage = [info objectForKey:UIImagePickerControllerOriginalImage]; // 照片的元数据参数
        }
        self.imgTemp.image = theImage;
        
//        [self didClickUploadButtonAction];
//        NSArray *array = @[theImage];
//        [self.arrayData addObjectsFromArray:[NSMutableArray arrayWithArray:[self.dictResponse objectForKey:@"data"]]]; // // 消息数组赋值
        [self.arrayData addObject:theImage];
        //        self.arrayData = [NSMutableArray arr];
        NSLog(@"=----%@",theImage);
        
        
        NSLog(@"=====%@",self.arrayData);
        self.collectionView.frame = CGRectMake(0, self.imgViewTop.bottom+10, SCREEN_WIDTH, 190+ (self.arrayData.count/5)*((SCREEN_WIDTH - 75)/4));
        self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, self.collectionView.bottom);

        [self.collectionView reloadData];
        
    }
    
    [picker dismissViewControllerAnimated:YES completion:^{}];
}
// 当用户取消时，调用该方法
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:^{}];
}

// 相册操作的按钮点击事件
- (void)getFromPhoto {
    if ([self isPhotoLibraryAvailable]) {
        UIImagePickerController *controller = [[UIImagePickerController alloc] init];
        [controller setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];// 设置类型
        [controller setAllowsEditing:YES];
        NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
        if ([self canUserPickPhotosFromPhotoLibrary]) {
            [mediaTypes addObject:(NSString *)kUTTypeImage];
        }
        if ([self canUserPickVideosFromPhotoLibrary]) {
            [mediaTypes addObject:(NSString *)kUTTypeMovie];
        }
        
        [controller setMediaTypes:mediaTypes];
        [controller setDelegate:self];// 设置代理
        [self presentViewController:controller animated:YES completion:^{}];
    }
}

#pragma mark - UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView {
    if (textView == self.textView) {
        if ([self.textView.text isEqualToString:@"写下你此刻的心情吧"]) {
            self.textView.text = @"";
        }
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if (textView == self.textView) {
        if (self.textView.text.length<1) {
            textView.text = @"写下你此刻的心情吧";
        }
        if ([self.textView.text isEqualToString:@"\n"]) {
            textView.text = @"写下你此刻的心情吧";
            
        }
    }
}


#pragma mark - 私有方法
- (void)publishAct {
    [self keyboardShouldReturn];

    NSString *strClear = [self.textView.text stringByReplacingOccurrencesOfString:@"\n" withString:@""]; // 去掉换行
    strClear = [strClear stringByReplacingOccurrencesOfString:@" " withString:@""]; // 去掉空格
    NSLog(@".........%@",strClear);

    if ([strClear isEqualToString:@"写下你此刻的心情吧"]||[self.textView.text isEqualToString:@""]||self.textView.text == nil) {
        [self showHint:@"未作修改不可发表"];
        return;
    }else {
        [self showHint:@"保存成功"];
        [self.navigationController popViewControllerAnimated:YES];
    }
}
#pragma mark - 懒加载

- (UIImageView *)imgViewTop {
    if (!_imgViewTop) {
        _imgViewTop = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 115)];
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

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
        _scrollView.backgroundColor = [UIColor colorWithRed:243.0/255.0 green:244.0/255.0 blue:248.0/255.0 alpha:1];
    }
    return _scrollView;
}
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, self.imgViewTop.bottom+10, SCREEN_WIDTH, 190) collectionViewLayout:flowLayout];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"myCell"];

        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"identifierDynamicPublishCollectionView"];
        _collectionView.bounces = NO;
    }
    return _collectionView;
}

- (UIAlertController *)alertController {
    if (!_alertController) {
        _alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *photoAlertAction = [UIAlertAction actionWithTitle:@"从相册中获取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self getFromPhoto];
        }];
        
        UIAlertAction *cancelAlertAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:nil];
        
        [_alertController addAction:photoAlertAction];
        [_alertController addAction:cancelAlertAction];
        
    }
    return _alertController;
}

- (NSMutableArray *)arrayData {
    if (!_arrayData) {
        _arrayData = [NSMutableArray array];
    }
    return _arrayData;
}

- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc]initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH - 20, 90)];
        _textView.text = @"写下你此刻的心情吧";
        _textView.delegate = self;
        _textView.font = [UIFont systemFontOfSize:16.0f];

        
    }
    return _textView;
}
@end
