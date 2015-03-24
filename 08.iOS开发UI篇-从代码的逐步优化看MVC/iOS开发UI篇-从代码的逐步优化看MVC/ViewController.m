//
//  ViewController.m
//  iOS开发UI篇-从代码的逐步优化看MVC
//
//  Created by 谢俊伟 on 14-8-5.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "ViewController.h"
#import "AppInfo.h"
#import "appView.h"
@interface ViewController ()
@property(nonatomic,strong)NSArray *app;
@end

@implementation ViewController

//1.加载数据信息
-(NSArray *)app
{
    if (!_app) {
        _app=[AppInfo appinfoarray];
    }
    return _app;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //九宫格布局
    int totalloc=3;
    CGFloat appviewW=80;
    CGFloat appviewH=90;
    CGFloat margin=(self.view.frame.size.width-totalloc*appviewW)/(totalloc+1);
    int count=self.app.count;
    for (int i=0; i<count; i++) {
        int row=i/totalloc;
        int loc=i%totalloc;
        CGFloat appviewX=margin+(margin+appviewW)*loc;
        CGFloat appviewY=margin+(margin+appviewH)*row;
        
        AppInfo *app=self.app[i];
        
        //拿出xib视图
//        NSArray *apparray=[[NSBundle mainBundle]loadNibNamed:@"appxib" owner:nil options:nil];
//        appView *appview=[apparray firstObject];
        appView *appview=[appView appInfoViewWithappInfo:app];
        //设置位置
        appview.frame=CGRectMake(appviewX, appviewY, appviewW, appviewH);
        
        [self.view addSubview:appview];
//        appview.appimg.image=app.image;
//        appview.applab.text=app.name;
//        appview.appbtn.tag=i;
//        
//        [appview.appbtn addTarget:self action:@selector(appviewbtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
}

/**按钮的点击事件*/
-(void)appviewbtnClick:(UIButton *)btn
{
    AppInfo *apps=self.app[btn.tag];
    UILabel *showlab=[[UILabel alloc]initWithFrame:CGRectMake(60, 450, 200, 20)];
    [showlab setText:[NSString stringWithFormat: @"%@下载成功",apps.name]];
    [showlab setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:showlab];
    showlab.alpha=1.0;
    
    //简单的动画效果
    [UIView animateWithDuration:2.0 animations:^{
        showlab.alpha=0;
    } completion:^(BOOL finished) {
        [showlab removeFromSuperview];
    }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

