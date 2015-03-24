//
//  main.m
//  OC语言BLOCK和协议
//
//  Created by 谢俊伟 on 14-8-2.
//  Copyright (c) 2014年 a. All rights reserved.
//http://www.cnblogs.com/wendingding/p/3709604.html

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        //定义一个block类型的变量,打印n条线
        void(^MYblock)(int)=^(int n)
        {
            for (int i=0; i<n; i++) {
                NSLog(@"-------");
            }
        };
        MYblock(5);
        
        //定义一个block类型的变量,接受两个参数,做加法运算
        int (^MYblocka)(int,int)=^(int n1,int n2)
        {
            return n1+n2;
        };
        NSLog(@"%d",MYblocka(10,34));
        
        //利用bolck封装代码
        //接受两个参数的
        int (^MYbolck1)(int,int)=^(int a,int b)
        {return a+b;};
        
        //无参数形式1
        int (^MYblock2)()=^()
        {
            return 10;
        };
        
        //无参数形式2
        int (^MYblock3)()=^
        {return 10;};
        
        Person *p=[[Person alloc]init];
        [p pint];
        [p haha];
        
        //NSLog(@"Hello, World!");
        
    }
    return 0;
}

