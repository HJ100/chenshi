//
//  weakView.h
//  wisdomTown
//
//  Created by lily on 16/1/8.
//  Copyright © 2016年 ygzy. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "weather.h"

@interface weakView : UIView

@property (nonatomic,strong)weather *model;

@property (nonatomic,strong)UILabel *labelData;

@property (nonatomic,strong)UILabel *labelType;

@property (nonatomic,strong)UIImageView *img;

@property (nonatomic,strong)UILabel *labelArea;

@end
