//
//  ViewController.m
//  iOS开发UI篇—ios应用数据存储方式(偏好设置)
//
//  Created by 谢俊伟 on 14-8-11.
//  Copyright (c) 2014年 a. All rights reserved.
//


//（1）偏好设置是专门用来保存应用程序的配置信息的, 一般情况不要在偏好设置中保存其他数据。如果利用系统的偏好设置来存储数据, 默认就是存储在Preferences文件夹下面的，偏好设置会将所有的数据都保存到同一个文件中。
//
//（2）使用偏好设置对数据进行保存之后, 它保存到系统的时间是不确定的，会在将来某一时间点自动将数据保存到Preferences文件夹下面，如果需要即刻将数据存储，可以使用[defaults synchronize];
//
//(3)注意点：所有的信息都写在一个文件中，对比简单的plist可以保存和读取基本的数据类型。
//
//(4)步骤：获取NSuserDefaults,保存（读取）数据


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)saveData:(UIButton *)sender {
    //获取对象
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    //保存数据
    [defaults setObject:@"yang" forKey:@"name"];
    [defaults setInteger:23 forKey:@"age"];
    [defaults setDouble:1.73f forKey:@"height"];
    [defaults setObject:@"man" forKey:@"gender"];
    
    //强制让数据立刻保存
    [defaults synchronize];
}

- (IBAction)readData:(UIButton *)sender {
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    NSString *name=[defaults objectForKey:@"name"];
    NSString *gender=[defaults objectForKey:@"gender"];
    NSInteger age=[defaults integerForKey:@"age"];
    double height=[defaults doubleForKey:@"height"];
    NSLog(@"%@ %@ %d %.1f",name,gender,age,height);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
