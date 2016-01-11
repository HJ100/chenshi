//
//  weakView.m
//  wisdomTown
//
//  Created by lily on 16/1/8.
//  Copyright © 2016年 ygzy. All rights reserved.
//

#import "weakView.h"
//#import "weather.h"

@interface weakView ()




@end



@implementation weakView




-(UILabel *)labelData
{
    if (!_labelData) {
        _labelData= [[UILabel alloc] initWithFrame:CGRectMake(0, 13, self.bounds.size.width, 20)];
        _labelData.textAlignment = NSTextAlignmentCenter;
        _labelData.font =[UIFont boldSystemFontOfSize:13];
        _labelData.textColor = [UIColor whiteColor];
        [self addSubview:_labelData];
    }
    return _labelData;
}

-(UILabel *)labelType
{
    if (!_labelType) {
        _labelType =[[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.labelData.frame)+13, self.bounds.size.width, 20)];
        _labelType.font =[UIFont boldSystemFontOfSize:11];
        _labelType.textColor =[UIColor whiteColor];
        _labelType.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_labelType];
    }
    return _labelType;
}

-(UIImageView *)img
{
    if (!_img) {
        _img =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 40)];
        [self addSubview:_img];
    }
    return _img;
}


-(UILabel *)labelArea
{
    if (!_labelArea) {
        _labelArea =[[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.img.frame), self.bounds.size.width, CGRectGetHeight(self.frame)-10)];
        _labelArea.textAlignment = NSTextAlignmentCenter;
        _labelArea.font =[UIFont boldSystemFontOfSize:11];
        _labelArea.textColor =[UIColor whiteColor];
        [self addSubview:_labelArea];
    }
    return _labelArea;
}






@end
