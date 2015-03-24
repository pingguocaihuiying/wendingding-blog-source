//
//  ViewController.m
//  iOS开发UI篇-实现UITableView控件数据刷新
//
//  Created by 谢俊伟 on 14-8-7.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "ViewController.h"
#import "Heros.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property(nonatomic,strong)NSArray *heros;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //设置数据源
    self.tableview.dataSource=self;
    self.tableview.delegate=self;
    self.tableview.rowHeight=60.f;
    
}

//懒加载
-(NSArray *)heros
{
    if (_heros==nil) {
        NSString *fullpath=[[NSBundle mainBundle]pathForResource:@"heros.plist" ofType:nil];
        NSArray *temparray=[NSArray arrayWithContentsOfFile:fullpath];
        
        NSMutableArray *arrayM=[NSMutableArray array];
        for (NSDictionary *dict in temparray) {
            Heros *hero=[Heros herosWithDict:dict];
            [arrayM addObject:hero];
        }
        _heros=[arrayM mutableCopy];
    }
    return _heros;
}

//多少组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heros.count;
}

//每组每行的数据,设置cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //从缓存中取
    static NSString *identifier=@"hero";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    //如果没有取到就新建
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    //设置数据
    //拿该行的模型
    Heros *hero=self.heros[indexPath.row];
    cell.textLabel.text=hero.name;
    cell.imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",hero.icon]];
    cell.detailTextLabel.text=hero.intro;
    
    return cell;
}
//当某一行被选中的时候调用该方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //拿该行的数据
    Heros *hero=self.heros[indexPath.row];
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"修改数据" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    //密码框的形式
    //alert.alertViewStyle=UIAlertViewStyleSecureTextInput;
    alert.alertViewStyle=UIAlertViewStylePlainTextInput;
    UITextField *text=[alert textFieldAtIndex:0];
    //将当前行的英雄数据显示到文本框中
    text.text=hero.name;
    alert.tag=indexPath.row;
    [alert show];
}
//修改数据,完成刷新操作
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //如果选中的是取消,就返回,不做任何操作
    if (0==buttonIndex) {
        return;
    }
    //否则就修改模型,刷新数据
    Heros *hero=self.heros[alertView.tag];
    //拿到当前弹窗的文本框的数据(已经修改的数据)
    UITextField *text=[alertView textFieldAtIndex:0];
    hero.name=text.text;
    //刷新数据
    // 会自动调用numberOfSectionsInTableView
    // 会自动调用numberOfRowsInSection
    // 会自动调用cellForRowAtIndexPath
    //[self.tableview reloadData];
    
    //刷新指定行
    NSIndexPath *path=[NSIndexPath indexPathForRow:alertView.tag inSection:0];
    [self.tableview reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationRight];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

























