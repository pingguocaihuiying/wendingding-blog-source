//
//  ViewController.m
//  iOS开发篇-UIScrollView控件实现图片缩放功能
//
//  Created by 谢俊伟 on 14-8-6.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
{
    UIScrollView *_scrollview;
    UIImageView *_imageview;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _scrollview=[[UIScrollView alloc]initWithFrame:self.view.bounds  ];
    [self.view addSubview:_scrollview];
    
    UIImage *image=[UIImage imageNamed:@"big.jpg"];
    _imageview=[[UIImageView alloc]initWithImage:image];
    [_scrollview addSubview:_imageview];
    _scrollview.contentSize=image.size;
    
    _scrollview.delegate=self;
    _scrollview.maximumZoomScale=2.0;
    _scrollview.minimumZoomScale=0.5;
    
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageview;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
