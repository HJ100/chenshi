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
#import "YGTrainViewController.h"


#define iconTag 654

@interface YGEasyLifeViewController ()

@end

@implementation YGEasyLifeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //去掉tableview 的分割线
    self.tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    
    self.navigationItem.title=@"便民生活";
    [self createView];
}

-(void)createView
{
    NSArray *titleArr =@[@"机构信息",@"天气预报",@"办事指南",@"酒店住宿",@"休闲娱乐",@"餐饮美食",@"健康医疗",@"在线小说",@"在线游戏",@"火车查询",@"电费查询",@"水费查询"];
    
    NSArray *iconImgArr =@[@"机构",@"天气",@"办事",@"住宿",@"休闲",@"美食",@"医疗",@"小说",@"游戏",@"火车",@"电费",@"水费"];
    
    CGFloat width =75;
    CGFloat sep = (SCR_W-width*3.f)/4;

    for (int i=0; i<titleArr.count; i++) {
        YGLifeIcon *icon =[[YGLifeIcon alloc]init];
        icon.frame =CGRectMake((i%3) *(width+sep)+sep, (i/3)*(width+25+26)+26, width, width+25);
        [icon setIconColor:[UIColor clearColor] ImageIcon:iconImgArr[i] title:titleArr[i]];
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
            case 7:
        {
            [self.navigationController pushViewController:[[YGNovelViewController alloc] init] animated:YES];
            break;
        }
            case 8:
        {
            [self.navigationController pushViewController:[[YGGameViewController alloc] init] animated:YES];
            break;
        }
            case 9:
        {
            [self.navigationController pushViewController:[[YGTrainViewController alloc] init] animated:YES];
            break;
        }
        default:
            break;
    }
    
    
    
}

@end
