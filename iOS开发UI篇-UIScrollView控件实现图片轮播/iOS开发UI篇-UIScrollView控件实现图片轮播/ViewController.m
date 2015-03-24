//
//  ViewController.m
//  iOS开发UI篇-UIScrollView控件实现图片轮播
//
//  Created by 谢俊伟 on 14-8-9.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property(nonatomic,strong)NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CGFloat imageW=self.scrollView.frame.size.width;
    CGFloat imageH=self.scrollView.frame.size.height;
    CGFloat imageY=0;
    NSInteger totalCount=5;
    for (int i=0; i<totalCount; i++) {
        UIImageView *imageView=[[UIImageView alloc]init];
        CGFloat imageX=i*imageW;
        imageView.frame=CGRectMake(imageX, imageY, imageW, imageH);
        NSString *name=[NSString stringWithFormat:@"%d.jpg",i+1];
        imageView.image=[UIImage imageNamed:name];
        self.scrollView.showsHorizontalScrollIndicator=NO;
        [self.scrollView addSubview:imageView];
    }
    
    //设置scrollview的滚动范围
    CGFloat contentW=totalCount*imageW;
    //不允许垂直方向上的滚动
    self.scrollView.contentSize=CGSizeMake(contentW, 0);
    
    //设置分页
    self.scrollView.pagingEnabled=YES;
    //监听scrollview的滚动
    self.scrollView.delegate=self;
    self.pageControl.numberOfPages=totalCount;
    [self addTimer];
}

-(void)nextPage
{
    int page=(int)self.pageControl.currentPage;
    if (page==4) {
        page=0;
    }else
    {
        page++;
    }
    //滚动scrollview
    [UIView beginAnimations:nil context:nil];
    CGFloat x=page*self.scrollView.frame.size.width;
    self.scrollView.contentOffset=CGPointMake(x, 0);
    [UIView setAnimationDuration:0.3];
    [UIView commitAnimations];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //NSLog(@"scrolling");
    CGFloat scrollviewW=scrollView.frame.size.width;
    CGFloat x=scrollView.contentOffset.x;
    int page=(x+scrollviewW/2)/scrollviewW;
    self.pageControl.currentPage=page;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self addTimer];
}

-(void)addTimer
{
    self.timer=[NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}

-(void)removeTimer
{
    [self.timer invalidate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end






























