//
//  MyProtocol.h
//  OC语言BLOCK和协议
//
//  Created by 谢俊伟 on 14-8-2.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import <Foundation/Foundation.h>
//MyProtocol协议
@protocol MyProtocol <NSObject>
//协议中可以声明很多有用的方法
@required
-(void)pint;
-(void)haha;
@end
