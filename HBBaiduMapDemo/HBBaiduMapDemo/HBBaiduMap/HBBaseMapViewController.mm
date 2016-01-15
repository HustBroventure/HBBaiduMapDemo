//
//  HBBaseMapViewController.m
//  HBBaiduMapDemo
//
//  Created by wangfeng on 16/1/14.
//  Copyright © 2016年 HustBroventure. All rights reserved.
//

#import "HBBaseMapViewController.h"

@interface HBBaseMapViewController ()

@end

@implementation HBBaseMapViewController

#pragma mark - vc-life-circle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mapView];
    self.mapView.showMapScaleBar = YES;
    
}

- (void)dealloc {
    if (_mapView) {
        _mapView = nil;
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放

}
- (void)viewWillDisappear:(BOOL)animated
{
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    [super viewWillDisappear:animated];
}
#pragma mark - public methords

#pragma mark - private-tools methords
- (void)initData
{
    
}

#pragma mark - event methords

#pragma mark - delegate methords
- (void)mapViewDidFinishLoading:(BMKMapView *)mapView;
{
     NSLog(@"%s",__func__);
}
#pragma mark - property-setter-getter
-(BMKMapView *)mapView
{
    if (!_mapView) {
        _mapView = [BMKMapView new];
        _mapView.frame = self.view.bounds;
    }
    return _mapView;
}
@end
