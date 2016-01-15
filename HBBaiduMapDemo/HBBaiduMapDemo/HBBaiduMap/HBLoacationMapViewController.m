//
//  HBLoacationMapViewController.m
//  HBBaiduMapDemo
//
//  Created by wangfeng on 16/1/14.
//  Copyright © 2016年 HustBroventure. All rights reserved.
//

#import "HBLoacationMapViewController.h"

@interface HBLoacationMapViewController ()<BMKLocationServiceDelegate>

@end

@implementation HBLoacationMapViewController

#pragma mark - vc-life-circle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.locationService.delegate = self;
        //3-20
    self.mapView.zoomLevel = 17;
    [self startLocation:BMKUserTrackingModeFollow];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}
-(void)viewDidDisappear:(BOOL)animated
{
    [self.locationService stopUserLocationService];
    [super viewDidDisappear:animated];
}
#pragma mark - public methords

#pragma mark - private-tools methords
- (void)initData
{
    
}
#pragma mark 开始定位

//BMKUserTrackingModeNone
//BMKUserTrackingModeNone
//BMKUserTrackingModeFollow
-(void)startLocation:(BMKUserTrackingMode)mode
{
    NSLog(@"开始定位");
    [self.locationService startUserLocationService];
    self.mapView.showsUserLocation = NO;//先关闭显示的定位图层
    self.mapView.userTrackingMode = mode;//设置定位的状态
    self.mapView.showsUserLocation = YES;//显示定位图层
    
    
}
#pragma mark 停止定位
-(void)stopLocation
{
    NSLog(@"停止定位");
    [self.locationService stopUserLocationService];
        //self.mapView.showsUserLocation = NO;
   
}

#pragma mark - event methords

#pragma mark - delegate methords

#pragma mark 在地图View将要启动定位时，会调用此函数

- (void)willStartLocatingUser
{
    NSLog(@"start locate");
}

#pragma mark 用户方向更新后，会调用此函数 @param userLocation 新的用户位置

- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    [self.mapView updateLocationData:userLocation];
    NSLog(@"heading is %@",userLocation.heading);
}


#pragma mark 用户位置更新后，会调用此函数 @param userLocation 新的用户位置

- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    [self.mapView updateLocationData:userLocation];
}


#pragma mark 在地图View停止定位后，会调用此函数
- (void)didStopLocatingUser
{
    NSLog(@"stop locate");
}


#pragma mark 定位失败后，会调用此函数，会调用此函数

- (void)didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"location error");
}

#pragma mark - property-setter-getter
-(BMKLocationService *)locationService
{
    if (!_locationService) {
        _locationService = [BMKLocationService new];
    }
    return _locationService;
}
@end
