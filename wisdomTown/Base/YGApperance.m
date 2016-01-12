//
//  YGApperance.m
//  wisdomTown
//
//  Created by lily on 15/12/30.
//  Copyright © 2015年 ygzy. All rights reserved.
//

#import "YGApperance.h"
#import <UIKit/UIKit.h>


@implementation YGApperance

+(void)setApperance
{
    UINavigationBar *navBar =[UINavigationBar appearance];
    [navBar setBarStyle:UIBarStyleBlack];
    [navBar setTintColor:[UIColor whiteColor]];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
}

@end
