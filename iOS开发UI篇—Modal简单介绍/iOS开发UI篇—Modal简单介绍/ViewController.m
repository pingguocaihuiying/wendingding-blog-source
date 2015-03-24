//
//  ViewController.m
//  iOS开发UI篇—Modal简单介绍
//
//  Created by 谢俊伟 on 14-8-12.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "ViewController.h"
#import "twoViewController.h"
@interface ViewController ()
- (IBAction)jump2two:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)jump2two:(UIButton *)sender {
//    //创建一个新的modal并弹出
//    twoViewController *two=[[twoViewController alloc]init];
//    //在two上用导航控制器包装，让弹出的模态窗口有一个导航栏可以放返回按钮
//    UINavigationController *nvc=[[UINavigationController alloc]initWithRootViewController:two];
//    [self presentViewController:nvc animated:YES completion:^{
//        NSLog(@"弹出一个模态窗口");
//    }];
}

//通过segue跳转前，会调用这个方法，在这个方法中把数据传递给弹出来的模态窗口
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //拿到目标控制器
    UINavigationController *nav=segue.destinationViewController;
    twoViewController *two=(twoViewController *)nav.topViewController;
    //传递数据
    two.name=@"文顶顶";
}


@end
