//
//  ViewController.m
//  iOS开发UI篇-UITableView控件简单介绍
//
//  Created by 谢俊伟 on 14-8-6.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "ViewController.h"
#import "CarGroup.h"
@interface ViewController ()<UITableViewDataSource>
@property(weak,nonatomic)IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSArray *carGroups;
@end

@implementation ViewController

#pragma mark - 懒加载
- (NSArray *)carGroups
{
    if (_carGroups == nil) {
        // 1.创建模型
        CarGroup *cg1 = [[CarGroup alloc] init];
        cg1.title = @"德系品牌";
        cg1.desc = @"高端大气上档次";
        cg1.cars = @[@"奥迪", @"宝马"];
        
        CarGroup *cg2 = [[CarGroup alloc] init];
        cg2.title = @"日韩品牌";
        cg2.desc = @"还不错";
        cg2.cars = @[@"本田", @"丰田", @"小田田"];
        
        CarGroup *cg3 = [[CarGroup alloc] init];
        cg3.title = @"欧美品牌";
        cg3.desc = @"价格昂贵";
        cg3.cars = @[@"劳斯莱斯", @"布加迪", @"小米"];
        
        CarGroup *cg4 = [[CarGroup alloc] init];
        cg4.title = @"欧美品牌";
        cg4.desc = @"价格昂贵";
        cg4.cars = @[@"劳莱斯", @"布迪", @"小米饭"];
        
        CarGroup *cg5 = [[CarGroup alloc] init];
        cg5.title = @"欧美品牌";
        cg5.desc = @"价格昂贵";
        cg5.cars = @[@"斯莱斯", @"加迪", @"小米粥"];
        // 2.将模型添加到数组中
        _carGroups = @[cg1, cg2, cg3,cg4,cg5];
    }
    // 3.返回数组
    return _carGroups;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.tableView.dataSource=self;
}

#pragma mark - UITableViewDataSourcw
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.carGroups.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((CarGroup *)(self.carGroups[section])).cars.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
//    // 2.设置数据
//    // cell.textLabel.text = @"汽车";
//    // 判断是第几组的第几行
//    if (0 == indexPath.section) { // 第0组
//        if (0 == indexPath.row) // 第0组第0行
//        {
//            cell.textLabel.text = @"奥迪";
//        }else if (1 == indexPath.row) // 第0组第1行
//        {
//            cell.textLabel.text = @"宝马";
//        }
//        
//    }else if (1 == indexPath.section) // 第1组
//    {
//        if (0 == indexPath.row) { // 第0组第0行
//            cell.textLabel.text = @"本田";
//        }else if (1 == indexPath.row) // 第0组第1行
//        {
//            cell.textLabel.text = @"丰田";
//        }else if (2 == indexPath.row) // 第0组第2行
//        {
//            cell.textLabel.text = @"马自达";
//        }
//    }
//    
//    // 3.返回要显示的控件
//    return cell;
    // 2.设置数据
    // cell.textLabel.text = @"嗨喽";
    // 2.1取出对应组的模型
    CarGroup *g = self.carGroups[indexPath.section];
    // 2.2取出对应行的数据
    NSString *name = g.cars[indexPath.row];
    // 2.3设置cell要显示的数据
    cell.textLabel.text = name;
    // 3.返回要显示的控件
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // return @"标题";
    if (0 == section) {
        return @"德系品牌";
    }else
    {
        return @"日韩品牌";
    }
}
/**
 *  第section组底部显示什么标题
 *
 */
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    if (0 == section) {
        return @"高端大气上档次";
    }else
    {
        return @"还不错";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
