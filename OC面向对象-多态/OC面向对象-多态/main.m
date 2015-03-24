//
//  main.m
//  OC面向对象-多态
//
//  Created by 谢俊伟 on 14-8-2.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Dog.h"
#import "Animal.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        
        //Dog类型的指针指向Dog类型的对象
        Dog *d=[[Dog alloc]init];
        //Dog类对象调用对象方法
        [d eat];
        
        //多态
        //父类对象指向子类对象
        Animal *a=[[Dog alloc]init];
        //动态检测,调用方法时会检测对象的真是类型
        [a eat];
        
        //Animal类型的指针指向Animal类型的对象
        Animal *a1=[[Animal alloc]init];
        [a1 eat];
        
        
        //NSLog(@"Hello, World!");
        
    }
    return 0;
}

