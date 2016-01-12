//
//  YGFarmerViewController.m
//  wisdomTown
//
//  Created by lily on 16/1/9.
//  Copyright © 2016年 ygzy. All rights reserved.
//

#import "YGFarmerViewController.h"
#import "YGButton.h"

@interface YGFarmerViewController ()

@end

@implementation YGFarmerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"聚焦三农";
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self createView];
  
}

-(void)createView
{
    CGFloat width = SCR_W/3.f;
    NSArray *titleArr = @[@"扶贫动态",@"产业扶贫",@"帮扶脱贫",@"美丽乡村",@"惠民政策",@"村谱信息",@"农业技术",@"科普视频",@"农忙互助"];
    for (int i=0; i<9; i++) {
        YGButton *button = [YGButton buttonWithFrame:CGRectMake((i%3)*width, (i/3)*width, width, width) title:titleArr[i] Image:@"民心民意图标" backgroundColor:[UIColor whiteColor] clickCallBack:^(YGButton *button) {
            switch (i) {
                case 0:
                {
                    break;
                }
                    
                default:
                    break;
            }

            
        }];
        button.backgroundColor =[UIColor blackColor];
        button.layer.borderColor =[UIColor lightGrayColor].CGColor;
        button.layer.borderWidth = 0.5f;
        [self.view addSubview:button];
    }
    
    
    
}

@end
