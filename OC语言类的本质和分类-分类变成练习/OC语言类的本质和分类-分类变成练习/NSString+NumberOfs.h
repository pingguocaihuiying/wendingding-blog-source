//
//  NSString+NumberOfs.h
//  OC语言类的本质和分类-分类变成练习
//
//  Created by 谢俊伟 on 14-8-2.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NumberOfs)
//为NSString类增加一个类方法,计算某个字符串中阿拉伯数字的个数
+(int)NumberOfString:(NSString *)str;
//为NSString类增加一个对象方法,计算某个字符串中阿拉伯数字的个数
-(int)NumberCount;
@end
