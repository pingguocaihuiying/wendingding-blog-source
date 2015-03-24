//
//  MBProgressHUD+show.m
//  iOS开发Ui篇-实现一个私人通讯录小应用(一)
//
//  Created by 谢俊伟 on 14-8-11.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "MBProgressHUD+show.h"

@implementation MBProgressHUD (show)

+(void)showMessage:(NSString *)message
{
    MBProgressHUD *hud=[[MBProgressHUD alloc]init];
    hud.labelText=message;
    hud.dimBackground=YES;
    UIWindow *window= [UIApplication sharedApplication].windows[0];
    [window addSubview:hud];
    [hud show:YES];
}

+(void)showError:(NSString *)error
{
    MBProgressHUD *hud=[[MBProgressHUD alloc]init];
    hud.labelText=error;
    hud.mode=MBProgressHUDModeCustomView;
    UIImageView *imv=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 32, 32)];
    imv.image=[UIImage imageNamed:@"error.png"];
    hud.customView=imv;
    UIWindow *window= [UIApplication sharedApplication].windows[0];
    [window addSubview:hud];
    [hud showAnimated:YES whileExecutingBlock:^{sleep(2);} completionBlock:^{[hud removeFromSuperview];}];
}


+(void)hideHUD
{
    UIWindow *window= [UIApplication sharedApplication].windows[0];
    [MBProgressHUD hideHUDForView:window animated:YES];
}

@end
