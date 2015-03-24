//
//  twoViewController.m
//  iOS开发UI篇-多控制器和导航控制器简单介绍
//
//  Created by 谢俊伟 on 14-8-10.
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
