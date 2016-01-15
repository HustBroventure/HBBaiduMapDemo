//
//  HBCustomAnnotationView.m
//  HBBaiduMapDemo
//
//  Created by wangfeng on 16/1/14.
//  Copyright © 2016年 HustBroventure. All rights reserved.
//

#import "HBCustomAnnotationView.h"

@implementation HBCustomAnnotationView

- (id)initWithAnnotation:(id<BMKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setBounds:CGRectMake(0.f, 0.f, 32.f, 32.f)];
        
        [self setBackgroundColor:[UIColor redColor]];
        
        
    }
    return self;
}


@end
