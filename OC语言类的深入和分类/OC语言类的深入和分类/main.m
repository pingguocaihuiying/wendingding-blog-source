//
//  main.m
//  OC语言类的深入和分类
//
//  Created by 谢俊伟 on 14-8-2.
//  Copyright (c) 2014年 a. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "Person.h"
#import "Person+YY.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        Person *person=[[Person alloc]init];
        //调用分类中的方法
        [person study];
        //NSLog(@"Hello, World!");
        
    }
    return 0;
}

