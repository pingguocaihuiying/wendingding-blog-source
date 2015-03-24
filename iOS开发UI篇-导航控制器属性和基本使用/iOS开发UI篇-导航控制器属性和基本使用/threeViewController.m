//
//  threeViewController.m
//  iOS开发UI篇-导航控制器属性和基本使用
//
//  Created by 谢俊伟 on 14-8-11.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "threeViewController.h"

@interface threeViewController ()
- (IBAction)jump2two:(UIButton *)sender;
- (IBAction)jump2one:(UIButton *)sender;

@end

@implementation threeViewController

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
    self.view.backgroundColor=[UIColor blueColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)jump2two:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];

}

- (IBAction)jump2one:(UIButton *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
