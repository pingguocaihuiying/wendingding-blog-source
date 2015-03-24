//
//  Student.m
//  OC语言构造方法
//
//  Created by 谢俊伟 on 14-8-2.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "Student.h"

@implementation Student
-(id)init
{
    //1.初始化对象拥有的父类成员变量,调用父类的构造方法,把年龄设置为10
    if (self=[super init]) {
        //2.初始化对象自有的成员变量,设置no的值为1
        _no=1;
    }
    return self;
}
@end
