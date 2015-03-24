//
//  Hero.m
//  iOS开发篇-UITableview控件基本使用
//
//  Created by 谢俊伟 on 14-8-6.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "Hero.h"

@implementation Hero
-(instancetype)initWithDict:(NSDictionary *)dict
{
    self=[super init];
    if (self) {
        self.name=dict[@"name"];
        self.icon=dict[@"icon"];
        self.intro=dict[@"intro"];
    }
    return self;
}
+(instancetype)heroWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
