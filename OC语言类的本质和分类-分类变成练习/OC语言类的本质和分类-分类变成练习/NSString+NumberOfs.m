//
//  NSString+NumberOfs.m
//  OC语言类的本质和分类-分类变成练习
//
//  Created by 谢俊伟 on 14-8-2.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "NSString+NumberOfs.h"

@implementation NSString (NumberOfs)
+(int)NumberOfString:(NSString *)str
{
    int count=0;
    for (int i=0; i<str.length; i++) {
        unichar c=[str characterAtIndex:i];
        if (c>='0'&&c<='9') {
            count++;
        }
    }
    return count;
}

-(int)NumberCount
{
    int count=0;
    for (int i=0; i<self.length; i++) {
        unichar c=[self characterAtIndex:i];
        if (c>='0'&&c<='9') {
            count++;
        }
    }
    return count;
}
@end
