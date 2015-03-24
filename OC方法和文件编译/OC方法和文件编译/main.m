//
//  main.m
//  OC方法和文件编译
//
//  Created by 谢俊伟 on 14-8-2.
//  Copyright (c) 2014年 a. All rights reserved.
//  http://www.cnblogs.com/wendingding/p/3704724.html

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Dog.h"
#import "jisuanqi.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        
        //创建一个学生类对象
        Student *stu=[[Student alloc]init];
        //对学生类的对象的一些属性进行初始化
        stu->name=@"yangyong";
        stu->sex=SexMan;
        stu->weight=50;
        Date1 d={2014,5,1};
        stu->birthday=d;
        
        //创建一个狗对象
        Dog *dog=[[Dog alloc]init];
        dog->weight=20;
        
        stu->dog=dog;
        //调用学生类对象方法
        [stu print];
        [stu run];
        [stu eat];
        
        //调用狗类对象方法
        [dog eat];
        [dog run];
        
        [stu weiDog];
        [stu liuDog];
        
        int a=[jisuanqi SumOfNumber1:10 AndNumber2:20 AndNumber3:30];
        NSLog(@"和为%d",a);
        
        //NSLog(@"Hello, World!");
        
    }
    return 0;
}

