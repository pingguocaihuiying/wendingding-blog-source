//
//  AppInfo.m
//  iOS开发UI篇-在UITableView的应用中使用动态单元格来完成app应用程序管理界面的搭建
//
//  Created by 谢俊伟 on 14-8-9.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "AppInfo.h"

@implementation AppInfo
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)appInfoWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
