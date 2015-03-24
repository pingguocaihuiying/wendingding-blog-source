//
//  Student.m
//  OC方法和文件编译
//
//  Created by 谢俊伟 on 14-8-2.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "Student.h"

@implementation Student

-(void)eat
{
    weight+=1;
    NSLog(@"人吃玩这次体重是%d",weight);
}

-(void)run
{
    weight-=1;
    NSLog(@"人跑完这次体重是%d",weight);
}

-(void)print
{
    NSLog(@"性别=%d,喜欢的颜色:%d,生日%d%d%d,姓名:%@",sex,favColor,birthday.year,birthday.month,birthday.day,name);
}

-(void)weiDog
{
    [dog eat];
}

-(void)liuDog
{
    [dog run];
}

@end
