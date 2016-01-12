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

@interface YGweatherViewController ()

@property (nonatomic,strong) UIImageView *weaImag;
@property (nonatomic,strong) NSMutableArray *array;
@property (nonatomic,strong) NSMutableDictionary *dict;

@property (nonatomic,strong) weather *w;

@end

@implementation YGweatherViewController


/*隐藏导航栏*/
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;
}

-(void)backBtn
{
    UIButton *btn =[[UIButton alloc] initWithFrame:CGRectMake(10, 30, 20, 20)];
    [btn setBackgroundImage:[UIImage imageNamed:@"后退"] forState:UIControlStateNormal];;
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)btnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    img.image = [UIImage imageNamed:@"背景3"];
    
    [self.view addSubview:img];
    [self backBtn];
   [self loaddata];
    
    //1.添加城市名
    [self createCityName];
    
    //2.创建天气图
    [self weatherPicture];
    
    //3.温度
  //  [self wendu];
    
    //4.一周温度表
  //  [self list];
    
    
}

-(void)list
{
   
    
    //CGFloat width = (SCR_W - 40/3) / 6;
    // NSLog(@"1212~~~%@",_array);
    weather *wea1 = [[weather alloc] init];
    wea1 = _array[0];
    //NSString *dat = _dict[@"date"];
    
    CGFloat y = CGRectGetMaxY(_weaImag.frame) + SCR_H * 0.28;
    UIImageView *img2 = [[UIImageView alloc] initWithFrame:CGRectMake(14, y-14, SCR_W - 28, 200)];
    img2.image = [UIImage imageNamed:@"3"];
    [self.view addSubview:img2];
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(80/3 ,y, (SCR_W - 40) / 6, 30)];
    //lab.backgroundColor = [UIColor yellowColor];
    lab.textAlignment = NSTextAlignmentLeft;
    lab.text =@"  昨天";
    lab.font = [UIFont systemFontOfSize:17];
    lab.textColor = [UIColor whiteColor];
    UILabel *lab11 = [[UILabel alloc] initWithFrame:CGRectMake(80/3, y + 30, (SCR_W - 40) / 6, 30)];
    lab11.text = [NSString stringWithFormat:@"   %@",_dict[@"type"]];
    lab11.font = [UIFont systemFontOfSize:11];
    //lab11.textAlignment = NSTextAlignmentCenter;
    lab11.textColor = [UIColor whiteColor];
    UIImageView *image1 = [[UIImageView alloc] initWithFrame:CGRectMake(80/3, y +(SCR_W - 40) / 4, (SCR_W - 40) / 8, (SCR_W - 40) / 8)];
    
  //  image1.backgroundColor = [UIColor redColor];
    image1.image = [UIImage imageNamed:@"002"];
    image1.contentMode = UIViewContentModeScaleAspectFill;
    UILabel *label111 = [[UILabel alloc] initWithFrame:CGRectMake(80/3, y + 150,  (SCR_W - 40) / 6, 30)];
    NSString *high1 = [_dict[@"high"] substringWithRange:NSMakeRange(3, 1)];
    NSString *low1 = [_dict[@"low"] substringFromIndex:2];
    label111.text = [NSString stringWithFormat:@"  %@/%@",high1,low1];
    label111.font = [UIFont systemFontOfSize:11];
    label111.textColor = [UIColor whiteColor];
    [self.view addSubview:label111];
    [self.view addSubview:image1];
    [self.view addSubview:lab11];
    [self.view addSubview:lab];
    
    weather *wea2 = [[weather alloc] init];
    wea2 = _array[0];
    UILabel *lab2 = [[UILabel alloc] initWithFrame:CGRectMake(80/3 + (SCR_W - 40) / 6,y, (SCR_W - 40) / 6, 30)];
   // lab2.backgroundColor = [UIColor redColor];
    lab2.text = @"  今天";
    lab2.font = [UIFont systemFontOfSize:17];
    lab2.textColor = [UIColor whiteColor];
    UILabel *label22 = [[UILabel alloc] initWithFrame:CGRectMake(80/3 + (SCR_W - 40) / 6,  y + 30, (SCR_W - 40) / 6, 30)];
    label22.text = [NSString stringWithFormat:@"   %@",wea2.type];
    label22.font = [UIFont systemFontOfSize:11];
    label22.textColor = [UIColor whiteColor];
    UIImageView *image2 = [[UIImageView alloc] initWithFrame:CGRectMake(80/3 + (SCR_W - 40) / 6, y +(SCR_W - 40) / 4, (SCR_W - 40) / 8, (SCR_W - 40) / 8)];
    
  //  image2.backgroundColor = [UIColor blueColor];
    image2.image = [UIImage imageNamed:@"001"];
    image2.contentMode = UIViewContentModeScaleAspectFill;
     UILabel *label222 = [[UILabel alloc] initWithFrame:CGRectMake(80/3 +(SCR_W - 40) / 6, y + 150,  (SCR_W - 40) / 6, 30)];
    NSString *high2 = [wea2.high substringWithRange:NSMakeRange(3, 1)];
    NSString *low2 = [wea2.low substringFromIndex:2];
    label222.text = [NSString stringWithFormat:@"  %@/%@",high2,low2];
    label222.font = [UIFont systemFontOfSize:11];
    label222.textColor = [UIColor whiteColor];
    UIImageView *image22 = [[UIImageView alloc] initWithFrame:CGRectMake(80/3 +(SCR_W - 40) / 6, y-14, 1, 198)];
    image22.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:image22];
    [self.view addSubview:label222];
    [self.view addSubview:image2];
    [self.view addSubview:lab2];
    [self.view addSubview:label22];
    
    weather *wea3 = [[weather alloc] init];
    wea3 = _array[1];
    UILabel *lab3 = [[UILabel alloc] initWithFrame:CGRectMake(80/3 + 2*(SCR_W - 40) / 6,y, (SCR_W - 40) / 6, 30)];
   // lab3.backgroundColor = [UIColor yellowColor];
    lab3.text =@"  明天";
    lab3.font = [UIFont systemFontOfSize:17];
    lab3.textColor = [UIColor whiteColor];
    UILabel *lab33 = [[UILabel alloc] initWithFrame:CGRectMake(80/3 + 2*(SCR_W - 40) / 6, y + 30, (SCR_W - 40) / 6, 30)];
    lab33.text = [NSString stringWithFormat:@"   %@",wea3.type];
    lab33.font = [UIFont systemFontOfSize:11];
    lab33.textColor = [UIColor whiteColor];
    UIImageView *image3 = [[UIImageView alloc] initWithFrame:CGRectMake(80/3 + 2*(SCR_W - 40) / 6, y +(SCR_W - 40) / 4, (SCR_W - 40) / 8, (SCR_W - 40) / 8)];
    
   // image3.backgroundColor = [UIColor yellowColor];
    image3.image = [UIImage imageNamed:@"003"];
    image3.contentMode = UIViewContentModeScaleAspectFill;
    UILabel *label333 = [[UILabel alloc] initWithFrame:CGRectMake(80/3 +2 *(SCR_W - 40) / 6, y + 150,  (SCR_W - 40) / 6, 30)];
    NSString *high3 = [wea3.high substringWithRange:NSMakeRange(3, 1)];
    NSString *low3 = [wea3.low substringFromIndex:2];
    label333.text = [NSString stringWithFormat:@"  %@/%@",high3,low3];
    label333.font = [UIFont systemFontOfSize:11];
    label333.textColor = [UIColor whiteColor];
    UIImageView *image33 = [[UIImageView alloc] initWithFrame:CGRectMake(80/3 + 2 *(SCR_W - 40) / 6, y-14, 1, 198)];
    image33.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:image33];
    [self.view addSubview:label333];
    [self.view addSubview:image3];
    [self.view addSubview:lab3];
    [self.view addSubview:lab33];
    
    weather *wea4 = [[weather alloc] init];
    wea4 = _array[2];
    UILabel *lab4 = [[UILabel alloc] initWithFrame:CGRectMake(80/3 + 3*(SCR_W - 40) / 6,y, (SCR_W - 40) / 6, 30)];
    //lab4.backgroundColor = [UIColor yellowColor];
    
    NSString *w4 = wea4.date;
    
    for (int i=0; i<7; i++) {
        NSArray *arr4 = @[@"一",@"二",@"三",@"四",@"五",@"六",@"天"];
        
        if ([w4 rangeOfString:arr4[i]].location != NSNotFound) {
            
            lab4.text = [NSString stringWithFormat:@"  周%@",arr4[i]];
           // NSLog(@"%@",arr4[i]);
        }
    }
    
   // lab4.text =[wea4.date substringFromIndex:3];
    lab4.font = [UIFont systemFontOfSize:17];
    lab4.textColor = [UIColor whiteColor];
    UILabel *lab44 = [[UILabel alloc] initWithFrame:CGRectMake(80/3 + 3*(SCR_W - 40) / 6, y + 30, (SCR_W - 40) / 6, 30)];
    lab44.text = [NSString stringWithFormat:@"   %@",wea4.type];
    lab44.font = [UIFont systemFontOfSize:11];
    lab44.textColor = [UIColor whiteColor];
    UIImageView *image4 = [[UIImageView alloc] initWithFrame:CGRectMake(80/3 + 3*(SCR_W - 40) / 6,y +(SCR_W - 40) / 4, (SCR_W - 40) / 8, (SCR_W - 40) / 8)];
    
   // image4.backgroundColor = [UIColor blueColor];
    image4.image = [UIImage imageNamed:@"001"];
    image4.contentMode = UIViewContentModeScaleAspectFill;
    UILabel *label444 = [[UILabel alloc] initWithFrame:CGRectMake(80/3 +3*(SCR_W - 40) / 6, y + 150,  (SCR_W - 40) / 6, 30)];
    NSString *high4 = [wea4.high substringWithRange:NSMakeRange(3, 1)];
    NSString *low4 = [wea4.low substringFromIndex:2];
    label444.text = [NSString stringWithFormat:@"  %@/%@",high4,low4];
    label444.font = [UIFont systemFontOfSize:11];
    label444.textColor = [UIColor whiteColor];
    UIImageView *image44 = [[UIImageView alloc] initWithFrame:CGRectMake(80/3 + 3 *(SCR_W - 40) / 6, y-14, 1, 198)];
    image44.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:image44];
    [self.view addSubview:label444];
    [self.view addSubview:image4];
