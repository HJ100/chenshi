//
//  briefViewController.m
//  wisdomTown
//
//  Created by lily on 15/12/31.
//  Copyright © 2015年 ygzy. All rights reserved.
//

#import "briefViewController.h"
#define  baseTag 500

#import "YGLifeIcon.h"

@interface briefViewController ()

@end

@implementation briefViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=UIColorRGB(238, 238, 238 );
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.title=@"乡镇概述";
    [self creatView];
}

-(void)creatView
{
    NSArray *name =@[@"人文地理",@"特色资源",@"发展规划",@"人口民族",@"名胜古迹",@"社会事业"];
    CGFloat width = 75;
    CGFloat sep = (self.view.bounds.size.width-width*3)/4;
    NSLog(@"%lf",sep);
    for (int i=0; i<6; i++) {
        
        YGLifeIcon *icon = [[YGLifeIcon alloc] initWithFrame:CGRectMake(sep+(i%3)*(width+sep), sep+(i/3)*(width+20+sep), width, width+20)];
        [icon setIconColor:[UIColor magentaColor] ImageIcon:@"聚焦三农图标" title:name[i]];
        icon.tag = baseTag +i;
        [icon addGestureRecognizer:[[UIGestureRecognizer alloc] initWithTarget:self action:@selector(iconAct:)]];
        [self.tableView addSubview:icon];
    }
   
}

-(void)iconAct:(UITapGestureRecognizer *)tap
{
    switch (tap.view.tag-baseTag) {
        case 0:
        {
            break;
        }
            case 1:
        {
            break;
        }
            case 2:
        {
            break;
        }
        default:
            break;
    }
}

@end
