//
//  GLobal.h
//  iOS开发UI篇-实现UITableView控件数据刷新
//
//  Created by 谢俊伟 on 14-8-7.
//  Copyright (c) 2014年 a. All rights reserved.
//

#ifndef iOS__UI____UITableView_______GLobal_h
#define iOS__UI____UITableView_______GLobal_h

/**
 *  自定义带参数的宏
 */
#define     YYinitH(name)   -(instancetype)initWithDict:(NSDictionary *)dict;\
+(instancetype)herosWithDict:(NSDictionary *)dict;


#define     YYinitM(name)  -(instancetype)initWithDict:(NSDictionary *)dict\
{\
if (self=[super init]) {\
[self setValuesForKeysWithDictionary:dict];\
}\
return self;\
}\
\
+(instancetype)herosWithDict:(NSDictionary *)dict\
{\
return [[self alloc]initWithDict:dict];\
}\



#endif
