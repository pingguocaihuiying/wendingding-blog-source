//
//  Score.m
//  OC面向对象-封装
//
//  Created by 谢俊伟 on 14-8-2.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "Score.h"

@implementation Score

-(void)setOCScore:(int)ocscore
{
    _OCScore=ocscore;
    _Sum=_OCScore+_CScore;
    _average=_Sum/2;
}

-(int)ocscore
{
    return _OCScore;
}


-(void)setCScore:(int)cscore
{
    _CScore=cscore;
    _Sum=_OCScore+_CScore;
    _average=_Sum/2;
}

-(int)cscore
{
    return _CScore;
}

-(int)sum
{
    return _Sum;
}

-(double)average
{
    return _average;
}

@end
