//
//  weather.h
//  wisdomTown
//
//  Created by huang on 16/1/6.
//  Copyright © 2016年 ygzy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface weather : NSObject

@property (nonatomic, strong) NSString *high;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *low;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *fengli;

-(instancetype)initWithDict:(NSDictionary *)dict;

+(instancetype)weatherWithDict:(NSDictionary *)dict;

@end
