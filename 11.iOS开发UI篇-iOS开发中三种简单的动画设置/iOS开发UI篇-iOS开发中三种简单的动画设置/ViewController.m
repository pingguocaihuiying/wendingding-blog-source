//
//  ViewController.m
//  iOS开发UI篇-iOS开发中三种简单的动画设置
//
//  Created by 谢俊伟 on 14-8-6.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *animation;

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
- (IBAction)action:(UIButton *)sender {
    NSLog(@"pressed");
    NSMutableArray *arrayM=[NSMutableArray array];
    for (int i=1; i<35; i++) {
        [arrayM addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i]]];
    }
    
    [self.animation setAnimationImages:arrayM];
    [self.animation setAnimationRepeatCount:1];
    [self.animation setAnimationDuration:4];
    [self.animation startAnimating];
}

@end
