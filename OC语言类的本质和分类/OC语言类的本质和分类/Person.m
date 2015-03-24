//
//  Person.m
//  OC语言类的本质和分类
//
//  Created by 谢俊伟 on 14-8-2.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "Person.h"

@implementation Person
//重写类的加载和初始化方法
+(void)load
{
    NSLog(@"Person+load");
}
+(void)initialize
{
    NSLog(@"Person+initialize");
}
@end
