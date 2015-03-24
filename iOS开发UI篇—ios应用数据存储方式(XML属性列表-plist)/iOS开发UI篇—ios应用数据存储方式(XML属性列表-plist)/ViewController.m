//
//  ViewController.m
//  iOS开发UI篇—ios应用数据存储方式(XML属性列表-plist)
//
//  Created by 谢俊伟 on 14-8-11.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)saveDataBtnClick:(UIButton *)sender {
    //获取应用程序根目录
    NSString *home=NSHomeDirectory();
    NSLog(@"NSHomeDirectory() %@",home);
    
    
    // 不建议写/
    //NSString *path = [home stringByAppendingString:@"/Documents"];
    // 不建议Documents写死
    //NSString *path = [home stringByAppendingPathComponent:@"Documents"];
    
    // NSUserDomainMask 在用户目录下查找
    // YES 代表用户目录的~
    // NSDocumentDirectory 查找Documents文件夹
    
    //建议用如下方法动态获取
    NSString *doc=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"%@",doc);
    NSString *path=[doc stringByAppendingPathComponent:@"abc.plist"];
    NSLog(@"%@",path);
    
    NSDictionary *dict=@{@"person": @"abc"};
    [dict writeToFile:path atomically:YES];
}
- (IBAction)readDataBtnClick:(UIButton *)sender {
    NSString *doc=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *path=[doc stringByAppendingPathComponent:@"abc.plist"];
    NSDictionary *dict=[NSDictionary dictionaryWithContentsOfFile:path];
    NSLog(@"%@",dict);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
