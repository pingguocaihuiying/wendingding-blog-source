//
//  CarsGroup.h
//  iOS开发UI篇-使用嵌套模型完成的一个简单汽车图标展示程序
//
//  Created by 谢俊伟 on 14-8-6.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarsGroup : NSObject
@property(nonatomic,copy) NSString *title;
@property(nonatomic,strong) NSArray *cars;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)carsgroupWithDict:(NSDictionary *)dict;
@end
