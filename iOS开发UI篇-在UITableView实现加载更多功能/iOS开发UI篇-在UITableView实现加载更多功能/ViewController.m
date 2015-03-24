//
//  ViewController.m
//  iOS开发UI篇-在UITableView实现加载更多功能
//
//  Created by 谢俊伟 on 14-8-9.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "ViewController.h"
#import "TuanGouCell.h"
#import "TuanGouModel.h"
#import "FooterView.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,FooterViewDelegate>
@property(strong,nonatomic)NSMutableArray *tg;
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@end

@implementation ViewController

-(void)footerviewLoadMore
{
    TuanGouModel *tgmodel1=[[TuanGouModel alloc]init];
    tgmodel1.title=@"联想双肩包";
    tgmodel1.icon=@"8";
    tgmodel1.buyCount=@"10";
    tgmodel1.price=@"139";
    [self.tg addObject:tgmodel1];
    
    TuanGouModel *tgmodel2=[[TuanGouModel alloc]init];
    tgmodel2.title=@"红米NOTE增强版";
    tgmodel2.icon=@"9";
    tgmodel2.buyCount=@"19";
    tgmodel2.price=@"2099";
    [self.tg addObject:tgmodel2];
    
    [self.tableview reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.tableview.rowHeight=80.f;
    
    UINib *nib=[UINib nibWithNibName:@"FooterView" bundle:nil];
    FooterView *footerview=[[nib instantiateWithOwner:nil options:nil]firstObject];
    self.tableview.tableFooterView=footerview;
    footerview.delegate=self;
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
