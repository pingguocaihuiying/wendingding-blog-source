//
//  WeiboFrame.h
//  iOS开发UI篇-使用纯代码自定义UITableViewCell实现一个简单的微博界面布局
//
//  Created by 谢俊伟 on 14-8-8.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Weibo;
@interface WeiboFrame : NSObject
@property(nonatomic,assign) CGRect iconF;
@property(nonatomic,assign) CGRect nameF;
@property(nonatomic,assign) CGRect vipF;
@property(nonatomic,assign) CGRect introF;
@property(nonatomic,assign) CGRect pictureF;
@property(nonatomic,assign) CGFloat cellHeight;
@property(nonatomic,strong) Weibo *weibo;
@end
