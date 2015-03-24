//
//  WeiboFrame.m
//  iOS开发UI篇-使用纯代码自定义UITableViewCell实现一个简单的微博界面布局
//
//  Created by 谢俊伟 on 14-8-8.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "WeiboFrame.h"
#import "Weibo.h"
#define NameFont [UIFont systemFontOfSize:15]
#define TextFont [UIFont systemFontOfSize:16]

@implementation WeiboFrame

-(void)setWeibo:(Weibo *)weibo
{
    _weibo=weibo;
    
    CGFloat padding=10;
    
    //设置头像frame
    CGFloat iconViewX=padding;
    CGFloat iconViewY=padding;
    CGFloat iconViewW=30;
    CGFloat iconViewH=30;
    self.iconF=CGRectMake(iconViewX, iconViewY, iconViewW, iconViewH);
    
    //设置昵称Frame
    CGFloat nameLabelX=CGRectGetMaxX(self.iconF)+padding;
    //计算文字的宽高
//#warning 补全
    CGSize nameSize=[self sizeWithString:_weibo.name font:NameFont maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    CGFloat nameLabelH=nameSize.height;
    CGFloat nameLabelW=nameSize.width;
    CGFloat nameLabelY=iconViewY+(iconViewH-nameLabelH)*0.5;
    self.nameF=CGRectMake(nameLabelX, nameLabelY, nameLabelW, nameLabelH);
    
    // 设置vip的frame
    CGFloat vipViewX = CGRectGetMaxX(self.nameF) + padding;
    CGFloat vipViewY = nameLabelY;
    CGFloat vipViewW = 14;
    CGFloat vipViewH = 14;
    self.vipF = CGRectMake(vipViewX, vipViewY, vipViewW, vipViewH);
    
    // 设置正文的frame
    CGFloat introLabelX = iconViewX;
    CGFloat introLabelY = CGRectGetMaxY(self.iconF) + padding;
    CGSize textSize =  [self sizeWithString:_weibo.text font:TextFont maxSize:CGSizeMake(300, MAXFLOAT)];
    
    CGFloat introLabelW = textSize.width;
    CGFloat introLabelH = textSize.height;
    
    self.introF = CGRectMake(introLabelX, introLabelY, introLabelW, introLabelH);
    
    //设置配图的frame
    //CGFloat cellHeight=0;
    if (_weibo.picture)
    {
        CGFloat pictureViewX=iconViewX;
        CGFloat pictureViewY=CGRectGetMaxY(self.introF)+padding;
        CGFloat pictureViewW=100;
        CGFloat pictureViewH=100;
        self.pictureF=CGRectMake(pictureViewX, pictureViewY, pictureViewW, pictureViewH);
        
        self.cellHeight=CGRectGetMaxY(self.pictureF)+padding;
    }else
    {
        self.cellHeight=CGRectGetMaxY(self.introF)+padding;
    }
    
}

-(CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *dict=@{NSFontAttributeName: font};
    
    CGSize size=[str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}

@end























