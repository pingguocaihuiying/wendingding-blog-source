//
//  ViewController.m
//  iOS开发UI篇-在UIImageView中添加按钮以及Tag的参数说明
//
//  Created by 谢俊伟 on 14-8-5.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // UIImageView默认不允许用户交互
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 100, 100)];
    //1.设置tag
    imageView.tag=1;
    [self.view addSubview:imageView];
    imageView.backgroundColor = [UIColor redColor];
    imageView.userInteractionEnabled = YES;
    //2.根据tag取
    UIImageView *aaa= [self.view viewWithTag:1];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.frame=CGRectMake(10, 10, 40, 40);
    [imageView addSubview:btn];
    
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
}


- (void)click
{
    NSLog(@"摸我了");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
