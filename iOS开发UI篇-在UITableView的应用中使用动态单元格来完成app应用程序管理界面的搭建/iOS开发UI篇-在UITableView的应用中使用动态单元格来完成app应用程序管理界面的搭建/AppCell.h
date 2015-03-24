//
//  AppCell.h
//  iOS开发UI篇-在UITableView的应用中使用动态单元格来完成app应用程序管理界面的搭建
//
//  Created by 谢俊伟 on 14-8-9.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AppInfo,AppCell;

@protocol appCellDelegate <NSObject>

-(void)btnDidClick:(AppCell *)cell;

@end
@interface AppCell : UITableViewCell
@property(nonatomic,strong) AppInfo *app;
@property(nonatomic,strong) id<appCellDelegate> delegate;
@end