//    [self.view addSubview:lab3];
//    [self.view addSubview:lab33];
    [self.view addSubview:lab44];
    [self.view addSubview:lab4];
    
    weather *wea5 = [[weather alloc] init];
    wea5 = _array[3];
    UILabel *lab5 = [[UILabel alloc] initWithFrame:CGRectMake(80/3 + 4*(SCR_W - 40) / 6,y, (SCR_W - 40) / 6, 30)];
   // lab5.backgroundColor = [UIColor yellowColor];
    
    NSString *w5 = wea5.date;
    
    for (int i=0; i<7; i++) {
        NSArray *arr5 = @[@"一",@"二",@"三",@"四",@"五",@"六",@"天"];
        
        if ([w5 rangeOfString:arr5[i]].location != NSNotFound) {
         
            lab5.text = [NSString stringWithFormat:@"  周%@",arr5[i]];
            NSLog(@"%@",arr5[i]);
        }
    }
    
   // lab5.text =[wea5.date substringFromIndex:3];
    lab5.font = [UIFont systemFontOfSize:17];
    lab5.textColor = [UIColor whiteColor];
    UILabel *lab55 = [[UILabel alloc] initWithFrame:CGRectMake(80/3 + 4*(SCR_W - 40) / 6, y + 30, (SCR_W - 40) / 6, 30)];
    lab55.text = [NSString stringWithFormat:@"   %@",wea5.type];
    lab55.font = [UIFont systemFontOfSize:11];
    lab55.textColor = [UIColor whiteColor];
    UIImageView *image5 = [[UIImageView alloc] initWithFrame:CGRectMake(80/3 + 4*(SCR_W - 40) / 6, y +(SCR_W - 40) / 4, (SCR_W - 40) / 8, (SCR_W - 40) / 8)];
    
    //image5.backgroundColor = [UIColor redColor];
    image5.image = [UIImage imageNamed:@"007"];
    image5.contentMode = UIViewContentModeScaleAspectFill;
    UILabel *label555 = [[UILabel alloc] initWithFrame:CGRectMake(80/3 + 4*(SCR_W - 40) / 6, y + 150,  (SCR_W - 40) / 6, 30)];
    NSString *high5 = [wea5.high substringWithRange:NSMakeRange(3, 1)];
    NSString *low5 = [wea5.low substringFromIndex:2];
    label555.text = [NSString stringWithFormat:@"  %@/%@",high5,low5];
    label555.font = [UIFont systemFontOfSize:11];
    label555.textColor = [UIColor whiteColor];
    UIImageView *image55 = [[UIImageView alloc] initWithFrame:CGRectMake(80/3 + 4 *(SCR_W - 40) / 6, y-14, 1, 198)];
    image55.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:image55];
    [self.view addSubview:label555];
    [self.view addSubview:image5];
