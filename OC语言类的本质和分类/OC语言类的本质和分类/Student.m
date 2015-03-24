//
//  Student.m
//  OC语言类的本质和分类
//
//  Created by 谢俊伟 on 14-8-2.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "Student.h"

@implementation Student
//重写类的加载和初始化方法
+(void)load
{
    NSLog(@"Student+load");
}
+(void)initialize
{
    NSLog(@"Student+initialize");
}
@end
