//
//  YGNovelViewController.m
//  wisdomTown
//
//  Created by lily on 16/1/9.
//  Copyright © 2016年 ygzy. All rights reserved.
//

#import "YGNovelViewController.h"

@interface YGNovelViewController ()

@property (nonatomic,strong)UIWebView *webV;

@end

@implementation YGNovelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addBackBtn];
}

-(void)viewWillAppear:(BOOL)animated
{
//    [super viewWillAppear:YES];
//    self.navigationController.navigationBarHidden = YES;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.hongxiu.com/"]];
    [self.webV loadRequest:request];
    [self.view addSubview:self.webV];
}

-(void)addBackBtn
{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 3, 50, 50)];
//    btn.backgroundColor = [UIColor cyanColor];
//    [btn setBackgroundImage:[UIImage imageNamed:@"后退"] forState:UIControlStateNormal];
    [btn setTitle:@"后退" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAct) forControlEvents:UIControlEventTouchUpInside];
    [self.webV addSubview:btn];
}

-(void)btnAct
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(UIWebView *)webV
{
    if (!_webV) {
        _webV =[[UIWebView alloc] initWithFrame:self.view.bounds];
        _webV.backgroundColor =[UIColor redColor];
    }
    return _webV;
}

@end
