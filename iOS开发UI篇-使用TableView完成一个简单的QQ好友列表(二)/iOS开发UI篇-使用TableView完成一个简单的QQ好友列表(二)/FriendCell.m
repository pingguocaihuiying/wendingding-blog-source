//
//  FriendCell.m
//  iOS开发UI篇-使用UITableView完成一个简单的QQ好友列表
//
//  Created by 谢俊伟 on 14-8-8.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "FriendCell.h"
#import "FriendsModel.h"

@interface FriendsModel()

@end

@implementation FriendCell

+(FriendCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier=@"qq";
    FriendCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell=[[FriendCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        NSLog(@"new cell");
    }
    return cell;
}

-(void)setFriends:(FriendsModel *)friends
{
    _friends=friends;
    //设置头像
    self.imageView.image=[UIImage imageNamed:_friends.icon];
    //设置昵称
    self.textLabel.text=_friends.name;
    //设置个性签名
    self.detailTextLabel.text=_friends.intro;
    //设置是否会员
    if (_friends.isVip) {
        [self.textLabel setTextColor:[UIColor redColor]];
    }else
    {
        [self.textLabel setTextColor:[UIColor blackColor]];
    }
    self.textLabel.font=[UIFont systemFontOfSize:15.f];
    self.detailTextLabel.font=[UIFont systemFontOfSize:10.f];
}

//- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        // Initialization code
//    }
//    return self;
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated
//{
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
