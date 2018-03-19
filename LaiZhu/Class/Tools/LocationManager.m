//
//  LocationManager.m
//  IosBaiduDemo
//
//  Created by apple on 2017/5/15.
//  Copyright © 2017年 易元江. All rights reserved.
//

#import "LocationManager.h"
#import <CoreLocation/CoreLocation.h>

@interface LocationManager()<CLLocationManagerDelegate,BMKLocationServiceDelegate,BMKGeoCodeSearchDelegate,UIAlertViewDelegate>
/** 本地 */
@property (nonatomic,strong) CLLocationManager *locManager;
/** 百度地图定位对象 */
@property (nonatomic, strong)BMKLocationService *locService;
/** 百度地图地理编码对象 */
@property (nonatomic, strong)BMKGeoCodeSearch *geoSearcher;

@end

@implementation LocationManager

//全局变量
static LocationManager *_locManager;

//单例方法
+ (instancetype)shareLocationManager
{
    //只进行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _locManager = [[self alloc] init];
    });
    
    return _locManager;
}

//alloc会调用allocWithZone:
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    //只进行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _locManager = [super allocWithZone:zone];
    });
    
    return _locManager;
}

//copy在底层 会调用copyWithZone:
- (id)copyWithZone:(struct _NSZone *)zone
{
    return _locManager;
}


#pragma mark -- 懒加载
 -(CLLocationManager *)locManager
{
    if (!_locManager) {
        //1.创建位置管理器（定位用户的位置）
        _locManager = [[CLLocationManager alloc]init];
        
        if([[UIDevice currentDevice].systemVersion floatValue] >= 8.0)
        {
            [_locManager requestAlwaysAuthorization];
            
        }
        //2.设置代理
        _locManager.delegate = self;
        
        }
    return _locManager;
}


#pragma mark -- 启动定位
- (void)startLocationManager
{
    //判断用户定位服务是否开启
    if ([CLLocationManager locationServicesEnabled]) {
        //开始定位用户的位置
        [self.locManager startUpdatingLocation];
        //每隔多少米定位一次（这里的设置为任何的移动）
        self.locManager.distanceFilter=kCLDistanceFilterNone;
        //设置定位的精准度，一般精准度越高，越耗电（这里设置为精准度最高的，适用于导航应用）
        self.locManager.desiredAccuracy=kCLLocationAccuracyBestForNavigation;
        
    }else{
        //不能定位用户的位置
        //1.提醒用户检查当前的网络状况
        //2.提醒用户打开定位开关
        [self myAlertViewWithText:@"请检查网络或打开定位服务"];
    
    }
}


#pragma mark -- 停止定位
- (void)stopLocationManager
{
    [self.locManager stopUpdatingLocation];
}

