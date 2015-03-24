//
//  ViewController.m
//  iOS开发UI篇-在UITableView的应用中使用动态单元格来完成app应用程序管理界面的搭建
//
//  Created by 谢俊伟 on 14-8-9.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "ViewController.h"
#import "AppInfo.h"
#import "AppCell.h"
@interface ViewController ()<UITableViewDataSource,appCellDelegate>
@property(nonatomic,strong)NSArray *apps;
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@end

@implementation ViewController

-(NSArray *)apps
{
    if (_apps==nil) {
        NSString *fullpath=[[NSBundle mainBundle]pathForResource:@"apps_full.plist" ofType:nil];
        NSArray *arrayM=[NSArray arrayWithContentsOfFile:fullpath];
        NSMutableArray *models=[NSMutableArray arrayWithCapacity:arrayM.count];
        for (NSDictionary *dict in arrayM) {
            AppInfo *appinfo=[AppInfo appInfoWithDict:dict];
            [models addObject:appinfo];
        }
        _apps=[models copy];
    }
    return _apps;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.apps.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier=@"app";
    AppCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    AppInfo *appinfo=self.apps[indexPath.row];
    cell.delegate=self;
    cell.app=appinfo;
    return cell;
}

-(void)btnDidClick:(AppCell *)cell
{
    AppInfo *app=cell.app;
    UILabel *lab=[[UILabel alloc]init];
    lab.frame=CGRectMake(60, 300, 200, 20);
    lab.text=[NSString stringWithFormat:@"%@已经下载完成",app.name];
    [lab setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:lab];
    lab.alpha=1.0;
    
    [UIView animateWithDuration:2.0 animations:^{lab.alpha=0;} completion:^(BOOL finished){[lab removeFromSuperview];}];
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
