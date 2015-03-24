//
//  HeaderView.m
//  iOS开发UI篇-使用TableView完成一个简单的QQ好友列表(二)
//
//  Created by 谢俊伟 on 14-8-8.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "HeaderView.h"

@interface HeaderView()
@property(nonatomic,strong)UIButton *btn;
@property(nonatomic,strong)UILabel *lab;
@end

@implementation HeaderView

+(instancetype)headerWithTableView:(UITableView *)tableview
{
    static NSString *indentifier=@"header";
    HeaderView *headerview=[tableview dequeueReusableCellWithIdentifier:indentifier];
    if (headerview==nil) {
        headerview=[[HeaderView alloc]initWithReuseIdentifier:indentifier];
    }
    return headerview;
}

-(id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithReuseIdentifier:reuseIdentifier]) {
        //创建一个按钮
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        //设置按钮的属性
        [btn setBackgroundImage:[UIImage imageNamed:@"header_bg"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"header_bghighlight"] forState:UIControlStateHighlighted];
        [btn setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
        btn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
        btn.contentEdgeInsets=UIEdgeInsetsMake(0, 20, 0, 0);
        btn.titleEdgeInsets=UIEdgeInsetsMake(2, 20, 0, 0);
        //设置按钮上分组标题的文本颜色(默认是白色)
        //[btn setTintColor:[UIColor blackColor]];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
         //添加按钮的点击事件
        [btn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
         //设置btn中的图片不填充整个imageview
        btn.imageView.contentMode=UIViewContentModeCenter;
         //超出范围的图片不要剪切
         //btn.imageView.clipsToBounds=NO;
        btn.imageView.layer.masksToBounds=NO;
         
        [self addSubview:btn];
        self.btn=btn;
         //创建一个lab
        UILabel *lab=[[UILabel alloc]init];
        //设置在线人数的对齐方式为右对齐
        lab.textAlignment=NSTextAlignmentRight;
        //设置在线人数的文本颜色为灰色
        lab.textColor=[UIColor grayColor];
        [self addSubview:lab];
        self.lab=lab;
    }
    return self;
}

-(void)btnOnClick:(UIButton *)btn
{
    NSLog(@"pressed");
    self.group.open=!self.group.open;
    //刷新表格
    if ([self.delegate respondsToSelector:@selector(headerViewDidClickHeaderView:)]) {
        [self.delegate headerViewDidClickHeaderView:self];
    }
}

//当控件的frame值改变时,会自动调用该方法,故可以在该方法中设置控件的frame
-(void)layoutSubviews
{
    //一定不要忘记调用父类的方法
    [super layoutSubviews];
    self.btn.frame=self.bounds;
    
    //设置lab的frame
    CGFloat padding=20;
    CGFloat labW=50;
    CGFloat labH=self.frame.size.height;
    CGFloat labY=0;
    CGFloat labX=self.frame.size.width-padding-labW;
    self.lab.frame=CGRectMake(labX, labY, labW, labH);
}

//当一个控件被添加到其他视图上的时候会调用以下方法
-(void)didMoveToSuperview
{
    if (self.group.isOpen) {
        self.btn.imageView.transform=CGAffineTransformMakeRotation(M_PI_2);
    }
}

-(void)setGroup:(QQGroupModel *)group
{
    _group=group;
    [self.btn setTitle:_group.name forState:UIControlStateNormal];
    self.lab.text=[NSString stringWithFormat:@"%@/%D",_group.online,_group.friends.count];
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























