//
//  ViewController.m
//  iOS开发UI篇-使用UITableView完成一个简单的QQ好友列表
//
//  Created by 谢俊伟 on 14-8-8.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "ViewController.h"
#import "QQGroupModel.h"
#import "FriendCell.h"
#import "FriendsModel.h"
@interface ViewController ()
@property(nonatomic,strong)NSArray *groupFriends;
@end

@implementation ViewController

-(NSArray *)groupFriends
{
    if (_groupFriends==nil) {
        NSString *fullpath=[[NSBundle mainBundle]pathForResource:@"friends.plist" ofType:nil];
        NSArray *arrayM=[NSArray arrayWithContentsOfFile:fullpath];
        
        NSMutableArray *models=[NSMutableArray arrayWithCapacity:arrayM.count];
        for (NSDictionary *dict in arrayM) {
            QQGroupModel *group=[QQGroupModel qqGroupModelWithDict:dict];
            [models addObject:group];
        }
        _groupFriends=[models copy];
    }
    return _groupFriends;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groupFriends.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    QQGroupModel *group=self.groupFriends[section];
    return group.friends.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FriendCell *cell=[FriendCell cellWithTableView:tableView];
    QQGroupModel *group=self.groupFriends[indexPath.section];
    FriendsModel *friends=group.friends[indexPath.row];
    cell.friends=friends;
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[UIColor grayColor];
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    NSLog(@"load");
    self.tableView.sectionFooterHeight=100;
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

















