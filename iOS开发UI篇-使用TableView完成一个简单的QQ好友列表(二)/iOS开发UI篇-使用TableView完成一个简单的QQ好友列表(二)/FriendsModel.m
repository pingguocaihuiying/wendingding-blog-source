//
//  FriendsModel.m
//  iOS开发UI篇-使用UITableView完成一个简单的QQ好友列表
//
//  Created by 谢俊伟 on 14-8-8.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "FriendsModel.h"

@implementation FriendsModel
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)friendsWithDict:(NSDictionary *)dict
{
    return [[FriendsModel alloc]initWithDict:dict];
}
@end
