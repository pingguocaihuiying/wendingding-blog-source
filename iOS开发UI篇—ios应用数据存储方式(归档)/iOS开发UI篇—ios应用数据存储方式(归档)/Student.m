//
//  Student.m
//  iOS开发UI篇—ios应用数据存储方式(归档)
//
//  Created by 谢俊伟 on 14-8-11.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "Student.h"

@implementation Student
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeFloat:self.weight forKey:@"weight"];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self=[super initWithCoder:aDecoder]) {
        self.weight=[aDecoder decodeFloatForKey:@"weight"];
    }
    return self;
}
@end
