//
//  HBBaseMapViewController.h
//  HBBaiduMapDemo
//
//  Created by wangfeng on 16/1/14.
//  Copyright © 2016年 HustBroventure. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>
@interface HBBaseMapViewController : UIViewController<BMKMapViewDelegate>

@property (nonatomic, strong) BMKMapView* mapView;
@end
