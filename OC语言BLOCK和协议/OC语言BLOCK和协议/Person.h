//
//  Person.h
//  OC语言BLOCK和协议
//
//  Created by 谢俊伟 on 14-8-2.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import <Foundation/Foundation.h>

//在类的声明中加入协议的头文件
#import "MyProtocol.h"
@interface Person : NSObject <MyProtocol>


@end
