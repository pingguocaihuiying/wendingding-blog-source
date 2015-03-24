//
//  AppInfo.h
//  iOS开发UI篇-字典转模型
//
//  Created by 谢俊伟 on 14-8-5.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppInfo : NSObject
//应用程序名称
@property(nonatomic,copy)NSString *name;
//应用程序图标
@property(nonatomic,copy)NSString *icon;

@property(nonatomic,strong,readonly)UIImage *image;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)appInfoWithDict:(NSDictionary *)dict;
+(NSArray *)appinfoarray;
@end
