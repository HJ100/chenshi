//
//  YGRootViewController.m
//  wisdomTown
//
//  Created by lily on 15/12/30.
//  Copyright © 2015年 ygzy. All rights reserved.
//

#import "YGRootViewController.h"
#import "YGEasyScrollView.h"
#import "briefViewController.h"
#import "YGSpecialViewController.h"


#define baseTag 324


@interface YGRootViewController ()

@end

@implementation YGRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"智慧乡镇";
    [self setNav];
    [self createScr];
    [self createButtons];
}

-(void)setNav
{
    //设置导航条的左视图
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"user_24"] style:UIBarButtonItemStyleDone target:self action:nil];
    //设置导航条的右视图
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
}

-(void)createScr
{
    NSArray *imageArr =@[@"walkthrough_1.jpg", @"walkthrough_2.jpg",@"walkthrough_3.jpg", @"walkthrough_4.jpg"];
    
    YGEasyScrollView *easyScr =[[YGEasyScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 250)];
    [easyScr createGuideViewWithImages:imageArr];
    easyScr.pageControol.currentPageIndicatorTintColor =[UIColor yellowColor];
    easyScr.pageControol.pageIndicatorTintColor=[UIColor redColor];
    easyScr.isCircle = YES;
    easyScr.isAutoRolling =YES;
    [self.view addSubview:easyScr];
    
}
//创建第一行的button
- (void)createButtons
{
    CGFloat width =SCR_W/5 ;
    CGFloat heigth =(SCR_H-250)/3;
    
    //设置乡镇概况按钮
    UIButton *btn1 =[[UIButton alloc] initWithFrame:CGRectMake(0, 250,width *2,heigth)];
    btn1.tag=baseTag +0;
    btn1.backgroundColor = [UIColor greenColor];
    [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btn1 setTitle:@"乡镇概况" forState:UIControlStateNormal];
    btn1.titleLabel.textAlignment = NSTextAlignmentCenter;
    btn1.titleLabel.font =[UIFont systemFontOfSize:20];
    btn1.titleLabel.textColor = [UIColor redColor];
    [btn1 addTarget:self action:@selector(btn1Action:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    NSArray *titleArr =@[@"人文地理",@"特色资源",@"发展规划"];
    
    for (int i =0; i<3; i++) {
        UIButton *btn =[[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(btn1.frame) +i *width,250, width, heigth)];
        btn.backgroundColor = i %2 ? [UIColor purpleColor]:[UIColor redColor];
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(btn1Action:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = baseTag +i+1;
//        btn.titleLabel.lineBreakMode=UILineBreakModeCharacterWrap;
//        btn.titleLabel.numberOfLines=0;
        [self.view addSubview:btn];
    }
    CGFloat  w = SCR_W /3.f;
    NSArray *arr =@[@"阳光政务",@"时事资讯",@"招商引资",@"便民生活",@"民心民意",@"聚焦三农"];
    for (int i=0; i<6; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake((i%3)* w, 250+heigth+(i/3)*heigth, w, heigth)];
        btn.backgroundColor=i % 2 ?[UIColor grayColor]:[UIColor cyanColor];
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btn1Action:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = baseTag + 4 +i;
        [self.view addSubview:btn];
    }
    
    
    

}

-(void)btn1Action:(UIButton *)btn
{
    NSInteger tag1 = btn.tag-baseTag;
    switch (tag1) {
        case 0:
        {
            briefViewController *view =[[briefViewController alloc] init];
            [self.navigationController pushViewController:view animated:YES];
            
            break;
        }
            case 1:
        {
            YGSpecialViewController *special =[[YGSpecialViewController alloc] init];
            [self.navigationController pushViewController:special animated:YES];
            break;
        }
            case 2:
        {
            YGSpecialViewController *special =[[YGSpecialViewController alloc] init];
            [self.navigationController pushViewController:special animated:YES];
            break;
        }
            case 3:
        {
            break;
        }
            case 4:
        {
            break;
        }
            case 5:
        {
            break;
        }
        
    }
    
    
}











@end
