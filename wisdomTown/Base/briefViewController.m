//
//  briefViewController.m
//  wisdomTown
//
//  Created by lily on 15/12/31.
//  Copyright © 2015年 ygzy. All rights reserved.
//

#import "briefViewController.h"
#define  baseTag 400

@interface briefViewController ()

@end

@implementation briefViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=UIColorRGB(245, 245, 245);
    [self creatView];
}

-(void)creatView
{
    NSArray *name =@[@"人文地理",@"特色资源",@"发展规划",@"人口民族",@"名胜古迹",@"社会事业"];
    CGFloat sep = (self.view.bounds.size.width-75*3)/4;
    NSLog(@"%lf",sep);
//    CGFloat sep = 10;
    for (int i=0; i<6; i++) {
        UIButton *btn =[[UIButton alloc] initWithFrame:CGRectMake(sep+(i %3)*(75+sep), 64+20+(i/3)*(75+20), 75, 75)];
        btn.backgroundColor =[UIColor magentaColor];
        [btn setTitle:name[i] forState:UIControlStateNormal];
        btn.tag = baseTag +i;
        btn.layer.cornerRadius =75/2.f;
        [self.view addSubview:btn];
        
    }
}


@end
