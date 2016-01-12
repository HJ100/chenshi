//
//  weather.m
//  wisdomTown
//
//  Created by huang on 16/1/6.
//  Copyright © 2016年 ygzy. All rights reserved.
//

#import "weather.h"

@implementation weather

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.high = dict[@"high"];
        self.type = dict[@"type"];
        self.low = dict[@"low"];
        self.date = dict[@"date"];
        self.fengli =dict[@"fengli"];
    }
    return self;
}


+(instancetype)weatherWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
