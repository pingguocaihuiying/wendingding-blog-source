//
//  ViewController.m
//  ios开发UI开发基础-手写控件,frame,center和bounds属性
//
//  Created by 谢俊伟 on 14-8-3.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "ViewController.h"
//私有扩展
@interface ViewController ()
@property(nonatomic,weak)IBOutlet UIButton *headImageView;
@end

@implementation ViewController

typedef enum
{
    ktopbtntag=1,
    kdownbtntag,
    krightbtntag,
    kleftbtntag,
}btntag;



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //手写控件代码
    //一,写一个按钮控件,上面有一张图片
    //1.使用类创建一个按钮对象
    //设置按钮对象为自定义类型
    UIButton *headbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    //2.设置对象的各项属性
    //(1)位置等通用属性设置
    headbtn.frame=CGRectMake(100, 100, 100, 100);
    //(2)设置普通状态下按钮的属性
    [headbtn setBackgroundImage:[UIImage imageNamed:@"demo.jpg"] forState:UIControlStateNormal];
    [headbtn setTitle:@"click me" forState:UIControlStateNormal];
    [headbtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    //(3)设置高亮状态下按钮的属性
    [headbtn setBackgroundImage:[UIImage imageNamed:@"demo_highlight.jpg"] forState:UIControlStateHighlighted];
    [headbtn setTitle:@"its ok" forState:UIControlStateHighlighted];
    [headbtn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    //3.把对象添加到视图中展现出来
    [self.view addSubview:headbtn];
    self.headImageView=headbtn;

    //二,写四个控制图片上下左右移动方向的按钮控件
    
    //=======向上的按钮=======
    //1.创建按钮对象
    UIButton *topbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    //2.设置对象的属性
    topbtn.frame=CGRectMake(100, 250, 40, 40);
    [topbtn setBackgroundImage:[UIImage imageNamed:@"up_arrow"] forState:UIControlStateNormal];
    [topbtn setBackgroundImage:[UIImage imageNamed:@"up_arrowhighlight"] forState:UIControlStateHighlighted];
    [topbtn setTag:1];
    //3.把控件添加到视图中
    [self.view addSubview:topbtn];
    //4.按钮的单机控件事件
    [topbtn addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];

    //=======向下的按钮=======
    //1.创建按钮对象
    UIButton *downbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    //2.设置对象的属性
    downbtn.frame=CGRectMake(100, 350, 40, 40);
    [downbtn setBackgroundImage:[UIImage imageNamed:@"down_arrow"] forState:UIControlStateNormal];
    [downbtn setBackgroundImage:[UIImage imageNamed:@"down_arrowhighlight"] forState:UIControlStateHighlighted];
    [downbtn setTag:2];
    //3.把控件添加到视图中
    [self.view addSubview:downbtn];
    //4.按钮的单机控件事件
    [downbtn addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    
    //=======向左的按钮=======
    //1.创建按钮对象
    UIButton *leftbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    //2.设置对象的属性
    leftbtn.frame=CGRectMake(50, 300, 40, 40);
    [leftbtn setBackgroundImage:[UIImage imageNamed:@"left_arrow"] forState:UIControlStateNormal];
    [leftbtn setBackgroundImage:[UIImage imageNamed:@"left_arrowhighlight"] forState:UIControlStateHighlighted];
    [leftbtn setTag:4];
    //3.把控件添加到视图中
    [self.view addSubview:leftbtn];
    //4.按钮的单机控件事件
    [leftbtn addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    
    //=======向右的按钮=======
    //1.创建按钮对象
    UIButton *rightbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    //2.设置对象的属性
    rightbtn.frame=CGRectMake(150, 300, 40, 40);
    [rightbtn setBackgroundImage:[UIImage imageNamed:@"right_arrow"] forState:UIControlStateNormal];
    [rightbtn setBackgroundImage:[UIImage imageNamed:@"right_arrowhighlight"] forState:UIControlStateHighlighted];
    [rightbtn setTag:3];
    //3.把控件添加到视图中
    [self.view addSubview:rightbtn];
    //4.按钮的单机控件事件
    [rightbtn addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    
    //三,写两个缩放按钮
    //=======放大的按钮=======
    //创建对象
    UIButton *plusbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    //设置属性
    plusbtn.frame=CGRectMake(75, 400, 40, 40);
    [plusbtn setBackgroundImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
    [plusbtn setBackgroundImage:[UIImage imageNamed:@"plus_highlight"] forState:UIControlStateHighlighted];
    [plusbtn setTag:1];
    //添加视图
    [self.view addSubview:plusbtn];
    //4.单击事件
    [plusbtn addTarget:self action:@selector(Zoom:) forControlEvents:UIControlEventTouchUpInside];
    
    //=======缩小的按钮=======
    //创建对象
    UIButton *minusbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    //设置属性
    minusbtn.frame=CGRectMake(125, 400, 40, 40);
    [minusbtn setBackgroundImage:[UIImage imageNamed:@"minus"] forState:UIControlStateNormal];
    [minusbtn setBackgroundImage:[UIImage imageNamed:@"minus_highlight"] forState:UIControlStateHighlighted];
    [minusbtn setTag:0];
    //添加视图
    [self.view addSubview:minusbtn];
    //4.单击事件
    [minusbtn addTarget:self action:@selector(Zoom:) forControlEvents:UIControlEventTouchUpInside];
    
    //=======左旋的按钮=======
    //创建对象
    UIButton *leftrotatebtn=[UIButton buttonWithType:UIButtonTypeCustom];
    //设置属性
    leftrotatebtn.frame=CGRectMake(175, 400, 40, 40);
    [leftrotatebtn setBackgroundImage:[UIImage imageNamed:@"left_rotate"] forState:UIControlStateNormal];
    [leftrotatebtn setBackgroundImage:[UIImage imageNamed:@"left_rotatehighlight"] forState:UIControlStateHighlighted];
    [leftrotatebtn setTag:1];
    //添加视图
    [self.view addSubview:leftrotatebtn];
    //4.单击事件
    [leftrotatebtn addTarget:self action:@selector(Rotate:) forControlEvents:UIControlEventTouchUpInside];
    
    //=======右旋的按钮=======
    //创建对象
    UIButton *rightrotatebtn=[UIButton buttonWithType:UIButtonTypeCustom];
    //设置属性
    rightrotatebtn.frame=CGRectMake(225, 400, 40, 40);
    [rightrotatebtn setBackgroundImage:[UIImage imageNamed:@"right_rotate"] forState:UIControlStateNormal];
    [rightrotatebtn setBackgroundImage:[UIImage imageNamed:@"right_rotatehighlight"] forState:UIControlStateHighlighted];
    [rightrotatebtn setTag:0];
    //添加视图
    [self.view addSubview:rightrotatebtn];
    //4.单击事件
    [rightrotatebtn addTarget:self action:@selector(Rotate:) forControlEvents:UIControlEventTouchUpInside];
    
}

//控制方向的多个按钮调用同一个方法
-(void)Click:(UIButton *)button
{
    //练习使用frame属性
    //练习使用center属性
    CGPoint center=self.headImageView.center;
    switch (button.tag) {
        case ktopbtntag:
            center.y-=30;
            break;
        case kdownbtntag:
            center.y+=30;
            break;
        case kleftbtntag:
            center.x-=30;
            break;
        case krightbtntag:
            center.x+=30;
            break;
            
        default:
            break;
    }
    
    //首尾式设置动画效果
    [UIView beginAnimations:nil context:nil];
    self.headImageView.center=center;
    [UIView setAnimationDuration:2.0];
    [UIView commitAnimations];
    NSLog(@"moving");
}

-(void)Zoom:(UIButton *)btn
{
    //使用bounds,以中心为原点进行缩放
    CGRect bounds=self.headImageView.bounds;
    if (btn.tag) {
        bounds.size.height+=30;
        bounds.size.width+=30;
    }else{
        bounds.size.height-=30;
        bounds.size.width-=30;
    }
    //设置首尾动画
    [UIView beginAnimations:nil context:nil];
    self.headImageView.bounds=bounds;
    [UIView setAnimationDuration:2.0];
    [UIView commitAnimations];
}
//旋转
-(void)Rotate:(UIButton *)rotate
{
    if (rotate.tag) {
        self.headImageView.transform=CGAffineTransformRotate(self.headImageView.transform, -M_1_PI);
    }else
    {
        self.headImageView.transform=CGAffineTransformRotate(self.headImageView.transform, M_1_PI);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
































