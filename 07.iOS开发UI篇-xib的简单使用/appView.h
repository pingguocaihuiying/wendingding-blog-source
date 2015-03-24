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

@property (strong, nonatomic) IBOutlet UIImageView *appimg;
@property (strong, nonatomic) IBOutlet UILabel *applab;
@property (strong, nonatomic) IBOutlet UIButton *appbtn;

+(instancetype)appInfoViewWithappInfo:(AppInfo *)appinfo;

@end
