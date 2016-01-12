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
{
    UIAlertView *myAlert;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"在线小说";
//    [self addBackBtn];
}

-(void)viewWillAppear:(BOOL)animated
{
//    [super viewWillAppear:YES];
//    self.navigationController.navigationBarHidden = YES;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.hongxiu.com/"]];
    [self.webV loadRequest:request];
    [self.view addSubview:self.webV];
}




- (void)webViewDidStartLoad:(UIWebView *)webView{

    if (myAlert==nil){
        myAlert = [[UIAlertView alloc] initWithTitle:nil
                                             message: @"读取中..."
                                            delegate: self
                                   cancelButtonTitle: nil
                                   otherButtonTitles: nil];
        
        UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        activityView.frame = CGRectMake(120.f, 48.0f, 38.0f, 38.0f);
        [myAlert addSubview:activityView];
        [activityView startAnimating];
        [myAlert show];
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [myAlert dismissWithClickedButtonIndex:0 animated:YES];
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
//        _webV.backgroundColor =[UIColor redColor];
    }
    return _webV;
}

@end
