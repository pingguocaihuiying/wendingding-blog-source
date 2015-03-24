//
//  Person.h
//  OC点语法和变量作用域
//
//  Created by 谢俊伟 on 14-8-2.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    int _age;//默认为@protected
}

-(void)setAge:(int)age;
-(int)age;

@end
