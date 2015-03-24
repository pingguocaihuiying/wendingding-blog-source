//
//  FriendsModel.h
//  iOS开发UI篇-使用UITableView完成一个简单的QQ好友列表
//
//  Created by 谢俊伟 on 14-8-8.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendsModel : NSObject
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *intro;
@property(nonatomic,assign,getter = isVip) BOOL vip;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)friendsWithDict:(NSDictionary *)dict;

@end
