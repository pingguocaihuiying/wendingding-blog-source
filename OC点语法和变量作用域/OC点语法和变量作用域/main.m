//
//  main.m
//  OC点语法和变量作用域
//
//  Created by 谢俊伟 on 14-8-2.
//  Copyright (c) 2014年 a. All rights reserved.
//http://www.cnblogs.com/wendingding/p/3705658.html

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        Person *person=[[Person alloc]init];
        person.age=10;//点语法,等效于[person setAge:10];
        //这里并不是给person的属性赋值,而是调用person的setAge方法
        int age=person.age;//等效于int age=[person age]
        NSLog(@"age is %i",age);
        //NSLog(@"Hello, World!");
        
    }
    return 0;
}

