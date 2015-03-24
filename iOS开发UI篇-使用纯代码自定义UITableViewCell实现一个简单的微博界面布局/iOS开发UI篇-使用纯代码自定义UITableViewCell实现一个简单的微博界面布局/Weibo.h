//
//  Weibo.h
//  iOS开发UI篇-使用纯代码自定义UITableViewCell实现一个简单的微博界面布局
//
//  Created by 谢俊伟 on 14-8-7.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weibo : NSObject
@property(nonatomic,copy) NSString *text;
@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *picture;
@property(nonatomic,assign) BOOL vip;
-(id)initWithDict:(NSDictionary *)dict;
+(id)weiboWithDict:(NSDictionary *)dict;
@end
