//
//  ViewController.m
//  iOS开发-懒加载
//
//  Created by 谢俊伟 on 14-8-5.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "ViewController.h"

#define POTOIMGW 200
#define POTOIMGH 300
#define POTOIMGX    60
#define  POTOIMGY    50

@interface ViewController ()

@property(nonatomic,strong)UILabel *firstlab;
@property(nonatomic,strong)UILabel *lastlab;
@property(nonatomic,strong)UIImageView *icon;
@property(nonatomic,strong)UIButton *leftbtn;
@property(nonatomic,strong)UIButton *rightbtn;
@property(nonatomic,strong)NSArray *array;
@property(nonatomic ,assign)int i;
-(void)change;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self change];
}

-(void)change
{
    [self.firstlab setText:[NSString stringWithFormat:@"%d/%d",self.i+1,self.array.count+1]];
    //先get再set
    
    self.icon.image=[UIImage imageNamed:self.array[self.i][@"name"]];
    self.lastlab.text=self.array[self.i][@"desc"];
    
    self.leftbtn.enabled=(self.i!=0);
    self.rightbtn.enabled=(self.i!=self.array.count-1);
}

//延迟加载
/**1.图片的序号标签*/
-(UILabel *)firstlab
{
    //判断是否已经有了，若没有，则进行实例化
    if (!_firstlab) {
        _firstlab=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 300, 30)];
        [_firstlab setTextAlignment:NSTextAlignmentCenter];
        [self.view addSubview:_firstlab];
    }
    return _firstlab;
}

/**2.图片控件的延迟加载*/
-(UIImageView *)icon
{
    //判断是否已经有了，若没有，则进行实例化
    if (!_icon) {
        _icon=[[UIImageView alloc]initWithFrame:CGRectMake(POTOIMGX, POTOIMGY, POTOIMGW, POTOIMGH)];
        UIImage *image=[UIImage imageNamed:self.array[self.i][@"name"]];
        _icon.image=image;
        [self.view addSubview:_icon];
    }
    return _icon;
}

/**3.描述控件的延迟加载*/
-(UILabel *)lastlab
{
    //判断是否已经有了，若没有，则进行实例化
    if (!_lastlab) {
        _lastlab=[[UILabel alloc]initWithFrame:CGRectMake(20, 400, 300, 30)];
        [_lastlab setTextAlignment:NSTextAlignmentCenter];
        [self.view addSubview:_lastlab];
    }
    return _lastlab;
}

/**4.左键按钮的延迟加载*/
-(UIButton *)leftbtn
{
    //判断是否已经有了，若没有，则进行实例化
    if (!_leftbtn) {
        _leftbtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _leftbtn.frame=CGRectMake(0, self.view.center.y, 40, 40);
        [_leftbtn setBackgroundImage:[UIImage imageNamed:@"left_arrow"] forState:UIControlStateNormal];
        [_leftbtn setBackgroundImage:[UIImage imageNamed:@"left_arrowhighlight"] forState:UIControlStateHighlighted];
        [self.view addSubview:_leftbtn];
        [_leftbtn addTarget:self action:@selector(leftclick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftbtn;
    
}

/**5.右键按钮的延迟加载*/
-(UIButton *)rightbtn
{
    if (!_rightbtn) {
        _rightbtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _rightbtn.frame=CGRectMake(POTOIMGX+POTOIMGW+10, self.view.center.y, 40, 40);
        [_rightbtn setBackgroundImage:[UIImage imageNamed:@"right_arrow"] forState:UIControlStateNormal];
        [_rightbtn setBackgroundImage:[UIImage imageNamed:@"right_arrowhighlight"] forState:UIControlStateHighlighted];
        [self.view addSubview:_rightbtn];
        [_rightbtn addTarget:self action:@selector(rightclick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightbtn;
}

//array的get方法
-(NSArray *)array
{
    if (_array==nil) {
        NSString *path=[[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
        _array=[[NSArray alloc]initWithContentsOfFile:path];
    }
    return _array;
}

-(void)rightclick:(UIButton *)btn
{
    self.i++;
    [self change];
}

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
