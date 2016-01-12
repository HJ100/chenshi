//
//  YGGovernmentViewController.m
//  wisdomTown
//
//  Created by lily on 16/1/9.
//  Copyright © 2016年 ygzy. All rights reserved.
//

#import "YGGovernmentViewController.h"

@interface YGGovernmentViewController ()



@end

@implementation YGGovernmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"阳光政务";
    NSArray *arr =@[@"权利清单",@"责任清单",@"信息公示",@"组织架构",@"政策文库"];
    self.dataSource = (NSMutableArray *)arr;
   
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *resuse = @"tablev";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:resuse];
 
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:resuse];
    }
    cell.textLabel.text =self.dataSource[indexPath.section];
    cell.imageView.image = [UIImage imageNamed:@"概述图标"];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

@end