#pragma mark-CLLocationManagerDelegate
 /**
  *  当定位到用户的位置时，就会调用（调用的频率比较频繁）
  */
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
 {
    //locations数组里边存放的是CLLocation对象，一个CLLocation对象就代表着一个位置
//    CLLocation *loc = [locations firstObject];
    //维度：loc.coordinate.latitude
    //经度：loc.coordinate.longitude
//    NSLog(@"纬度 = %f，经度 = %f",loc.coordinate.latitude,loc.coordinate.longitude);
//    NSLog(@"%lu",(unsigned long)locations.count);

    //停止更新位置（如果定位服务不需要实时更新的话，那么应该停止位置的更新）
    //    [self.locMamanger stopUpdatingLocation];
     
     CLGeocoder *geocoder=[[CLGeocoder alloc]init];
     [geocoder reverseGeocodeLocation:[locations lastObject] completionHandler:^(NSArray *placemarks,NSError *error) {
         
         for(CLPlacemark *placemark in placemarks)
         {
             NSDictionary *addressDic = placemark.addressDictionary;
             NSString *country = [addressDic objectForKey:@"Country"];//国家
             NSString *province = [addressDic objectForKey:@"State"];//省
             NSString *city =[addressDic objectForKey:@"City"];//市
             NSString *proCity;//省 市
             if (province.length == 0) {
                 proCity = city;
             }else{
                 proCity = [NSString stringWithFormat:@"%@%@",province,city];
             }
             NSString *subLocality = [addressDic objectForKey:@"SubLocality"];//区
             NSString *street = [addressDic objectForKey:@"Street"];//街道 号
             NSString *thoroughfare = [addressDic objectForKey:@"thoroughfare"];//街道
             NSString *subThoroughfare = [addressDic objectForKey:@"subThoroughfare"];//子街道
             NSString *formattedAddressLines = [addressDic objectForKey:@"FormattedAddressLines"];
             
             NSLog(@"国家：%@",country);
             NSLog(@"省 市（直辖市）：%@",proCity);
             NSLog(@"区：%@",subLocality);
             NSLog(@"街道 号:%@  街道:%@",street,thoroughfare);
             NSLog(@"formattedAddressLines：%@",formattedAddressLines);

             NSString *detaillAddress = [NSString stringWithFormat:@"%@%@%@%@",country,proCity,subLocality,street];
             YYJNSLog(@"详细地址：%@",detaillAddress);
             
             //存储检索到的省市
             [[NSUserDefaults standardUserDefaults] setObject:province forKey:@"province"];//省
             [[NSUserDefaults standardUserDefaults] setObject:city forKey:@"city"];//市
             if (subLocality.length != 0) {
                 [[NSUserDefaults standardUserDefaults] setObject:subLocality forKey:@"subLocality"];//区
                 YYJNSLog(@"区=====区=====区：%@",subLocality);
             }
             [[NSUserDefaults standardUserDefaults] setObject:proCity forKey:@"proCity"];//省市
             [[NSUserDefaults standardUserDefaults] setObject:detaillAddress forKey:@"detaillAddress"];//详细地址
             
             if (province.length != 0) {
                 [self.locManager stopUpdatingLocation];
             }
         }
         
      }];

 }


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSString *errorMsg = nil;
    if ([error code] == kCLErrorDenied) {
        errorMsg = @"访问被拒绝";
    }
    if ([error code] == kCLErrorLocationUnknown) {
        errorMsg = @"获取地理位置失败";
    }else{
        [self myAlertViewWithText:@"定位失败"];
    }
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    
    switch (status) {
            
        case kCLAuthorizationStatusNotDetermined:
            
            if([self.locManager respondsToSelector:@selector(requestAlwaysAuthorization)]){
                
                [self.locManager requestWhenInUseAuthorization];
            }
            break;
            
        case kCLAuthorizationStatusDenied:
            [self myAlertViewWithText:@"请在设置-隐私-定位服务中开启定位功能！"];
            break;
            
        case kCLAuthorizationStatusRestricted:
            
            [self myAlertViewWithText:@"定位服务无法使用！"];
            break;
            
        case kCLAuthorizationStatusAuthorizedAlways:
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            [self.locManager startUpdatingLocation];
            break;
        default:
            break;
    }
}

#pragma mark 对话框的抽取
- (void)myAlertViewWithText:(NSString *)text
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:text delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

//计算两个位置之间的距离
-(void)countDistanceFirstLatitude:(CGFloat)firstLatitude firstlongitude:(CGFloat)firstlongitude secondLatitude:(CGFloat)secondLatitude secondlongitude:(CGFloat)secondlongitude
{
    //根据经纬度创建两个位置对象
    CLLocation *loc1=[[CLLocation alloc]initWithLatitude:firstLatitude longitude:firstlongitude];
    CLLocation *loc2=[[CLLocation alloc]initWithLatitude:secondLatitude longitude:secondlongitude];
    //计算两个位置之间的距离
    CLLocationDistance distance=[loc1 distanceFromLocation:loc2];
    NSLog(@"(%@)和(%@)的距离=%fM",loc1,loc2,distance);
}

