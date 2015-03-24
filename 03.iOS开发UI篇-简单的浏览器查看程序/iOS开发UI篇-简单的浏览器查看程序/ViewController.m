//
//  ViewController.m
//  iOS开发UI篇-简单的浏览器查看程序
//
//  Created by 谢俊伟 on 14-8-5.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "ViewController.h"

#define POTOIMGW 200
#define POTOIMGH 300
#define POTOIMGX 60
#define POTOIMGY 50

@interface ViewController ()

//变量声明
@property (nonatomic,strong)UILabel *firstlab;
@property (nonatomic,strong)UILabel *lastlab;
@property (nonatomic,strong)UIImageView *icon;
@property (nonatomic,strong)UIButton *leftbtn;
@property (nonatomic,strong)UIButton *rightbtn;

@property (nonatomic,strong)NSArray *array;

-(void)change;
@property (nonatomic,assign)int i;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.i=0;
    //创建一个用来显示序号的lable控件
    UILabel *headlab=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 300, 30)];
    [headlab setTextAlignment:NSTextAlignmentCenter];
    [headlab setTextColor:[UIColor blackColor]];
    [self.view addSubview:headlab];
    self.firstlab=headlab;
    //创建一个用来装载图片的控件
    UIImageView *potoimg=[[UIImageView alloc]initWithFrame:CGRectMake(POTOIMGX, POTOIMGY, POTOIMGW, POTOIMGH)];
    UIImage *image=[UIImage imageNamed:@"01.jpg"];
    potoimg.image=image;
    [self.view addSubview:potoimg];
    self.icon=potoimg;
    //创建最下边描述图片的lablek=控件
    UILabel *desclab=[[UILabel alloc]initWithFrame:CGRectMake(20, 400, 300, 30)];
    [desclab setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:desclab];
    self.lastlab=desclab;
    
    //创建两个方向键按钮
    //设置为自定义类型
    UIButton *leftbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    leftbtn.frame=CGRectMake(0, self.view.center.y, 40, 40);
    [leftbtn setBackgroundImage:[UIImage imageNamed:@"left_arrow"] forState:UIControlStateNormal];
    [leftbtn setBackgroundImage:[UIImage imageNamed:@"left_arrowhighlight"] forState:UIControlStateHighlighted];
    [self.view addSubview:leftbtn];
    [leftbtn addTarget:self action:@selector(leftclick:) forControlEvents:UIControlEventTouchUpInside];
    self.leftbtn=leftbtn;
    
    UIButton *rightbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    rightbtn.frame=CGRectMake(POTOIMGX+POTOIMGW+10, self.view.center.y, 40, 40);
    [rightbtn setBackgroundImage:[UIImage imageNamed:@"right_arrow"] forState:UIControlStateNormal];
    [rightbtn setBackgroundImage:[UIImage imageNamed:@"right_arrowhighlight"] forState:UIControlStateHighlighted];
    [self.view addSubview:rightbtn];
    [rightbtn addTarget:self action:@selector(rightclick:) forControlEvents:UIControlEventTouchUpInside];
    self.rightbtn=rightbtn;
    
    [self change];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)change
{
    self.icon.image=[UIImage imageNamed:self.array[self.i][@"name"]];
    self.lastlab.text=self.array[self.i][@"desc"];
    [self.firstlab setText:[NSString stringWithFormat:@"%d/%d",self.i+1,self.array.count]];
    self.leftbtn.enabled=(self.i!=0);
    self.rightbtn.enabled=(self.i!=self.array.count-1);
    
}

-(NSArray *)array
{
    
    if (_array==nil) {
        NSString *path=[[NSBundle mainBundle]pathForResource:@"data" ofType:@"plist"];
        _array=[[NSArray alloc]initWithContentsOfFile:path];
        NSLog(@"获取数组");
    }
    return _array;
}

//向右按键
-(void)rightclick:(UIButton *)btn
{
    self.i++;
    [self change];
}

//向左按键
-(void)leftclick:(UIButton *)btn
{
    self.i--;
    [self change];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


























