//
//  Score.h
//  OC面向对象-封装
//
//  Created by 谢俊伟 on 14-8-2.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import <Foundation/Foundation.h>

//设计一个成绩类
//这个成绩类有以下四个属性
//OC成绩(可读可写)
//C成绩(可读可写)
//总分(可读)
//平均分(可读)

@interface Score : NSObject
{
    int _OCScore;
    int _CScore;
    int _Sum;
    double _average;
}
-(void)setOCScore:(int)ocscore;
-(int)ocscore;
-(void)setCScore:(int)cscore;
-(int)cscore;

-(int)sum;
-(double)average;

@end
