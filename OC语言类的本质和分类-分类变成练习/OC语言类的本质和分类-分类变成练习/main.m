//
//  main.m
//  OC语言类的本质和分类-分类变成练习
//
//  Created by 谢俊伟 on 14-8-2.
//  Copyright (c) 2014年 a. All rights reserved.
//http://www.cnblogs.com/wendingding/p/3709569.html

#import <Foundation/Foundation.h>
#import "NSString+NumberOfs.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        //调用分类中实现的方法
        int a=[NSString NumberOfString:@"123qwe234s"];
        NSLog(@"%d",a);
        
        //调用分类中实现的对象方法
        int b=[@"asd123kk" NumberCount];
        NSLog(@"%d",b);
        //NSLog(@"Hello, World!");
        
    }
    return 0;
}

