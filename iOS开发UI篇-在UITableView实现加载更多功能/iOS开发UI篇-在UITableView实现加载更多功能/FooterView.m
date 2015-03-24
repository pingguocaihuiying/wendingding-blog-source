//
//  FooterView.m
//  iOS开发UI篇-在UITableView实现加载更多功能
//
//  Created by 谢俊伟 on 14-8-9.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "FooterView.h"
#import "ViewController.h"
@interface FooterView()
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *loadingview;
@property (strong, nonatomic) IBOutlet UIButton *loadbtn;

@end

@implementation FooterView
- (IBAction)loadbtnclick {
    self.loadbtn.hidden=YES;
    [self.loadingview startAnimating];
    self.loadingview.hidden=NO;
    
    //模拟发送网络请求,3秒后隐藏菊花
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0*NSEC_PER_SEC)),dispatch_get_main_queue(),^{
        //
//#warning 待修正
        //[self.controller class];
        //
        [self.delegate footerviewLoadMore];
        [self.loadingview stopAnimating];
        self.loadingview.hidden=YES;
        self.loadbtn.hidden=NO;
    });
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
