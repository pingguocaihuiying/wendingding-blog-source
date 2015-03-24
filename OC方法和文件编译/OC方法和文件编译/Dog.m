//
//  Dog.m
//  OC方法和文件编译
//
//  Created by 谢俊伟 on 14-8-2.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "Dog.h"

@implementation Dog

-(void)eat
{
    weight+=1;
    NSLog(@"狗吃完这次体重是%f",weight);
}

-(void)run
{
    weight-=1;
    NSLog(@"狗跑完这次体重是%f",weight);
}

@end
