//
//  FriendsModel.h
//  iOS开发UI篇-使用UITableView完成一个简单的QQ好友列表
//
//  Created by 谢俊伟 on 14-8-8.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendsModel : NSObject
//好友名称
@property(nonatomic,copy) NSString *name;
//好友头像
@property(nonatomic,copy) NSString *icon;
//个性签名
@property(nonatomic,copy) NSString *intro;
//是否VIP
@property(nonatomic,assign,getter = isVip) BOOL vip;

-(instancetype)initWithDict:(NSDictionary *)dict;

+(instancetype)friendsWithDict:(NSDictionary *)dict;

@end
