//
//  WeiboCell.m
//  iOS开发UI篇-使用纯代码自定义UITableViewCell实现一个简单的微博界面布局
//
//  Created by 谢俊伟 on 14-8-7.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "WeiboCell.h"
#import "Weibo.h"
#import "WeiboFrame.h"
#define NameFont [UIFont systemFontOfSize:15]
#define TextFont [UIFont systemFontOfSize:16]

@interface WeiboCell ()
//头像
@property(nonatomic,weak)UIImageView *iconView;
//vip
@property(nonatomic,weak)UIImageView *vipView;
//配图
@property(nonatomic,weak)UIImageView *pictureView;
//昵称
@property(nonatomic,weak)UILabel *nameLable;
//正文
@property(nonatomic,weak)UILabel *introLable;
@end

@implementation WeiboCell

+(instancetype)cellWithTableView:(UITableView *)tableview
{
    static NSString *identfier=@"status";
    WeiboCell *cell=[tableview dequeueReusableCellWithIdentifier:identfier];
    if (cell==nil) {
        cell=[[WeiboCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identfier];
    }
    return cell;
}



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        //创建头像
        UIImageView *iconView=[[UIImageView alloc]init];
        [self.contentView addSubview:iconView];
        self.iconView=iconView;
        
        //创建昵称
        UILabel *nameLable=[[UILabel alloc]init];
        nameLable.font=NameFont;
        [self.contentView addSubview:nameLable];
        self.nameLable=nameLable;
        
        //创建VIP
        UIImageView *vipVIew=[[UIImageView alloc]init];
        vipVIew.image=[UIImage imageNamed:@"vip"];
        [self.contentView addSubview:vipVIew];
        self.vipView=vipVIew;
        
        //创建正文
        UILabel *introLable=[[UILabel alloc]init];
        introLable.font=TextFont;
        introLable.numberOfLines=0;
        [self.contentView addSubview:introLable];
        self.introLable=introLable;
        
        //创建配图
        UIImageView *pictureView=[[UIImageView alloc]init];
        [self.contentView addSubview:pictureView];
        self.pictureView=pictureView;
    }
    return self;
}

-(void)setWeiboFrame:(WeiboFrame *)weiboFrame
{
    _weiboFrame=weiboFrame;
    
    [self settingData];
    [self settingFrame];

}

-(void)settingData
{
//#warning 补全
    Weibo *weibo=self.weiboFrame.weibo;
    self.iconView.image=[UIImage imageNamed:weibo.icon];
    self.nameLable.text=weibo.name;
    if (weibo.vip) {
        self.vipView.hidden=NO;
        self.nameLable.textColor=[UIColor redColor];
    }else
    {
        self.vipView.hidden=YES;
        self.nameLable.textColor=[UIColor blackColor];
    }
    self.introLable.text=weibo.text;
    if (weibo.picture) {
        self.pictureView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", weibo.picture]];
        self.pictureView.hidden=NO;
    }else
    {
        self.pictureView.hidden=YES;
    }
    
}

-(void)settingFrame
{
    //#warning 补全
    self.iconView.frame=self.weiboFrame.iconF;
    self.nameLable.frame=self.weiboFrame.nameF;
    self.vipView.frame=self.weiboFrame.vipF;
    self.introLable.frame=self.weiboFrame.introF;
    if (self.weiboFrame.weibo.picture) {
        self.pictureView.frame=self.weiboFrame.pictureF ;
    }
}

-(CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *dict=@{NSFontAttributeName: font};
    CGSize size=[str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end





















