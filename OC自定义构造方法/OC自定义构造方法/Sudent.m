//
//  Sudent.m
//  OC自定义构造方法
//
//  Created by 谢俊伟 on 14-8-2.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "Sudent.h"

@implementation Sudent

-(id)initWithName:(NSString *)name andNo:(int)no andAge:(int)age
{
    //调用父类的构造方法初始化两个变量
    if (self=[super initWithName:name andNo:no]) {
        //初始化自己独有的成员变量
        _age=age;
    }
    return self;
}


@end
