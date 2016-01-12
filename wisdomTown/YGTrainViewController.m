//
//  YGTrainViewController.m
//  wisdomTown
//
//  Created by lily on 16/1/11.
//  Copyright © 2016年 ygzy. All rights reserved.
//

#import "YGTrainViewController.h"

@interface YGTrainViewController ()
@property (nonatomic,strong)UIWebView *webV;
@end

@implementation YGTrainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  self.title =@"火车查询";
}

-(void)viewWillAppear:(BOOL)animated
{
    //    [super viewWillAppear:YES];
    //    self.navigationController.navigationBarHidden = YES;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.12306.cn/mormhweb/"]];
    [self.webV loadRequest:request];
    [self.view addSubview:self.webV];
}

-(UIWebView *)webV
{
    if (!_webV) {
        _webV =[[UIWebView alloc] initWithFrame:self.view.bounds];
//        _webV.backgroundColor =[UIColor redColor];
    }
    return _webV;
}



@end
