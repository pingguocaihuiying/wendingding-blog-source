//
//  HeaderView.h
//  iOS开发UI篇-使用TableView完成一个简单的QQ好友列表(二)
//
//  Created by 谢俊伟 on 14-8-8.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QQGroupModel.h"
@class HeaderView;

@protocol HeaderViewDelegate <NSObject>
-(void)headerViewDidClickHeaderView:(HeaderView *)headerView;
@end

@interface HeaderView : UITableViewHeaderFooterView
@property(nonatomic,strong) QQGroupModel *group;

+(instancetype)headerWithTableView:(UITableView *)tableView;

@property(nonatomic,weak) id<HeaderViewDelegate> delegate;
@end
