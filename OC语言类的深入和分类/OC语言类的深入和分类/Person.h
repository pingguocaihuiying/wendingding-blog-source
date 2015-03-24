//
//  Person.h
//  OC自定义构造方法
//
//  Created by 谢俊伟 on 14-8-2.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property NSString *name;
@property int no;
-(id)initWithName:(NSString *)name;
-(id)initWithName:(NSString *)name andNo:(int)no;
@end
