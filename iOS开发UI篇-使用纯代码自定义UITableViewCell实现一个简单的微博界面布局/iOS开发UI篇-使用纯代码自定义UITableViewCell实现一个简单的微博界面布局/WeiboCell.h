//
//  WeiboCell.h
//  iOS开发UI篇-使用纯代码自定义UITableViewCell实现一个简单的微博界面布局
//
//  Created by 谢俊伟 on 14-8-7.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WeiboFrame;
@interface WeiboCell : UITableViewCell
@property(nonatomic,strong) WeiboFrame *weiboFrame;
+(instancetype)cellWithTableView:(UITableView *)tableview;
@end
