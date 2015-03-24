//
//  main.m
//  OC自定义构造方法
//
//  Created by 谢俊伟 on 14-8-2.
//  Copyright (c) 2014年 a. All rights reserved.
//http://www.cnblogs.com/wendingding/p/3706883.html

#import <Foundation/Foundation.h>

#import "Person.h"
#import "Sudent.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        
        Person *person=[[Person alloc]initWithName:@"yangyong"];
        NSLog(@"%@",person.name);
        
        Person *person2=[[Person alloc]initWithName:@"yangyong win" andNo:1];
        NSLog(@"%@ %d",person2.name,person2.no);
        
        Sudent *su=[[Sudent alloc]initWithName:@"yangyong win again" andNo:2 andAge:23];
        NSLog(@"%@,%d,%d",su.name,su.no,su.age);
        
        //NSLog(@"Hello, World!");
        
    }
    return 0;
}

