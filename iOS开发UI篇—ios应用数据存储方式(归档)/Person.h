//
//  Person.h
//  iOS开发UI篇—ios应用数据存储方式(归档)
//
//  Created by 谢俊伟 on 14-8-11.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>
@property(nonatomic,copy) NSString *name;
@property(nonatomic,assign) int age;
@property(nonatomic,assign) double height;
@end
