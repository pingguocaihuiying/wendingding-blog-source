//
//  contactsViewController.m
//  iOS开发Ui篇-实现一个私人通讯录小应用(一)
//
//  Created by 谢俊伟 on 14-8-11.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "contactsViewController.h"
#import "addViewController.h"
#import "InfoModel.h"

@interface contactsViewController ()<UIActionSheetDelegate,addViewControllerDelegate,UITableViewDataSource>
- (IBAction)logoutBtn:(UIBarButtonItem *)sender;
@property(nonatomic,strong)NSMutableArray *array;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@end


@implementation contactsViewController

#pragma mark-YYAddViewControllerDelegate
-(void)addViewControllerDidAddBtn:(addViewController *)addViewController contatc:(InfoModel *)contatc
{
    //1.把数组保存到数组中
    //    [self.Info addObject:contatc];
    //    //2.刷新表格
    //    NSLog(@"%@",contatc);
    //    NSLog(@"%@",self.Info);
    //    [self.tableview reloadData];
    NSLog(@"%@,%@",contatc.name,contatc.phone);
    [self.array addObject:contatc];
    [self.tableview reloadData];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.tableview.dataSource=self;
    //self.tableview
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logoutBtn:(UIBarButtonItem *)sender {
    UIActionSheet *sheet =[[UIActionSheet alloc]initWithTitle:@"确定注销?" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:nil, nil];
    
    [sheet showInView:self.view];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *c=segue.destinationViewController;
    addViewController *addc=(addViewController *)c;
    addc.delegate=self;
    
}

#pragma mark-代理方法
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex!=0)return;
    //移除栈顶的控制器
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSMutableArray *)array
{
    if (_array==Nil) {
        _array=[NSMutableArray array];
    }
    return _array;
}


#pragma mark-tableview的数据源
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//一共有多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //       return self.Info.count;
    return self.array.count;
}
//每组每行的cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier=@"info";
    //先去缓存中取。如果缓存中没有，那么就到storyboard中去查找
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    //在storyboard中设置cell的标识符为info
    
    //设置cell的数据
    //
    //     UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Nil];
    
    InfoModel *info=self.array[indexPath.row];
    cell.textLabel.text=info.name;
    //cell.detailTextLabel.text=info.phone;
    [cell.detailTextLabel setText:info.phone];
    
    
    //返回cell
    return cell;
}


@end
