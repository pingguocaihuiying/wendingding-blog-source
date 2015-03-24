//
//  TuanGou.h
//  iOS开发UI篇-使用xib自定义UITableViewCell实现一个简单的团购应用界面布局
//
//  Created by 谢俊伟 on 14-8-7.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Global.h"
@interface TuanGouModel : NSObject
@property(nonatomic,copy) NSString *buyCount;
@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *price;
@property(nonatomic,copy) NSString *title;
YYinitH(tg)
@end
