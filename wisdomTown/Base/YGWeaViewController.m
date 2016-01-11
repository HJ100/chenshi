//
//  YGWeaViewController.m
//  wisdomTown
//
//  Created by lily on 16/1/7.
//  Copyright © 2016年 ygzy. All rights reserved.
//

#import "YGWeaViewController.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "weather.h"
#import "weakView.h"

@interface YGWeaViewController ()
/**天气最大图标*/
@property (weak, nonatomic) IBOutlet UIImageView *bigImag;
/**左边天气状况：阵雨*/
@property (weak, nonatomic) IBOutlet UILabel *labelWeather;
/** 左边温度*/
@property (weak, nonatomic) IBOutlet UILabel *labelWendu;
/** 当天：今天*/
@property (weak, nonatomic) IBOutlet UILabel *labelDay;
/**当天温度区间*/
@property (weak, nonatomic) IBOutlet UILabel *labelWenArea;
/**当天天气状况描述*/
@property (weak, nonatomic) IBOutlet UILabel *labelWeatherArea;
/**天气小图标*/
@property (weak, nonatomic) IBOutlet UIImageView *smallImg;
/**透明的背景图*/
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImg;

@property (nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation YGWeaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}
/*隐藏导航栏*/
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;
}

//后退按钮点击事件
- (IBAction)backBtn:(UIButton *)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}


/**加载数据*/
-(void)loadData
{
    
     NSString *url = @"http://wthrcdn.etouch.cn/weather_mini?city=%E5%AE%9C%E6%98%8C";

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *forecastArr = dict[@"data"][@"forecast"];
        
        NSString *dataStr ;
        NSMutableArray *dataA = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dic in forecastArr) {
//            weather *wea  =[[weather alloc] initWithDict:dic];
//            [self.dataSource addObject:wea];
            
            self.labelWeather.text = dic[@"type"];
            self.labelWendu.text =  [dic[@"high"] substringFromIndex:3] ;
            self.labelWeatherArea.text = dic[@"fengli"];
            self.labelWenArea.text = [self.labelWendu.text stringByAppendingString:[NSString stringWithFormat:@"/%@",[dic[@"low"] substringFromIndex:3]]];
            dataStr=[dic[@"date"] substringFromIndex:3];
//            daNSLog(@"%@",self.labelWeather.text);
        
        }
        
        [dataA addObject:dataStr];
        
         CGFloat width = (CGRectGetWidth(self.backgroundImg.frame)-5.f)/6.f;
        NSArray *dataArr =@[@"昨天",@"今天",@"明天",];
        
        for (int i=0; i<6; i++) {
        weakView *weakV =[[weakView alloc] initWithFrame:CGRectMake(i*(width+1)+10, 20+424, width,233)];
            weakV.labelType.text = self.labelWeather.text;
            weakV.labelArea.text = self.labelWenArea.text;
            
            if (i>=3) {
                weakV.labelData.text = dataStr;
            }
            else{
                weakV.labelData.text =dataArr[i];
            }
            [self.view addSubview:weakV];
        }
  
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error.localizedDescription);
    }];
}

/**一星期的天气状况*/
-(void)addView
{
   
}

-(NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource =[[NSMutableArray alloc] init];
        
    }
    return _dataSource;
}






@end
