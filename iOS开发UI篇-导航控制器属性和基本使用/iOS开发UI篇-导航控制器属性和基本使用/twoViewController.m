//
//  twoViewController.m
//  iOS开发UI篇-导航控制器属性和基本使用
//
//  Created by 谢俊伟 on 14-8-11.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "twoViewController.h"
#import "threeViewController.h"
@interface twoViewController ()
- (IBAction)jump2three:(UIButton *)sender;

@end

@implementation twoViewController

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
    self.view.backgroundColor=[UIColor grayColor];
    
    UIBarButtonItem *bar1=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:nil action:nil];
    UIBarButtonItem *bar2=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:nil action:nil];
    UIBarButtonItem *bar3=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:nil action:nil];
    
    self.navigationItem.rightBarButtonItems=@[bar1,bar2,bar3];
    
    self.navigationItem.backBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:nil action:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)jump2three:(UIButton *)sender {
    threeViewController *three=[[threeViewController alloc]init];
    [self.navigationController pushViewController:three animated:YES];
}
@end
