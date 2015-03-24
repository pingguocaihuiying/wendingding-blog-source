//
//  Student.h
//  OC方法和文件编译
//
//  Created by 谢俊伟 on 14-8-2.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
//设计一个学生类,学生类的属性包括:性别,生日,体重,最新欢的颜色,狗(体重,毛色,吃)
//方法:吃,跑步,遛狗,喂狗

//定义枚举类型:学生的性别
typedef enum
{
    SexMan,
    SexWoman
}Sex;

//定义结构体:生日
typedef struct
{
    int year;
    int month;
    int day;
}Date1;

//定义枚举类型,学生最喜欢的颜色
typedef enum
{
    ColorBlack,
    ColorRed,
    ColorGreen
}Color;

@interface Student : NSObject
{
    @public
    Sex sex;
    Date1 birthday;
    int weight;
    Color favColor;
    Dog *dog;
    NSString *name;
}
-(void)eat;
-(void)run;
-(void)print;
-(void)weiDog;
-(void)liuDog;
@end
