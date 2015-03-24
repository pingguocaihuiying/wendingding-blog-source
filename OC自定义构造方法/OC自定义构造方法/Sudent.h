//
//  Sudent.h
//  OC自定义构造方法
//
//  Created by 谢俊伟 on 14-8-2.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "Person.h"

@interface Sudent : Person
@property int age;
-(id)initWithName:(NSString *)name andNo:(int)no andAge:(int)age;

@end
