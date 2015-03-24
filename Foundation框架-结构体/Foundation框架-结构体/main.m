//
//  main.m
//  Foundation框架-结构体
//
//  Created by 谢俊伟 on 14-8-3.
//  Copyright (c) 2014年 a. All rights reserved.
//http://www.cnblogs.com/wendingding/p/3710820.html

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        
        //在Foundation框架中常用的四种结构体
        //NSRange(location length)  表示范围
        //NSPoint/CGPoint           表示坐标
        //NSSize/CGSize             表示UI元素的尺寸
        //NSRect/CGRest(CGPoint CGSize) 一个UI元素的位置和尺寸
        
        //NSRange的基本是用
        //结构体类Date的定义
        struct Date
        {
            int year;
            int month;
            int day;
        };
        
        //创建一个Date类型的结构体变量,在创建的时候为变量赋值
        //第一种方式
        struct Date d1={2014,1,1};
        //第二种方式
        struct Date d2={.month=10,.year=2013,.day=20};
        
        //使用NSRange创建变量
        NSRange r1={2,4};//这种方式可读性不好
        NSRange r2={.location=2,.length=4};//代码显得比较多余
        NSRange r3=NSMakeRange(2, 4);//工作中使用的方式,要求掌握
        
        NSString *str=@"aaaaaayunaaaaaa";
        
        //查找某个字符串在str中的范围
        //如果找不到,length=0,location=NSNotFound==-1
        NSRange range=[str rangeOfString:@"yun"];
        NSLog(@"%ld,%ld",range.location,range.length);
        //-------------------------------------------
        //NSPoint/CGPoint的使用
        //NSPoint/CGPoint   表示坐标
        //开发中常使用CGPoint,因为它是跨平台的
        //创建结构体变量
        CGPoint p1=NSMakePoint(10, 10);
        NSPoint p2=CGPointMake(20, 20);
        //-------------------------------------------
        //NSSize/CGSize的使用
        //NSSize/CGSize表示UI元素的尺寸(宽度,高度)
        //创建结构体变量
        NSSize s1=CGSizeMake(100, 50);
        NSSize s2=NSMakeSize(100, 50);
        CGSize s3=NSMakeSize(200, 50);
        //-------------------------------------------
        //NSRect/CGRect 一个UI元素的位置和尺寸
        //第一种方式
        CGRect r5=CGRectMake(0, 0, 100, 50);
        //第二种方式
        CGRect r6={{0,0},{100,50}};
        //第三种方式
        CGRect r7={p1,s2};
        //第四种方式,使用Zero
        CGRect r8={CGPointZero,CGSizeMake(100, 90)};
        
        //常规使用
        NSLog(@"%f,%f,%f,%f,",r8.origin.x,r8.origin.y,r8.size.width,r8.size.height);
        //利用框架函数将结构体转为字符串
        NSString *str1=NSStringFromPoint(p1);//将坐标点转为字符串
        NSString *str2=NSStringFromSize(s3);//将尺寸转为字符串
        NSString *str3=NSStringFromRect(r5) ;//将位置和尺寸转为字符串
        //NSString *str4=NSStringFromRange(<#NSRange range#>)
        //-------------------------------------------
        //Foundation框架中一些经常用到的结构体函数
        //比较两个点是否相同
        BOOL b=CGPointEqualToPoint(CGPointMake(10, 10), CGPointMake(10, 10));
        //比较两块区域是否相同
        //CGRectEqualToRect(<#CGRect rect1#>, <#CGRect rect2#>)
        //比较两个尺寸是否相同
        //CGSizeEqualToSize(<#CGSize size1#>, <#CGSize size2#>)
        //判断点是否在区域范围内
        BOOL b2=CGRectContainsPoint(CGRectMake(50, 40, 100, 50), CGPointMake(60, 45));
        
        
        
        
        //NSLog(@"Hello, World!");
        
    }
    return 0;
}




