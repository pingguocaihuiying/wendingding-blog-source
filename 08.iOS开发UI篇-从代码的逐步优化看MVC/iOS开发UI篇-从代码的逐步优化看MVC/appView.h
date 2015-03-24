//
//  appView.h
//  iOS开发UI篇-xib的简单使用
//
//  Created by 谢俊伟 on 14-8-5.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppInfo.h"

@interface appView : UIView

+(instancetype)appInfoViewWithappInfo:(AppInfo *)appinfo;

@end
