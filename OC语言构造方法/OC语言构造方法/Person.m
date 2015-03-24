//
//  Person.m
//  OC语言构造方法
//
//  Created by 谢俊伟 on 14-8-2.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "Person.h"

@implementation Person

//重写init方法
-(id)init
{
    //1.初始化对象拥有的父类成员变量
    if (self=[super init]) {
        //2.初始化对象自有的成员变量
        _age=10;
    }
    //返回一个已经初始化完成的对象
    return self;
}

@end
