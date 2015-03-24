//
//  Book.m
//  iOS开发UI篇-KVC简单介绍
//
//  Created by 谢俊伟 on 14-8-5.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "Book.h"

@implementation Book
- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@,%p>{bookname:%@}", [self class],self,self.bookname];
}
@end
