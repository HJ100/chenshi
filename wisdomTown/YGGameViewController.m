//
//  YGGameViewController.m
//  wisdomTown
//
//  Created by lily on 16/1/9.
//  Copyright © 2016年 ygzy. All rights reserved.
//

#import "YGGameViewController.h"

@interface YGGameViewController ()<UIWebViewDelegate>

@property (nonatomic,strong)UIWebView *webV;

@end

@implementation YGGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://longjiang.sj33333.com/Api/AppsConvenience/getListByCat?cat_id=8&apptitle=%E5%B0%8F%E5%B0%8F%E6%B8%B8%E6%88%8F&hide_header=0&networktype=wifi"]];
    [self.webV loadRequest:request];
    [self.view addSubview:self.webV];
}

-(UIWebView *)webV
{
    if (!_webV) {
        _webV =[[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCR_W, SCR_H)];
    }
    return _webV;
}



@end