//    [self.view addSubview:lab3];
//    [self.view addSubview:lab33];
    [self.view addSubview:lab55];
    [self.view addSubview:lab5];
    
    weather *wea6 = [[weather alloc] init];
    wea6 = _array[4];
    UILabel *lab6 = [[UILabel alloc] initWithFrame:CGRectMake(80/3 + 5*(SCR_W - 40) / 6,y, (SCR_W - 40) / 6, 30)];
   // lab6.backgroundColor = [UIColor yellowColor];
    lab6.textColor = [UIColor whiteColor];
    
    NSString *w6 = wea6.date;
    
    for (int i=0; i<7; i++) {
        NSArray *arr6 = @[@"一",@"二",@"三",@"四",@"五",@"六",@"天"];
        // NSString *s = @"星期五";
        //    NSLog(@"%@",arr[i]);
        
        if ([w6 rangeOfString:arr6[i]].location != NSNotFound) {
            //NSLog(@"这个字符串有%@",arr[i]);
            lab6.text = [NSString stringWithFormat:@"  周%@",arr6[i]];
            NSLog(@"%@",arr6[i]);
        }
    }
    
   // lab6.text =[wea6.date substringFromIndex:3];
    lab6.font = [UIFont systemFontOfSize:17];
    UILabel *lab66 = [[UILabel alloc] initWithFrame:CGRectMake(80/3 + 5*(SCR_W - 40) / 6, y + 30, (SCR_W - 40) / 6, 30)];
    lab66.text = [NSString stringWithFormat:@"   %@",wea6.type];
    lab66.font = [UIFont systemFontOfSize:11];
    lab66.textColor = [UIColor whiteColor];
    
    UIImageView *image6 = [[UIImageView alloc] initWithFrame:CGRectMake(80/3 + 5*(SCR_W - 40) / 6, y +(SCR_W - 40) / 4, (SCR_W - 40) / 8, (SCR_W - 40) / 8)];
    
   // image6.backgroundColor = [UIColor blueColor];
    image6.image = [UIImage imageNamed:@"008"];
    image6.contentMode = UIViewContentModeScaleAspectFill;
    UILabel *label666 = [[UILabel alloc] initWithFrame:CGRectMake(80/3 + 5*(SCR_W - 40) / 6, y + 150,  (SCR_W - 40) / 6, 30)];
    NSString *high6 = [wea6.high substringWithRange:NSMakeRange(3, 1)];
    NSString *low6 = [wea6.low substringFromIndex:2];
    label666.text = [NSString stringWithFormat:@"  %@/%@",high6,low6];
    label666.font = [UIFont systemFontOfSize:11];
    label666.textColor = [UIColor whiteColor];
    UIImageView *image66 = [[UIImageView alloc] initWithFrame:CGRectMake(80/3 + 5 *(SCR_W - 40) / 6, y-14, 1, 198)];
    image66.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:image66];
    [self.view addSubview:label666];
    [self.view addSubview:image6];
