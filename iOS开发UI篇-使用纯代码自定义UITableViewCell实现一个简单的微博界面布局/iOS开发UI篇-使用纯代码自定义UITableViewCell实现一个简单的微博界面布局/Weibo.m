//
//  Weibo.m
//  iOS开发UI篇-使用纯代码自定义UITableViewCell实现一个简单的微博界面布局
//
//  Created by 谢俊伟 on 14-8-7.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "Weibo.h"

@implementation Weibo

-(id)initWithDict:(NSDictionary *)dict
{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(id)weiboWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

@end
