//
//  AppInfo.h
//  iOS开发UI篇-在UITableView的应用中使用动态单元格来完成app应用程序管理界面的搭建
//
//  Created by 谢俊伟 on 14-8-9.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppInfo : NSObject
@property(nonatomic,copy) NSString *size;
@property(nonatomic,copy) NSString *download;
@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *name;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)appInfoWithDict:(NSDictionary *)dict;
@end
