//
//  appView.m
//  iOS开发UI篇-xib的简单使用
//
//  Created by 谢俊伟 on 14-8-5.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "appView.h"

@interface appView()

@property (weak, nonatomic) IBOutlet UIImageView *appimg;
@property (weak, nonatomic) IBOutlet UILabel *applab;
@property (weak, nonatomic) IBOutlet UIButton *appbtn;

@property(strong,nonatomic)AppInfo *appinfo;

@end

@implementation appView

+(instancetype)appInfoView
{
    NSArray *arrayM=[[NSBundle mainBundle]loadNibNamed:@"appxib" owner:nil options:nil];
    appView *appview=[arrayM firstObject];
    return appview;
}

+(instancetype)appInfoViewWithappInfo:(AppInfo *)appinfo
{
    appView *appview=[self appInfoView];
    appview.appinfo=appinfo;
    return appview;
}

-(void)setAppinfo:(AppInfo *)appinfo
{
    _appinfo=appinfo;
    self.appimg.image=appinfo.image;
    self.applab.text=appinfo.name;
}

-(IBAction)Click
{
    self.appbtn.enabled=NO;
    
    AppInfo *appinfo=self.appinfo;
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(60, 450, 200, 20)];
    [lab setBackgroundColor:[UIColor lightGrayColor]];
    [lab setTextAlignment:NSTextAlignmentCenter];
    [lab setText:[NSString stringWithFormat:@"%@成功下载",appinfo.name]];
    //把lab添加到父视图（即view中）
    [self.superview addSubview:lab];
    
    lab.alpha=1.0;
    [UIView animateWithDuration:2.0 animations:^{
        lab.alpha=0;
    }completion:^(BOOL finished) {
        [lab removeFromSuperview];
    }];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
