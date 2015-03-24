//
//  ViewController.m
//  iOS开发UI篇-使用嵌套模型完成的一个简单汽车图标展示程序
//
//  Created by 谢俊伟 on 14-8-6.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "ViewController.h"
#import "Cars.h"
#import "CarsGroup.h"
@interface ViewController ()<UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic,strong)NSArray *car;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableview.rowHeight=60.f;
    self.tableview.dataSource=self;
	// Do any additional setup after loading the view, typically from a nib.
}

-(NSArray *)car
{
    if (_car==nil) {
        NSString *fullpath=[[NSBundle mainBundle]pathForResource:@"cars_total.plist" ofType:nil];
        NSArray *arrayM=[NSArray arrayWithContentsOfFile:fullpath];
        NSMutableArray *carsarray=[NSMutableArray array];
        for (NSDictionary *dict in arrayM) {
            CarsGroup *carsgroup=[CarsGroup carsgroupWithDict:dict];
            [carsarray addObject:carsgroup];
        }
        _car=[carsarray copy];
    }
    return _car;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.car.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    CarsGroup *cargroup=self.car[section];
    return cargroup.cars.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier=@"car";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    CarsGroup *carsgroup=self.car[indexPath.section];
    Cars *cars=carsgroup.cars[indexPath.row];
    cell.imageView.image=[UIImage imageNamed:cars.icon];
    cell.textLabel.text=cars.name;
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    CarsGroup *carsgroup=self.car[section];
    return carsgroup.title;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end





































