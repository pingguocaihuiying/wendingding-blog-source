//
//  Cars.m
//  iOS开发UI篇-使用嵌套模型完成的一个简单汽车图标展示程序
//
//  Created by 谢俊伟 on 14-8-6.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "Cars.h"

@implementation Cars
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self=[super init]) {
        self.name=dict[@"name"];
        self.icon=dict[@"icon"];
    }
    return self;
}
+(instancetype)carsWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
