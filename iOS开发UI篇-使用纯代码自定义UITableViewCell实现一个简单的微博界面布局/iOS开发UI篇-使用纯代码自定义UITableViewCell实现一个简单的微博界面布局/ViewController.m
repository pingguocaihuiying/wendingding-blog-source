//
//  ViewController.m
//  iOS开发UI篇-使用纯代码自定义UITableViewCell实现一个简单的微博界面布局
//
//  Created by 谢俊伟 on 14-8-7.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "ViewController.h"
#import "Weibo.h"
#import "WeiboCell.h"
#import "WeiboFrame.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSArray *statusFrames;
@end

@implementation ViewController

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusFrames.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeiboCell *cell=[WeiboCell cellWithTableView:tableView];
    cell.weiboFrame=self.statusFrames[indexPath.row];
    return cell;
}

-(NSArray *)statusFrames
{
    if (_statusFrames==nil) {
        NSString *fullPath=[[NSBundle mainBundle]pathForResource:@"statuses.plist" ofType:nil];
        NSArray *dictArray=[NSArray arrayWithContentsOfFile:fullPath];
        NSMutableArray *models=[NSMutableArray arrayWithCapacity:dictArray.count];
        for (NSDictionary *dict in dictArray) {
            Weibo *weibo=[Weibo weiboWithDict:dict];
            WeiboFrame *wbf=[[WeiboFrame alloc]init];
            wbf.weibo=weibo;
            [models addObject:wbf];
        }
        _statusFrames=[models copy];
    }
    return _statusFrames;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeiboFrame *wbf=self.statusFrames[indexPath.row];
    return wbf.cellHeight;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
