//
//  ViewController.m
//  iOS开发UI篇-九宫格坐标计算
//
//  Created by 谢俊伟 on 14-8-5.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)NSArray *apps;
@end

@implementation ViewController

- (NSArray *)apps
{
    if (!_apps) {
        NSString *path=[[NSBundle mainBundle]pathForResource:@"app.plist" ofType:nil];
        _apps=[NSArray arrayWithContentsOfFile:path];
    }
    return _apps;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%d",self.apps.count);
    
    //2.完成布局设计
    
    //三列
    int totalloc=3;
    CGFloat appvieww=80;
    CGFloat appviewh=90;
    
    CGFloat margin=(self.view.frame.size.width-totalloc*appvieww)/(totalloc+1);
    int count=self.apps.count;
    for (int i=0; i<count; i++) {
        int row=i/totalloc;//行号
        //1/3=0,2/3=0,3/3=1;
        int loc=i%totalloc;//列号
        
        CGFloat appviewx=margin+(margin+appvieww)*loc;
        CGFloat appviewy=margin+(margin+appviewh)*row;
        
        
        //创建uiview控件
        UIView *appview=[[UIView alloc]initWithFrame:CGRectMake(appviewx, appviewy, appvieww, appviewh)];
        //[appview setBackgroundColor:[UIColor purpleColor]];
        [self.view addSubview:appview];
        
        
        //创建uiview控件中的子视图
        UIImageView *appimageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 50)];
        UIImage *appimage=[UIImage imageNamed:self.apps[i][@"icon"]];
        appimageview.image=appimage;
        [appimageview setContentMode:UIViewContentModeScaleAspectFit];
        // NSLog(@"%@",self.apps[i][@"icon"]);
        [appview addSubview:appimageview];
        
        //创建文本标签
        UILabel *applable=[[UILabel alloc]initWithFrame:CGRectMake(0, 50, 80, 20)];
        [applable setText:self.apps[i][@"name"]];
        [applable setTextAlignment:NSTextAlignmentCenter];
        [applable setFont:[UIFont systemFontOfSize:12.0]];
        [appview addSubview:applable];
        
        //创建按钮
        UIButton *appbtn=[UIButton buttonWithType:UIButtonTypeCustom];
        appbtn.frame= CGRectMake(10, 70, 60, 20);
        [appbtn setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
        [appbtn setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
        [appbtn setTitle:@"下载" forState:UIControlStateNormal];
        appbtn.titleLabel.font=[UIFont systemFontOfSize:12.0];
        [appview addSubview:appbtn];
        
        [appbtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    }

}

-(void)click
{
    //动画标签
    UILabel *animalab=[[UILabel alloc]initWithFrame:CGRectMake(self.view.center.x-100, self.view.center.y+20, 200, 40)];
    [animalab setText:@"下载成功"];
    [animalab setTextAlignment:NSTextAlignmentCenter];
    animalab.font=[UIFont systemFontOfSize:18.0];
    [animalab setBackgroundColor:[UIColor brownColor]];
    [animalab setAlpha:0];
    [self.view addSubview:animalab];
    
//    [UIView beginAnimations:Nil context:Nil];
//    [animalab setAlpha:1];
//    [UIView setAnimationDuration:4.0];
//    [UIView commitAnimations];
    
    //执行完之后，还得把这给删除了，推荐使用block动画
    
    [UIView animateWithDuration:2.0 animations:^{
        [animalab setAlpha:0.8];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            [animalab setAlpha:0];
        } completion:^(BOOL finished) {
            [animalab removeFromSuperview];
        }];
    }];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
