//
//  oneViewController.m
//  iOS开发UI篇-导航控制器属性和基本使用
//
//  Created by 谢俊伟 on 14-8-11.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "oneViewController.h"
#import "twoViewController.h"
@interface oneViewController ()
- (IBAction)jump2two:(UIButton *)sender;

@end

@implementation oneViewController

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
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor=[UIColor orangeColor];
    
    self.navigationController.title=@"第一个界面";
    self.navigationItem.backBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"返回一" style:UIBarButtonItemStylePlain target:nil action:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)jump2two:(UIButton *)sender {
    twoViewController *two=[[twoViewController alloc]init];
    [self.navigationController pushViewController:two animated:YES];
}
@end
