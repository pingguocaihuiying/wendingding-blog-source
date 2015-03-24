//
//  AppInfo.m
//  iOS开发UI篇-字典转模型
//
//  Created by 谢俊伟 on 14-8-5.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "AppInfo.h"

@interface AppInfo()
{
    UIImage *_image;
}

@end

@implementation AppInfo

-(instancetype)initWithDict:(NSDictionary *)dict
{
    self=[super init];
    if (self) {
        self.name=dict[@"name"];
        self.icon=dict[@"icon"];
    }
    return self;
}

+(instancetype)appInfoWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];;
}

-(UIImage *)image
{
    if (!_image) {
        _image=[UIImage imageNamed:self.icon];
    }
    return _image;
}

+(NSArray *)appinfoarray
{
    NSString *path=[[NSBundle mainBundle]pathForResource:@"app.plist" ofType:nil];
    NSArray *arrayM=[NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *appinfoarray=[NSMutableArray array];
    
    for (NSDictionary *dict in arrayM) {
        [appinfoarray addObject:[AppInfo appInfoWithDict:dict]];
    }
    return appinfoarray;
}


@end
