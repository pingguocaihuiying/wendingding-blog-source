//
//  Person.m
//  iOS开发UI篇-KVC简单介绍
//
//  Created by 谢俊伟 on 14-8-5.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "Person.h"

@implementation Person
-(NSString *)description
{
    return [NSString stringWithFormat:@"<%@:%p>,name:%@,age:%d",[self class],self,self.name,self.age];
}
@end
