//
//  YGButton.m
//  wisdomTown
//
//  Created by lily on 16/1/6.
//  Copyright © 2016年 ygzy. All rights reserved.
//

#import "YGButton.h"

@interface YGButton ()

//全局变量，用来临时存储代码段
@property (nonatomic,strong)void(^clickCallBack)(YGButton *button);

@end


@implementation YGButton

+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString *)title Image:(NSString *)image backgroundColor:(UIColor *)color clickCallBack:(void(^)(YGButton *button))callBack
{
    YGButton *button =[[YGButton alloc] init];

    button.frame=frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
     
    button.backgroundColor = color;
    

    [button setTitleColor:UIColorRGB(235, 235, 235) forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont boldSystemFontOfSize:15];
    [button setTitleColor:UIColorRGBA(235, 235, 235, 0.4) forState:UIControlStateHighlighted];
#warning 重点  封装button 的重点
#warning target 不能是self 这个时候self 表示的类本身
    //事件回调
    //复制代码段
    button.clickCallBack=callBack;
    [button addTarget:button action:@selector(btnAct:) forControlEvents:UIControlEventTouchUpInside];
    
    // 调整图片, 文字的位置
    CGSize imageSize = button.imageView.frame.size;
    CGSize labelSize = button.titleLabel.frame.size;
    
    button.imageEdgeInsets = UIEdgeInsetsMake(- (labelSize.height), 0, 0, -(labelSize.width));
    
    button.titleEdgeInsets = UIEdgeInsetsMake(20, -imageSize.width, -(imageSize.height), 0);
    
    return button;
}

-(void)btnAct:(YGButton *)button
{
    if (button.clickCallBack) {
        button.clickCallBack(button);
    }
}



@end
