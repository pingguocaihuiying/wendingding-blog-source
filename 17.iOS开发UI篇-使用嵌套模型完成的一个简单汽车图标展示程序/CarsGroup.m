//
//  CarsGroup.m
//  iOS开发UI篇-使用嵌套模型完成的一个简单汽车图标展示程序
//
//  Created by 谢俊伟 on 14-8-6.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "CarsGroup.h"
#import "Cars.h"
@implementation CarsGroup
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if(self=[super init])
    {
        //嵌套的字典转模型
        self.title=dict[@"title"];
        //注意
        NSArray *diccars=dict[@"cars"];
        //想下面这样写可以提高性能
        NSMutableArray *arrayM=[NSMutableArray arrayWithCapacity:diccars.count];
        for (NSDictionary *dict in diccars) {
            Cars *cars=[[Cars alloc]initWithDict:dict];
            [arrayM addObject:cars];
        }
        self.cars=arrayM;
    }
    return self;
}
+(instancetype)carsgroupWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
