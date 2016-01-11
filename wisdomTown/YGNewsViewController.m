//
//  YGNewsViewController.m
//  wisdomTown
//
//  Created by lily on 16/1/9.
//  Copyright © 2016年 ygzy. All rights reserved.
//

#import "YGNewsViewController.h"

#define btnTag 721

@interface YGNewsViewController ()

@end

@implementation YGNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatBtn];
}

-(void)creatBtn
{
    CGFloat width = SCR_W/3.f;
    CGFloat height = 30;
    NSArray *titleArr = @[@"热点资讯",@"政策公告",@"本地新闻"];
    for (int i=0; i<3; i++) {
        UIButton *btn =[[UIButton alloc] initWithFrame:CGRectMake(i*width, 0, width, height)];
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(btnAct:)]];
        [self.tableView addSubview:btn];
    }
}

-(void)btnAct:(UITapGestureRecognizer *)tap
{
    
}


@end
