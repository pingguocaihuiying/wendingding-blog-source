//
//  TuanGouCell.m
//  iOS开发UI篇-使用xib自定义UITableViewCell实现一个简单的团购应用界面布局
//
//  Created by 谢俊伟 on 14-8-7.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "TuanGouCell.h"
//私有扩展
@interface TuanGouModel()
//@property (strong, nonatomic) IBOutlet UIImageView *img;
@end

@implementation TuanGouCell

-(void)setTg:(TuanGouModel *)tg
{
    _tg=tg;
    self.img.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",tg.icon]];
    self.titlelab.text=tg.title;
    self.pricelab.text=[NSString stringWithFormat:@"%@元",tg.price];
    self.buyCount.text=[NSString stringWithFormat:@"已有%@人购买",tg.buyCount];
}

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier=@"tg";
    TuanGouCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"tgcell" owner:nil options:nil]firstObject];
    }
    return cell;
}

//- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        // Initialization code
//    }
//    return self;
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated
//{
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
