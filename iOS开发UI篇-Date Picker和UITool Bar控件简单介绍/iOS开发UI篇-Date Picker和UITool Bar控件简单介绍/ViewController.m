//
//  ViewController.m
//  iOS开发UI篇-Date Picker和UITool Bar控件简单介绍
//
//  Created by 谢俊伟 on 14-8-10.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *textfield;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIDatePicker *date=[[UIDatePicker alloc]init];
    
    [date setLocale:[NSLocale localeWithLocaleIdentifier:@"zh-CH"]];
    date.datePickerMode=UIDatePickerModeDate;
    
    self.textfield.inputView=date;
    
    UIToolbar *toolbar=[[UIToolbar alloc]init];
    
    toolbar.barTintColor=[UIColor brownColor];
    
    toolbar.frame=CGRectMake(0, 0, 320, 44);
    
    UIBarButtonItem *item0=[[UIBarButtonItem alloc]initWithTitle:@"上一个" style:UIBarButtonItemStylePlain target:self action:@selector(click)];
    UIBarButtonItem *item1=[[UIBarButtonItem alloc]initWithTitle:@"下一个" style:UIBarButtonItemStylePlain target:self action:@selector(click)];
    UIBarButtonItem *item2=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *item3=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(click)];
    toolbar.items=@[item0,item1,item2,item3];
    
    self.textfield.inputAccessoryView=toolbar;
}

-(void)click
{
    NSLog(@"toolbar");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
