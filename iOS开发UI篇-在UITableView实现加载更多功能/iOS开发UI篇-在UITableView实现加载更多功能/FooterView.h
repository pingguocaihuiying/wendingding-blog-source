//
//  FooterView.h
//  iOS开发UI篇-在UITableView实现加载更多功能
//
//  Created by 谢俊伟 on 14-8-9.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ViewController;

@protocol FooterViewDelegate <NSObject>

-(void)footerviewLoadMore;

@end

@interface FooterView : UIView
@property(nonatomic,strong) id<FooterViewDelegate> delegate;
//@property(nonatomic,strong) ViewController *controller;
@end
