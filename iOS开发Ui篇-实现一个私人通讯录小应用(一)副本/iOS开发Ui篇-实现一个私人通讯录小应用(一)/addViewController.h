//
//  addViewController.h
//  iOS开发Ui篇-实现一个私人通讯录小应用(一)
//
//  Created by 谢俊伟 on 14-8-12.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import <UIKit/UIKit.h>
@class addViewController, InfoModel;
//#import "contactsViewController.h"


//自定义一个协议，让上一个控制器（YYContatcsViewController）成为当前控制器的代理

//@protocol  YYAddViewControllerDelegate <NSObject>
//
////协议方法
//-(void)addViewControllerDidAddBtn:(YYAddViewController *)addViewController contatc:(YYInfoModel *)contatc;

@protocol addViewControllerDelegate <NSObject>

//- (void)editViewControllerDidAddBtn:(NJEditViewController *)editViewController name:(NSString *)name number:(NSString *)phoneNumber;

- (void)addViewControllerDidAddBtn:(addViewController *)editViewController contatc:(InfoModel *)contatc;

@end

@interface addViewController : UIViewController
@property(nonatomic,strong)id<addViewControllerDelegate> delegate;
@end
