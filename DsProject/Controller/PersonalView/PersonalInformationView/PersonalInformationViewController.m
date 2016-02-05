//
//  PersonalInformationViewController.m
//  DsProject
//
//  Created by Cucumber on 16/1/31.
//  Copyright © 2016年 Cucumber. All rights reserved.
//

#import "PersonalInformationViewController.h"
#import "ModifyInformationViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <QuartzCore/CoreAnimation.h>
#import <MobileCoreServices/MobileCoreServices.h>


@interface PersonalInformationViewController ()<UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIAlertViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIAlertController *alertController;

@property (nonatomic, strong) NSString *strModifyState;

/**
 *  头像
 */

@property (nonatomic, strong) UIImageView *userHeaderImageView;


@end

@implementation PersonalInformationViewController

- (instancetype)initWithStrModifyState:(NSString *)strState {
    self = [super init];
    if (self) {
        self.strModifyState = strState;// 0 个人资料 可修改，1 关注 不可修改 有备注  2粉丝 不可修改 无备注
    }
    return self;
}


#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"个人资料";
    self.userHeaderImageView = [[UIImageView alloc]initWithFrame:CGRectMake(-35, -10, 40, 40)];
    [self layoutPersonalInformationView];
}
- (void)layoutPersonalInformationView {
 
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.tableView];
}
#pragma mark - UITableView 代理方法

// 列表行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5; // 返回5行
}

// 列表行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) { // 首行高度
        return 60; // 返回高度为60
    } else { // 其他行高度
        return 44;
    }
}

// 列表内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"identifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    // 列表标题
    cell.textLabel.text = @[@"头像", @"昵称", @"性别", @"出生年月", @"签名"][indexPath.row];
    // 向右箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.detailTextLabel.text = @"临时数据";


    switch (indexPath.row) {
        case 0: { // 头像
            cell.detailTextLabel.text = @" ";
//            [self.userHeaderImageView sd_setImageWithURL:[NSURL URLWithString:[self.dictData objectForKey:@"img"]]];
            self.userHeaderImageView.backgroundColor = [UIColor grayColor];
            self.userHeaderImageView.layer.cornerRadius = self.userHeaderImageView.frame.size.height/2;
            self.userHeaderImageView.clipsToBounds = YES;
            [cell.detailTextLabel addSubview:self.userHeaderImageView];

        }
            break;
            
        case 1: { // 昵称
            cell.detailTextLabel.text = @"&开心快乐&";
        }
            break;
            
        case 2: { // 性别
            cell.detailTextLabel.text = @"女";
        }
            break;
            
        case 3: { // 出生年月
//            cell.detailTextLabel.text = [self.dictData objectForKey:@"phone"];
        }
            break;
            
        case 4: { // 签名
//            cell.detailTextLabel.text = [self.dictData objectForKey:@"adress"];
        }
            break;
            
        default:
            break;
    }
    
    return cell;
}
// 列表点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0: { // 头像
            if ([self.strModifyState isEqualToString:@"0"]) {
                [self presentViewController:self.alertController animated:YES completion:nil];
            }else {
                return;
            }
                }
            break;
            
        case 1: { // 昵称
            if ([self.strModifyState isEqualToString:@"0"]) {
                ModifyInformationViewController *vc = [[ModifyInformationViewController alloc]init];
                self.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }else {
                    return;
            }

                }
            break;
            
        case 2: { // 性别
//            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"请输入姓名" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"好", nil];
//            alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
//            alertView.tag = 102;
//            
//            UITextField *textField = [alertView textFieldAtIndex:0];
//            textField.placeholder = @"请输入姓名";
//            [alertView show];
        }
            break;
            
        case 4: { // 地址
//            mainAddressViewController * vc = [[mainAddressViewController alloc]init];
//            vc.delegate = self; // 代理协议
//            self.navigationItem.backBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:nil action:nil];
//            self.hidesBottomBarWhenPushed = YES;
//            [self.navigationController pushViewController:vc animated:YES];
//            self.hidesBottomBarWhenPushed = YES;
        }
            break;
            
            
        default:
            break;
    }
}

