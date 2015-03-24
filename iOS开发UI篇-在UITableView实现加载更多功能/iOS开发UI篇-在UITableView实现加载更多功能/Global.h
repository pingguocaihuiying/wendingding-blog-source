//
//  Global.h
//  iOS开发UI篇-使用xib自定义UITableViewCell实现一个简单的团购应用界面布局
//
//  Created by 谢俊伟 on 14-8-7.
//  Copyright (c) 2014年 a. All rights reserved.
//

#ifndef iOS__UI____xib___UITableViewCell________________Global_h
#define iOS__UI____xib___UITableViewCell________________Global_h


/**
 *  自定义带参数的宏
 */
#define     YYinitH(name)   -(instancetype)initWithDict:(NSDictionary *)dict;\
+(instancetype)tgWithDict:(NSDictionary *)dict;


#define     YYinitM(name)  -(instancetype)initWithDict:(NSDictionary *)dict\
{\
if (self=[super init]) {\
[self setValuesForKeysWithDictionary:dict];\
}\
return self;\
}\
\
+(instancetype)tgWithDict:(NSDictionary *)dict\
{\
return [[self alloc]initWithDict:dict];\
}\


#endif
