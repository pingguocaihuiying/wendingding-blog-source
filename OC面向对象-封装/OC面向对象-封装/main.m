//
//  main.m
//  OC面向对象-封装
//
//  Created by 谢俊伟 on 14-8-2.
//  Copyright (c) 2014年 a. All rights reserved.
//http://www.cnblogs.com/wendingding/p/3705219.html

#import <Foundation/Foundation.h>
#import "Score.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        
        Score *score=[[Score alloc]init];
        [score setOCScore:80];
        [score setCScore:90];
        
        NSLog(@"sum=%d",[score sum]);
        NSLog(@"avg=%.2f",[score average]);
        
        [score setCScore:100];
        NSLog(@"sum=%d",[score sum]);
        NSLog(@"avg=%.2f",[score average]);
        
        
        //NSLog(@"Hello, World!");
        
    }
    return 0;
}