#pragma mark － 私有方法

#pragma mark - 照片

// 使用摄像头
- (void)getFromCamera {
    // 判断有摄像头，并且支持拍照功能
    if ([self isCameraAvailable] && [self doesCameraSupportTakingPhotos]) {
        // 初始化图片选择控制器
        UIImagePickerController *controller = [[UIImagePickerController alloc] init];
        [controller setSourceType:UIImagePickerControllerSourceTypeCamera];// 设置类型
        
        // 设置所支持的类型，设置只能拍照，或则只能录像，或者两者都可以
        NSString *requiredMediaType = (NSString *)kUTTypeImage;
        NSArray *arrMediaTypes = [NSArray arrayWithObjects:requiredMediaType, nil];
        
        [controller setMediaTypes:arrMediaTypes];
        [controller setAllowsEditing:YES];// 设置是否可以管理已经存在的图片或者视频
        [controller setDelegate:self];// 设置代理
        [self presentViewController:controller animated:YES completion:^{}];
    } else {
        NSLog(@"Camera is not available.");
    }
}

// 判断设备是否有摄像头
- (BOOL)isCameraAvailable{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

// 前面的摄像头是否可用
- (BOOL)isFrontCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}

// 后面的摄像头是否可用
- (BOOL)isRearCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
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

// 检查摄像头是否支持录像
- (BOOL)doesCameraSupportShootingVideos{
    return [self cameraSupportsMedia:(NSString *)kUTTypeMovie sourceType:UIImagePickerControllerSourceTypeCamera];
}

// 检查摄像头是否支持拍照
- (BOOL)doesCameraSupportTakingPhotos{
    return [self cameraSupportsMedia:(NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypeCamera];
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
        self.userHeaderImageView.image = theImage;
        
//        [self didClickUploadButtonAction];
        
    }
    
    [picker dismissViewControllerAnimated:YES completion:^{}];
}
#pragma mark - AFNetworking上传文件
//- (void)didClickUploadButtonAction{
//    // 獲取當前頭像圖片，並按照0.1比例壓縮
//    NSData *dataImg = UIImageJPEGRepresentation(self.userHeaderImageView.image, 0.1);
//    
//    // 上傳頭像url
//    NSString *url = kAPI_RequestURL_UploadImg;
//    
//    // 上傳頭像請求參數
//    NSDictionary *parameters = @{@"customId":[RAUserDefaults getUserID]};
//    
//    // 構造請求
//    AFHTTPRequestOperationManager *requestManager = [AFHTTPRequestOperationManager manager];
//    requestManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//    
//    // post上傳頭像
//    [requestManager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        [formData appendPartWithFileData:dataImg name:@"file" fileName:@"testFileName.jpg" mimeType:@"image/jpeg"]; // 拼接上傳內容
//        
//    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        LOG(@"請求成功返回結果 == %@", responseObject);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        LOG(@"請求失敗反悔結果 == %@", error);
//    }];
//    
//}

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


#pragma mark - 懒加载
// 个人信息列表
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 44 * 4 + 60) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.bounces = NO;
    }
    
    return _tableView;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
        _scrollView.backgroundColor = [UIColor colorWithRed:244.0/255.0 green:245.0/255.0 blue:249.0/255.0 alpha:1];
    }
    return _scrollView;
}

- (UIAlertController *)alertController {
    if (!_alertController) {
        _alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *photoAlertAction = [UIAlertAction actionWithTitle:@"从相册中获取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self getFromPhoto];
        }];
        UIAlertAction *cameraAlertAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self getFromPhoto];
        }];
        
        UIAlertAction *cancelAlertAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:nil];
        
        [_alertController addAction:photoAlertAction];
        [_alertController addAction:cameraAlertAction];
        [_alertController addAction:cancelAlertAction];
        
    }
    return _alertController;
}


@end
