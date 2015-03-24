//
//  ViewController.m
//  iOS开发UI篇—ios应用数据存储方式(归档)
//
//  Created by 谢俊伟 on 14-8-11.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

}
- (IBAction)saveBtnOnclick:(UIButton *)sender {
    Student *student=[[Student alloc]init];
    student.name=@"谢俊伟";
    student.age=25;
    student.height=1.9;
    student.weight=62;
    
    //获取文件路径
    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path=[docPath stringByAppendingPathComponent:@"student.xjw"];
    
    //将自定义的对象保存到文件
    [NSKeyedArchiver archiveRootObject:student toFile:path];
}
- (IBAction)readBtnOnclick:(UIButton *)sender {
    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path=[docPath stringByAppendingPathComponent:@"student.xjw"];
    
    //从文件中读取对象
    Student *student=[NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSLog(@"%@ %D %.1f %f",student.name,student.age,student.height,student.weight);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
