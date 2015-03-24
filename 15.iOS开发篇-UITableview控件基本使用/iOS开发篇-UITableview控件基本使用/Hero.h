//
//  Hero.h
//  iOS开发篇-UITableview控件基本使用
//
//  Created by 谢俊伟 on 14-8-6.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hero : NSObject
@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *intro;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)heroWithDict:(NSDictionary *)dict;
@end