//    [self.view addSubview:lab3];
//    [self.view addSubview:lab33];
    [self.view addSubview:lab66];
    [self.view addSubview:lab6];
    
    
   // 添加黑色框框
    
 
}

-(void)wendu
{
    weather *wea = [[weather alloc] init];
    wea = _array[0];
    
    CGFloat  width   = SCR_W * 0.5;
    CGFloat  height  = SCR_H * 0.1;
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(80/3, CGRectGetMaxY(_weaImag.frame)+44, width, height * 0.5)];
   // label1.backgroundColor = [UIColor yellowColor];
    label1.font = [UIFont systemFontOfSize:24];
    label1.textColor = [UIColor whiteColor];
    label1.text = wea.type;
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(80/3, CGRectGetMaxY(_weaImag.frame) + 44 +height * 0.5, width, height )];
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(80/3, CGRectGetMaxY(_weaImag.frame) + 10 +height * 0.5, width, height * 2)];

   // label2.backgroundColor = [UIColor greenColor];
    label2.font = [UIFont systemFontOfSize:67];
    label2.textAlignment = NSTextAlignmentLeft;
    NSString *a = wea.high;
    NSString *b = [a substringFromIndex:3];
    NSString *c = wea.low;
    NSString *d = [c substringFromIndex:2];
    label2.text = b;
    label2.textColor = [UIColor whiteColor];
    [self.view addSubview:label1];
    [self.view addSubview:label2];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(SCR_W * 0.6, CGRectGetMaxY(_weaImag.frame) + 64, width, height *0.5)];
    //label3.backgroundColor = [UIColor yellowColor];
    label3.text = [NSString stringWithFormat:@"今天  %@/%@",b,d];
    label3.font = [UIFont systemFontOfSize:19];
    [self.view addSubview:label3];
    label3.textColor = [UIColor whiteColor];
    
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(SCR_W * 0.6, CGRectGetMaxY(_weaImag.frame) + 64 + height *0.5, width * 0.4, height *0.5)];
    label4.text = wea.type;
    label4.font = [UIFont systemFontOfSize:19];
    label4.textColor = [UIColor whiteColor];
    [self.view addSubview:label4];
    
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(SCR_W * 0.6 + width * 0.4, CGRectGetMaxY(_weaImag.frame) + 64 + height *0.5, height *0.5, height *0.5)];
    
    //imageV.backgroundColor = [UIColor redColor];
    imageV.image = [UIImage imageNamed:@"003"];
    [self.view addSubview:imageV];
}




