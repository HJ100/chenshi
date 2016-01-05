//
//  YGEasyScrollView.h
//  wisdomTown
//
//  Created by lily on 15/12/30.
//  Copyright © 2015年 ygzy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YGEasyScrollView : UIView

@property (nonatomic,strong)UIScrollView *scrV;

@property (nonatomic,strong)UIPageControl *pageControol;

@property (nonatomic,assign)BOOL isCircle;

@property (nonatomic,assign)BOOL isAutoRolling;

@property (nonatomic,assign)CGFloat rollingInterval;

-(void)createGuideViewWithImages:(NSArray *)images;



@end
