//
//  ViewController.m
//  iOS开发UI篇-使用xib自定义UITableViewCell实现一个简单的团购应用界面布局
//
//  Created by 谢俊伟 on 14-8-7.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "ViewController.h"
#import "TuanGouCell.h"
#import "TuanGouModel.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(strong,nonatomic)NSArray *tg;
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.tableview.rowHeight=80.f;
}

-(NSArray *)tg
{
    if (_tg==nil) {
        NSString *fullpath=[[NSBundle mainBundle]pathForResource:@"tgs.plist" ofType:nil];
        NSArray *temparray=[NSArray arrayWithContentsOfFile:fullpath];
        NSMutableArray *arrayM=[NSMutableArray arrayWithCapacity:temparray.count];
        for (NSDictionary *dict in temparray) {
            TuanGouModel *tg=[TuanGouModel tgWithDict:dict];
            [arrayM addObject:tg];
        }
        _tg=[arrayM mutableCopy];
    }
    return _tg;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tg.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TuanGouCell *cell=[TuanGouCell cellWithTableView:tableView];
    TuanGouModel *tg=self.tg[indexPath.row];
    cell.tg=tg;
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
