//
//  ViewController.m
//  iOS开发UI篇-字典转模型
//
//  Created by 谢俊伟 on 14-8-5.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "ViewController.h"
#import "AppInfo.h"
@interface ViewController ()
@property (nonatomic, strong) NSArray *appList;
@end

@implementation ViewController


- (NSArray *)appList
{
    if (!_appList) {
        // 1. 从mainBundle加载
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *path = [bundle pathForResource:@"app.plist" ofType:nil];
        //        _appList = [NSArray arrayWithContentsOfFile:path];
        
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        // 将数组转换成模型，意味着self.appList中存储的是LFAppInfo对象
        // 1. 遍历数组，将数组中的字典依次转换成AppInfo对象，添加到一个临时数组
        // 2. self.appList = 临时数组
        
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            //用字典来实例化对象的工厂方法
            [arrayM addObject:[AppInfo appInfoWithDict:dict]];
        }
        
        _appList = arrayM;
    }
    return _appList;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // 总共有3列
    int totalCol = 3;
    CGFloat viewW = 80;
    CGFloat viewH = 90;
    
    CGFloat marginX = (self.view.bounds.size.width - totalCol * viewW) / (totalCol + 1);
    CGFloat marginY = 10;
    CGFloat startY = 20;
    
    for (int i = 0; i < self.appList.count; i++) {
        
        int row = i / totalCol;
        int col = i % totalCol;
        
        CGFloat x = marginX + (viewW + marginX) * col;
        CGFloat y = startY + marginY + (viewH + marginY) * row;
        
        UIView *appView = [[UIView alloc] initWithFrame:CGRectMake(x, y, viewW, viewH)];
        
        [self.view addSubview:appView];
        
        // 创建appView内部的细节
        // 0> 读取数组中的AppInfo
//                NSDictionary *dict = self.appList[i];
        AppInfo *appInfo = self.appList[i];
//        AppInfo *appInfo=[AppInfo appInfoWithDict:dict];
//        // 1> UIImageView
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, viewW, 50)];
        imageView.image = appInfo.image;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [appView addSubview:imageView];
        
        // 2> UILabel
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, imageView.bounds.size.height, viewW, 20)];
        // 设置文字
        label.text = appInfo.name;
        label.font = [UIFont systemFontOfSize:12.0];
        label.textAlignment = NSTextAlignmentCenter;
        
        [appView addSubview:label];
        
        // 3> UIButton
        // UIButtonTypeCustom和[[UIButton alloc] init]是等价的
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(15, 70, viewW - 30, 20);
        
        [button setTitle:@"下载" forState:UIControlStateNormal];
        button.titleLabel.font= [UIFont systemFontOfSize:14.0];
        
        [button setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
        
        [appView addSubview:button];
        button.tag = i;
        
        [button addTarget:self action:@selector(downloadClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)downloadClick:(UIButton *)button
{
    if ([button.currentTitle isEqualToString:@"完成"]) {
        //NSLog(@"%d", button.tag);
        // 实例化一个UILabel显示在视图上，提示用户下载完成
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(80, 400, 160, 40)];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor lightGrayColor];
        
        //[button setTitle:@"下载中" forState:UIControlStateNormal];
        //button.enabled=NO;
        
        AppInfo *appInfo = self.appList[button.tag];
        label.text = [NSString stringWithFormat:@"已经下载过%@", appInfo.name];
        label.font = [UIFont systemFontOfSize:13.0];
        label.alpha = 1.0;
        [self.view addSubview:label];
        // block动画比首尾式动画简单，而且能够控制动画结束后的操作
        // 在iOS中，基本都使用首尾式动画
        [UIView animateWithDuration:3.0 animations:^{
            label.alpha = 0.0;
        } completion:^(BOOL finished) {
            // 删除label
            [label removeFromSuperview];
        }];
        
    }else{
        //NSLog(@"%d", button.tag);
        // 实例化一个UILabel显示在视图上，提示用户下载完成
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(80, 400, 160, 40)];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor lightGrayColor];
        
        [button setTitle:@"下载中" forState:UIControlStateNormal];
        //button.enabled=NO;
        
        AppInfo *appInfo = self.appList[button.tag];
        label.text = [NSString stringWithFormat:@"下载%@完成", appInfo.name];
        label.font = [UIFont systemFontOfSize:13.0];
        label.alpha = 1.0;
        [self.view addSubview:label];
        // block动画比首尾式动画简单，而且能够控制动画结束后的操作
        // 在iOS中，基本都使用首尾式动画
        [UIView animateWithDuration:3.0 animations:^{
            label.alpha = 0.0;
        } completion:^(BOOL finished) {
            // 删除label
            [label removeFromSuperview];
            [button setTitle:@"完成" forState:UIControlStateNormal];
        }];
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
