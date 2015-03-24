//
//  QQGroupModel.m
//  iOS开发UI篇-使用UITableView完成一个简单的QQ好友列表
//
//  Created by 谢俊伟 on 14-8-8.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "QQGroupModel.h"
#import "FriendsModel.h"
@implementation QQGroupModel
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *models=[NSMutableArray arrayWithCapacity:self.friends.count];
        for (NSDictionary *dict in self.friends) {
            FriendsModel *friends=[FriendsModel friendsWithDict:dict];
            [models addObject:friends];
        }
        _friends=[models copy];
    }
    return self;
}

+(instancetype)qqGroupModelWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
