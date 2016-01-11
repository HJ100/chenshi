//
//  YGweatherViewController.m
//  wisdomTown
//
//  Created by huang on 16/1/5.
//  Copyright © 2016年 ygzy. All rights reserved.
//

#import "YGweatherViewController.h"

#import "AFNetworking.h"

#import "weather.h"

#import "UIImageView+WebCache.h"


@interface YGweatherViewController ()

@property (nonatomic,strong) UIImageView *weaImag;
@property (nonatomic,strong) NSArray *array;

@end

@implementation YGweatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    img.image = [UIImage imageNamed:@"背景3"];
    
    [self.view addSubview:img];
    
    
    
    
    [self loaddata];
    
    //1.添加城市名
    [self createCityName];
    
    //2.创建天气图
    [self weatherPicture];
    
    //3.温度
    [self wendu];
    
    //4.一周温度表
    [self list];
    _array = [[NSArray alloc] init];
    
   
    
    
    
    
}

-(void)list
{
    
    CGFloat y = CGRectGetMaxY(_weaImag.frame) + SCR_H * 0.2;
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(20 ,y, (SCR_W - 40) / 6, 30)];
   // lab.backgroundColor = [UIColor yellowColor];
    lab.text =@"昨天";
    [self.view addSubview:lab];
    
    UILabel *lab2 = [[UILabel alloc] initWithFrame:CGRectMake(20 + (SCR_W - 40) / 6,y, (SCR_W - 40) / 6, 30)];
   // lab2.backgroundColor = [UIColor redColor];
    lab2.text =@"今天";
    [self.view addSubview:lab2];
    
    UILabel *lab3 = [[UILabel alloc] initWithFrame:CGRectMake(20 + 2*(SCR_W - 40) / 6,y, (SCR_W - 40) / 6, 30)];
   // lab3.backgroundColor = [UIColor yellowColor];
    lab3.text =@"明天";
    [self.view addSubview:lab3];
    
    UILabel *lab4 = [[UILabel alloc] initWithFrame:CGRectMake(20 + 3*(SCR_W - 40) / 6,y, (SCR_W - 40) / 6, 30)];
    //lab4.backgroundColor = [UIColor yellowColor];
    lab4.text =@"周四";
    [self.view addSubview:lab4];
    
    UILabel *lab5 = [[UILabel alloc] initWithFrame:CGRectMake(20 + 4*(SCR_W - 40) / 6,y, (SCR_W - 40) / 6, 30)];
   // lab5.backgroundColor = [UIColor yellowColor];
    lab5.text =@"周五";
    [self.view addSubview:lab5];
    
    UILabel *lab6 = [[UILabel alloc] initWithFrame:CGRectMake(20 + 5*(SCR_W - 40) / 6,y, (SCR_W - 40) / 6, 30)];
   // lab6.backgroundColor = [UIColor yellowColor];
    lab6.text =@"周六";
    [self.view addSubview:lab6];
}

-(void)wendu
{
    CGFloat  width   = SCR_W * 0.5;
    CGFloat  height  = SCR_H * 0.1;
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_weaImag.frame)+10, width, height * 0.5)];
    //label1.backgroundColor = [UIColor yellowColor];
    label1.font = [UIFont systemFontOfSize:22];
    label1.textColor = [UIColor whiteColor];
    label1.text = @"多云";
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_weaImag.frame) + 10, width, height * 2)];
    //label2.backgroundColor = [UIColor greenColor];
    label2.font = [UIFont systemFontOfSize:70];
    label2.text = @"28℃";
    label2.textColor = [UIColor whiteColor];
    [self.view addSubview:label1];
    [self.view addSubview:label2];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(SCR_W * 0.6, CGRectGetMaxY(_weaImag.frame) + 30, width, height *0.5)];
    //label3.backgroundColor = [UIColor yellowColor];
    label3.text = @"今天   26℃/21℃";
    [self.view addSubview:label3];
    label3.textColor = [UIColor whiteColor];
    
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(SCR_W * 0.6, CGRectGetMaxY(_weaImag.frame) + 30 + height *0.5, width * 0.4, height *0.5)];
    label4.text = @"多云";
    label4.textColor = [UIColor whiteColor];
    [self.view addSubview:label4];
}

-(void)viewDidAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"1.jpg"] forBarMetrics:UIBarMetricsCompact];
    
    NSLog(@"~~~%@",_array);
}

-(void)weatherPicture
{
    CGFloat x     = SCR_W * 0.2;
    CGFloat width = SCR_W * 0.6;
    CGFloat height = width;
    
    UIImageView *weaimage = [[UIImageView alloc] initWithFrame:CGRectMake(x, x - 10, width, height)];
    weaimage.image = [UIImage imageNamed:@"010"];
    
    
    [self.view addSubview:weaimage];
    _weaImag = weaimage;
}

-(void)createCityName
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 44)];
    
    //label.backgroundColor = [UIColor redColor];
    label.text = @"深圳";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:17];
    label.textColor = [UIColor whiteColor];
    
    self.navigationItem.titleView = label;
    
   
    
    
}


-(void)loaddata
{
    
    
    NSString *url = @"http://wthrcdn.etouch.cn/weather_mini?city=%E5%AE%9C%E6%98%8C";
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
   // session.requestSerializer = [AFJSONRequestSerializer serializer];
    session.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //__weak typeof(self) weakSelf = self;
    
    
    [session GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSData *data = responseObject;
        //
                    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
                    NSMutableArray *arr = [[NSMutableArray alloc] init];
        
                    for (NSDictionary *d in dic[@"data"][@"forecast"]) {
                        weather *weath = [weather weatherWithDict:d];
        
                        [arr addObject:weath];
                    }
                   
                    self.array = arr;
        NSLog(@"%@",_array);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
         NSLog(@"%@",error);
    }];
    
//    
//    [session GET:url
//      parameters:nil
//        progress:nil success:^(NSURLSessionDataTask * task, id  responseObject) {
//            
//            NSData *data = responseObject;
//            
//            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//            
//            NSMutableArray *arr = [[NSMutableArray alloc] init];
//            
//            for (NSDictionary *d in dic[@"data"][@"forecast"]) {
//                weather *weath = [weather weatherWithDict:d];
//                
//                [arr addObject:weath];
//            }
//           
//            self.array = arr;
//
//           
//            
//            
//           // [_array addObject:dic[@"data"][@"forecast"]];
//            //_array = dic[@"forecast"];
//            NSLog(@"%@",_array);
//        } failure:^(NSURLSessionDataTask * task, NSError * error) {
//             NSLog(@"%@",error);
//        }];
    
     NSLog(@"~~~%@",_array);
}






@end
