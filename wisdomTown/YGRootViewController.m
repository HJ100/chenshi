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
#import "YGWeaViewController.h"
#import "YGButton.h"
#import "YGEasyLifeViewController.h"
#import "YGFarmerViewController.h"
#import "YGGovernmentViewController.h"
#import "YGNewsViewController.h"

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

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = NO;
}


-(void)setNav
{
    //设置导航条的左视图
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"个人图标"] style:UIBarButtonItemStyleDone target:self action:nil];
//设置导航条的右视图
    //     使用自定义的右视图
    UIImageView *imageView =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    imageView.image =[UIImage imageNamed:@"天气多云-图标"];
    imageView.userInteractionEnabled = YES;
    [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushAct)]];
    
    UIView *rightView =[[UIView alloc] initWithFrame:CGRectMake(0, 25, 70, 44)];

    UILabel *title =[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, 20)];
    title.text =@"多云";
    title.shadowColor = UIColorRGBA(0, 0, 0, 0.2);
    title.shadowOffset = CGSizeMake(1, 0);
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor= UIColorRGB(234, 234, 234);
    title.font = [UIFont boldSystemFontOfSize:11];
    [rightView addSubview:title];
    

    UILabel *wendu = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(title.frame), 70, 20)];
    wendu.text =@"19℃-23℃";
    wendu.shadowColor = UIColorRGBA(0, 0, 0, 0.2);
    wendu.shadowOffset =CGSizeMake(1, 0);
    wendu.textColor =UIColorRGB(234, 234, 234);
    wendu.textAlignment =NSTextAlignmentCenter;
    wendu.font =[UIFont systemFontOfSize:11];
    [rightView addSubview:wendu];
    wendu.userInteractionEnabled = YES;
    [wendu addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushAct)]];
    
    UIBarButtonItem *right1 = [[UIBarButtonItem alloc] initWithCustomView:imageView];
    
    UIBarButtonItem *right2 = [[UIBarButtonItem alloc] initWithCustomView:rightView];
    
    self.navigationItem.rightBarButtonItems =@[right1,right2];
}

//跳转到天气界面

-(void)pushAct
{
    YGWeaViewController *tq =[[YGWeaViewController alloc] init];
    [self.navigationController pushViewController:tq animated:YES];
}


-(void)createScr
{
    NSArray *imageArr =@[@"00.jpg", @"01.jpg",@"02.jpg"];
    CGFloat  w = SCR_W /3.f;
    YGEasyScrollView *easyScr =[[YGEasyScrollView alloc] initWithFrame:CGRectMake(0, 0, SCR_W, SCR_H-2*w-SCR_W/3.f*0.84)];
    [easyScr createGuideViewWithImages:imageArr];
    easyScr.pageControol.currentPageIndicatorTintColor =UIColorRGB(57, 141, 227);
    easyScr.pageControol.pageIndicatorTintColor=UIColorRGB(222, 225, 240);
    easyScr.isCircle = YES;
    easyScr.isAutoRolling =YES;
    [self.view addSubview:easyScr];
    
}
//创建第一行的button
- (void)createButtons
{
    CGFloat width =(SCR_W-174)/3;
    CGFloat heigth =SCR_W/3.f*0.84;
    CGFloat  w = SCR_W /3.f;
    //设置乡镇概况按钮
    YGButton *btn1 = [YGButton buttonWithFrame:CGRectMake(0, SCR_H-2*w-heigth,174,heigth) title:@"乡镇概况" Image:@"概述图标" backgroundColor:UIColorRGB(0, 161, 233) clickCallBack:^(YGButton *button) {
        briefViewController *view =[[briefViewController alloc] init];
        [self.navigationController pushViewController:view animated:YES];
    }];
    [self.view addSubview:btn1];
    
    NSArray *titleArr =@[@"人文地理",@"特色资源",@"发展规划"];
    NSArray *colorA = @[UIColorRGB(255, 167, 38),UIColorRGB(238, 104, 62),UIColorRGB(0, 150, 136)];
    for (int i =0; i<3; i++) {
        
        UIView * vi =[[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(btn1.frame) +i *width,SCR_H-2*w-heigth, width, heigth)];
        vi.backgroundColor = colorA[i];
        
        vi.userInteractionEnabled = YES;
        [vi addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(smallBtnAct:)]];
        vi.tag = baseTag +i;
        [self.view addSubview:vi];
        
        
        UILabel *label =[[UILabel alloc] initWithFrame:CGRectMake((width-15)/2.f, (heigth-80)/2.f, 15, 80)];
        label.text = titleArr[i];
        label.numberOfLines = 0;
        label.textColor = UIColorRGB(235, 235, 235);
        label.font = [UIFont boldSystemFontOfSize:15];
        [vi addSubview:label];
    }
    
    NSArray *titleArray =@[@"便民生活",@"民心民意",@"聚焦三农",@"阳光政务",@"时事资讯",@"招商引资"];
    
    NSArray *imageArr =@[@"便民生活图标",@"民心民意图标",@"聚焦三农图标",@"阳光政务图标",@"时事资讯图标",@"招商引资图标"];
    
    NSArray *colorArr =@[UIColorRGB(92, 107, 192),UIColorRGB(171, 71, 188),UIColorRGB(125, 176, 65),UIColorRGB(90, 118, 228),UIColorRGB(126, 87, 194),UIColorRGB(39, 150, 39)];
    
    for (int i=0; i<6; i++) {
//记住 图标是从下往上排列的
        YGButton *btn =[YGButton buttonWithFrame:CGRectMake((i%3)* w, SCR_H-(i/3)*w-w, w, w) title:titleArray[i] Image:imageArr[i] backgroundColor:colorArr[i] clickCallBack:^(YGButton *button) {
            switch (i) {
                case 0:
                {
                    
                    YGEasyLifeViewController *life =[[YGEasyLifeViewController alloc] init];
                    [self.navigationController pushViewController:life animated:YES];
                    break;
                }
                    case 2:
                {
                    YGFarmerViewController *farmer =[[YGFarmerViewController alloc] init];
                    [self.navigationController pushViewController:farmer animated:YES];
                    break;
                }

                    case 3:
                {
                    YGGovernmentViewController *gover =[[YGGovernmentViewController alloc] init];
                    [self.navigationController pushViewController:gover animated:YES];
                    break;
                }
                    case 4:
                {
                    [self.navigationController pushViewController:[[YGNewsViewController alloc] init] animated:YES];
                }
                default:
                    break;
            }
        }];
        [self.view addSubview:btn];
    }

}

//人文地理那三个按钮的点击事件
-(void)smallBtnAct:(UITapGestureRecognizer *)viewTap
{
    NSInteger tag1 = viewTap.view.tag -baseTag;
    
    switch (tag1) {
        case 0:
        {
            YGSpecialViewController *special =[[YGSpecialViewController alloc] init];
            [self.navigationController pushViewController:special animated:YES];
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
      default:
            break;
        
    }
}



@end
