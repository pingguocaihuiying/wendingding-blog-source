//
//  main.m
//  OC语言构造方法
//
//  Created by 谢俊伟 on 14-8-2.
//  Copyright (c) 2014年 a. All rights reserved.
//http://www.cnblogs.com/wendingding/p/3706883.html

#import <Foundation/Foundation.h>
#import "Student.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        Student *stu=[[Student alloc]init];
        NSLog(@"%d,%d",stu.age,stu.no);
        //NSLog(@"Hello, World!");
        
    }
    return 0;
}