-(void)weatherPicture
{
    CGFloat x     = (SCR_W - 490/3)*0.5;
    CGFloat width =  490/3;
    CGFloat height = 612/3;
    
    UIImageView *weaimage = [[UIImageView alloc] initWithFrame:CGRectMake(x, 64 + 30, width, height)];
    weaimage.image = [UIImage imageNamed:@"004"];
    weaimage.contentMode = UIViewContentModeScaleAspectFill;
   // weaimage.backgroundColor = [UIColor redColor];
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        
                    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
                    NSMutableArray *arr = [[NSMutableArray alloc] init];
        
                    for (NSDictionary *d in dic[@"data"][@"forecast"]) {
                        weather *weath = [weather weatherWithDict:d];
        
                        [arr addObject:weath];
                    }
        
                    _dict = dic[@"data"][@"yesterday"];
        
                   _array = arr;
                    
                   // self.w = _array[0];
                    [self wendu];
                    [self list];

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
   
    
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
//            _dict = dic[@"data"][@"yesterday"];
//           
//           _array = arr;
//            
//           // self.w = _array[0];
//            [self wendu];
//            [self list];
//        
//            
//            
//           // [_array addObject:dic[@"data"][@"forecast"]];
//            //_array = dic[@"forecast"];
//            NSLog(@"%@",_array);
//        } failure:^(NSURLSessionDataTask * task, NSError * error) {
//             NSLog(@"%@",error);
//        }];
    
    
    
    // NSLog(@"~~~%@",_array);
}
















/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
