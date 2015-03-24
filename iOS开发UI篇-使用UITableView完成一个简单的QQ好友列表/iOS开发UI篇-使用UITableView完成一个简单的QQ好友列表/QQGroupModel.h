//
//  QQGroupModel.h
//  iOS开发UI篇-使用UITableView完成一个简单的QQ好友列表
//
//  Created by 谢俊伟 on 14-8-8.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QQGroupModel : NSObject
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *online;
@property(nonatomic,strong) NSArray *friends;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)qqGroupModelWithDict:(NSDictionary *)dict;
@end
