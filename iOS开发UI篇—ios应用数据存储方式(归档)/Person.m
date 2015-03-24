//
//  Person.m
//  iOS开发UI篇—ios应用数据存储方式(归档)
//
//  Created by 谢俊伟 on 14-8-11.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInteger:self.age forKey:@"age"];
    [aCoder encodeDouble:self.height forKey:@"height"];
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self=[super init]) {
        self.name=[aDecoder decodeObjectForKey:@"name"];
        self.age=[aDecoder decodeIntegerForKey:@"age"];
        self.height=[aDecoder decodeDoubleForKey:@"height"];
    }
    return self;
}
@end
