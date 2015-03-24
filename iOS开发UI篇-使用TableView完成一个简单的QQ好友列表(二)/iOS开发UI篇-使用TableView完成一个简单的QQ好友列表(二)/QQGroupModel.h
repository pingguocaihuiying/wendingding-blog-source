//
//  QQGroupModel.h
//  iOS开发UI篇-使用UITableView完成一个简单的QQ好友列表
//
//  Created by 谢俊伟 on 14-8-8.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QQGroupModel : NSObject
//好友分组名称
@property(nonatomic,copy) NSString *name;
//在线数量
@property(nonatomic,copy) NSString *online;
//好友列表
@property(nonatomic,strong) NSArray *friends;
//记录当前分组是否要打开
@property(nonatomic,assign,getter = isOpen) BOOL open;

-(instancetype)initWithDict:(NSDictionary *)dict;

+(instancetype)qqGroupModelWithDict:(NSDictionary *)dict;
@end
