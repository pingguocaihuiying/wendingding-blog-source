//
//  Person.m
//  OC自定义构造方法
//
//  Created by 谢俊伟 on 14-8-2.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "Person.h"

@implementation Person
-(id)initWithName:(NSString *)name
{
    if (self=[super init]) {
        _name=name;
    }
    return self;
}

//接受两个参数的构造函数
-(id)initWithName:(NSString *)name andNo:(int)no
{
    if (self=[super init]) {
        _name=name;
        _no=no;
    }
    return self;
}
@end
