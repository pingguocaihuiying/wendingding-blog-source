//
//  TuanGouCell.h
//  iOS开发UI篇-使用xib自定义UITableViewCell实现一个简单的团购应用界面布局
//
//  Created by 谢俊伟 on 14-8-7.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TuanGouModel.h"
@interface TuanGouCell : UITableViewCell
@property(nonatomic,strong)TuanGouModel *tg;
@property (strong, nonatomic) IBOutlet UIImageView *img;
@property (strong, nonatomic) IBOutlet UILabel *titlelab;
@property (strong, nonatomic) IBOutlet UILabel *pricelab;
@property (strong, nonatomic) IBOutlet UILabel *buyCount;
+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
