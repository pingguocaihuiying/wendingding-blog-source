//
//  twoViewController.m
//  iOS开发UI篇—Modal简单介绍
//
//  Created by 谢俊伟 on 14-8-12.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "twoViewController.h"

@interface twoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nametext;

@end

@implementation twoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.nametext.text=self.name;
    NSLog(@"%@",self.name);
    //给导航条添加一个返回按钮
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(change)];
    self.view.backgroundColor=[UIColor orangeColor];
}

-(void)change
{
    //编写点击返回按钮的点击事件
    //点击返回按钮，移除当前模态窗口
    //    [self.navigationController dismissViewControllerAnimated:YES completion:^{
    //        NSLog(@"移除模态窗口");
    //    }];
    
    // 如果一个控制器是以模态的形式展现出来的, 可以调用该控制器以及该控制器的子控制器让让控制器消失
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"移除");
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
