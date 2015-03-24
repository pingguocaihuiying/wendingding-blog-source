//
//  CarGroup.h
//  iOS开发UI篇-UITableView控件简单介绍
//
//  Created by 谢俊伟 on 14-8-6.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarGroup : NSObject
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *desc;
@property(nonatomic,strong)NSArray *cars;
@end
