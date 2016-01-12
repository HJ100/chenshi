//
//  YGBaseTableViewController.h
//  wisdomTown
//
//  Created by lily on 16/1/9.
//  Copyright © 2016年 ygzy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YGBaseTableViewController : UITableViewController

@property (nonatomic,strong)NSMutableArray *dataSource;


-(void)showLoadingView;

-(void)hideLoadingView;

@end
