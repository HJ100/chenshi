//
//  YGEasyLifeViewController.m
//  wisdomTown
//
//  Created by lily on 16/1/7.
//  Copyright © 2016年 ygzy. All rights reserved.
//

#import "YGEasyLifeViewController.h"
#import "YGLifeIcon.h"

#import "YGSpecialViewController.h"
#import "YGNovelViewController.h"
#import "YGGameViewController.h"

#define iconTag 654

@interface YGEasyLifeViewController ()

@end

@implementation YGEasyLifeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorRGB(238, 238, 238);
    //去掉tableview 的分割线
    self.tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    [self createView];
}

-(void)createView
{
    NSArray *titleArr =@[@"办事指南",@"机构信息",@"天气",@"酒店",@"餐饮",@"娱乐",@"水费查询",@"电费查询",@"小说",@"游戏",@"健康",@"火车查询"];
    
    CGFloat width =65;
    CGFloat sep = (SCR_W-width*4.f)/5;

    for (int i=0; i<titleArr.count; i++) {
        YGLifeIcon *icon =[[YGLifeIcon alloc]init];
        icon.frame =CGRectMake((i%4) *(width+sep)+sep, (i/4)*(width+sep+25)+sep, width, width+25);
        [icon setIconColor:[UIColor purpleColor] ImageIcon:@"便民生活图标" title:titleArr[i]];
        icon.tag = iconTag +i;
//          icon.backgroundColor=i%2?[UIColor greenColor]:[UIColor yellowColor];
        [icon addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(iconAction:)]];
        
        [self.tableView addSubview:icon];
    }
    

    
}

-(void)iconAction:(UITapGestureRecognizer *)tap
{
    NSInteger i= tap.view.tag-iconTag;
    
    switch (i) {
        case 0:
        {
            YGSpecialViewController *special =[[YGSpecialViewController alloc] init];
            [self.navigationController pushViewController:special animated:YES];
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
            case 3:
        {
            break;
        }
            case 4:
        {
            break;
        }
            case 8:
        {
            [self.navigationController pushViewController:[[YGNovelViewController alloc] init] animated:YES];
            break;
        }
            case 9:
        {
            [self.navigationController pushViewController:[[YGGameViewController alloc] init] animated:YES];
            break;
        }
        default:
            break;
    }
    
    
    
}

@end
