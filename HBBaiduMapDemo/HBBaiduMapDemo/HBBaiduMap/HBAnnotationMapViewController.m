//
//  HBAnnotationMapViewController.m
//  HBBaiduMapDemo
//
//  Created by wangfeng on 16/1/14.
//  Copyright © 2016年 HustBroventure. All rights reserved.
//

#import "HBAnnotationMapViewController.h"
#import "HBCustomAnnotationView.h"
@interface HBAnnotationMapViewController ()

@end

@implementation HBAnnotationMapViewController
{
    BMKPointAnnotation* pointAnnotation;
    BMKPointAnnotation* animatedAnnotation;
}
#pragma mark - vc-life-circle
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem* right = [[UIBarButtonItem alloc]initWithTitle:@"add" style:UIBarButtonItemStylePlain target:self action:@selector(addAnimatedAnnotation)];
    self.navigationItem.rightBarButtonItem = right;
    self.mapView.delegate = self;
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}
#pragma mark - public methords

#pragma mark - private-tools methords
- (void)initData
{
    
}
    //添加标注
- (void)addPointAnnotation
{
    if (pointAnnotation == nil) {
        pointAnnotation = [[BMKPointAnnotation alloc]init];
        CLLocationCoordinate2D coor = self.locationService.userLocation.location.coordinate;
        coor.latitude -= 0.0001 ;
        coor.longitude -= 0.0001 ;
        pointAnnotation.coordinate = coor;
        pointAnnotation.title = @"test";
        pointAnnotation.subtitle = @"此Annotation可拖拽!";
    }
    [self.mapView addAnnotation:pointAnnotation];
}

    // 添加动画Annotation
- (void)addAnimatedAnnotation {
    [self addPointAnnotation];
    if (animatedAnnotation == nil) {
        animatedAnnotation = [[BMKPointAnnotation alloc]init];
        CLLocationCoordinate2D coor = self.locationService.userLocation.location.coordinate;
        coor.latitude -= 0.0001 ;
        coor.longitude -= 0.0001 ;
        animatedAnnotation.coordinate = coor;
        animatedAnnotation.title = @"我是动画Annotation";
    }
    [self.mapView addAnnotation:animatedAnnotation];
}


#pragma mark - event methords

#pragma mark - delegate methords
-(BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation
{
        //普通annotation
    if (annotation == pointAnnotation) {
        NSString *AnnotationViewID = @"renameMark";
        BMKPinAnnotationView *annotationView = (BMKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
        if (annotationView == nil) {
            annotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
                // 设置颜色
            annotationView.pinColor = BMKPinAnnotationColorPurple;
                // 从天上掉下效果
            annotationView.animatesDrop = YES;
                // 设置可拖拽
            annotationView.draggable = YES;
        }
        return annotationView;
    }
        //动画annotation
    NSString *AnnotationViewID = @"AnimatedAnnotation";
    HBCustomAnnotationView *annotationView = nil;
    if (annotationView == nil) {
        annotationView = [[HBCustomAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
    }
//    NSMutableArray *images = [NSMutableArray array];
//    for (int i = 1; i < 4; i++) {
//        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"poi_%d.png", i]];
//        [images addObject:image];
//    }
//    annotationView.annotationImages = images;
    return annotationView;

    return nil;
}
-(void)mapView:(BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view
{
     NSLog(@"%s",__func__);
}
#pragma mark - property-setter-getter

@end
