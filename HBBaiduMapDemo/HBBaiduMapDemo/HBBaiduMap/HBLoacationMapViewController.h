//
//  HBLoacationMapViewController.h
//  HBBaiduMapDemo
//
//  Created by wangfeng on 16/1/14.
//  Copyright © 2016年 HustBroventure. All rights reserved.
//

#import "HBBaseMapViewController.h"
#import <BaiduMapAPI_Location/BMKLocationComponent.h>

@interface HBLoacationMapViewController : HBBaseMapViewController
@property (nonatomic, strong)  BMKLocationService* locationService ;

@end