/****************************BaiDu地图********************************/
#pragma mark -- 定位服务
- (BMKLocationService *)locService
{
    if (!_locService) {
        _locService = [[BMKLocationService alloc] init];
        _locService.delegate = self;
        // 设定定位的最小更新距离(米)，更新频率。默认为kCLDistanceFilterNone
        _locService.distanceFilter = 100.0f;
        /**
         *  设定定位精度。默认为kCLLocationAccuracyBest
         *   kCLLocationAccuracyNearestTenMeters。精度10 米；kCLLocationAccuracyHundredMeters 。精度100 米；kCLLocationAccuracyKilometer 。精度1000 米；kCLLocationAccuracyThreeKilometers。精度3000米；kCLLocationAccuracyBest 。设备 使用电池供电时候，最高的精度；kCLLocationAccuracyBestForNavigation。导航情况下最高精度，一般要有外接电源时才 能使用
         */
        _locService.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    }
    return _locService;
}

#pragma mark -- geo搜索服务
- (BMKGeoCodeSearch *)geoSearcher
{
    if (!_geoSearcher) {
        _geoSearcher = [[BMKGeoCodeSearch alloc] init];
        _geoSearcher.delegate = self;
    }
    return _geoSearcher;
}

#pragma mark -- 百度地图定位-开始定位
- (void)startLocation
{
    if ([self isAuthorizeOpenLocation]) {// 已经授权定位
        //启动LocationService
        [self.locService startUserLocationService];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"定位服务未开启" message:@"请在设置中开启定位服务" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"去设置", nil];
        [alert show];
    }
}

#pragma mark -- 百度地图定位-停止定位
- (void)stopLocation
{
    [self.locService stopUserLocationService];
}

#pragma mark -- 判断是否授权开启定位-百度地图定位
- (BOOL)isAuthorizeOpenLocation
{
    if ([CLLocationManager locationServicesEnabled] && ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined  || [CLLocationManager authorizationStatus] ==kCLAuthorizationStatusAuthorizedWhenInUse)) {
        
        return YES;
    }
    return NO;
}

#pragma mark - BMKLocationServiceDelegate
/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    // heading信息，尚未定位成功，则该值为nil
    //    JZKJLog(@"%@",userLocation.heading);
}

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    //    JZKJLog(@"userLocation 新的用户位置 latitude %f,longitude %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    
    //发起反向地理编码检索
    CLLocationCoordinate2D pt = (CLLocationCoordinate2D){userLocation.location.coordinate.latitude, userLocation.location.coordinate.longitude};
    BMKReverseGeoCodeOption *reverseGeoCodeSearchOption = [[BMKReverseGeoCodeOption alloc] init];
    reverseGeoCodeSearchOption.reverseGeoPoint = pt;
    BOOL flag = [_geoSearcher reverseGeoCode:reverseGeoCodeSearchOption];
    
    if(flag)
    {
        NSLog(@"反geo检索发送成功");
    }
    else
    {
        NSLog(@"反geo检索发送失败");
    }
}

#pragma mark - BMKGeoCodeSearchDelegate
/**
 *返回反地理编码搜索结果
 *@param searcher 搜索对象
 *@param result 搜索结果
 *@param error 错误号，@see BMKSearchErrorCode
 */
- (void)onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error
{
    if (error == BMK_SEARCH_NO_ERROR) {
        
        //在此处理正常结果
        //        JZKJLog(@"%@--%@",result.addressDetail.city, result.address);
        
        if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"UserCurrentAddress"] isEqualToString:result.address]) { // 用户当前位置与沙河存储位置相同
            
            // 关闭定位服务LocationService
            [self stopLocation];
            
        } else {
            
            [[NSUserDefaults standardUserDefaults] setValue:result.addressDetail.city forKey:@"UserCurrentCity"];  // 将用户城市位置存储，以便后面进行设置地址时的city
            [[NSUserDefaults standardUserDefaults] setValue:result.address forKey:@"UserCurrentAddress"];
        }
    }
    else {
        [self startLocation];
        YYJNSLog(@"抱歉，未找到结果");
    }
    
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"%ld",(long)buttonIndex);
    if (buttonIndex == 1) { // 去设置
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url];
        }
    }
}


@end
