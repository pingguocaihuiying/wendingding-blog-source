//
//  ViewController.m
//  iOS开发UI篇-UIScrollView控件介绍
//
//  Created by 谢俊伟 on 14-8-6.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIScrollView *_scrollView;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIScrollView *scrollView=[[UIScrollView alloc]init];
    scrollView.frame=CGRectMake(0, 0, 250, 250);
    scrollView.backgroundColor=[UIColor grayColor];
    [self.view addSubview:scrollView];
    
    UIImageView *imageview=[[UIImageView alloc]init];
    imageview.image=[UIImage imageNamed:@"big.jpg"];
    CGFloat imgW=imageview.image.size.width;
    CGFloat imgH=imageview.image.size.height;
    imageview.frame=CGRectMake(0, 0, imgW, imgH);
    [scrollView addSubview:imageview];
    
    scrollView.contentSize=imageview.image.size;
    
    scrollView.showsHorizontalScrollIndicator=NO;
    scrollView.showsVerticalScrollIndicator=NO;
    
    scrollView.contentOffset=CGPointMake(850, 300);
    
    scrollView.contentInset=UIEdgeInsetsMake(20, 20, 20, 20);
    
    _scrollView=scrollView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
