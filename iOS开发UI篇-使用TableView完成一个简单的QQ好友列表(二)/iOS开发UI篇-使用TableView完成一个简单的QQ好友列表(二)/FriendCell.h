//
//  FriendCell.h
//  iOS开发UI篇-使用UITableView完成一个简单的QQ好友列表
//
//  Created by 谢俊伟 on 14-8-8.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FriendsModel;
@interface FriendCell : UITableViewCell
@property(nonatomic,strong) FriendsModel *friends;
+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
