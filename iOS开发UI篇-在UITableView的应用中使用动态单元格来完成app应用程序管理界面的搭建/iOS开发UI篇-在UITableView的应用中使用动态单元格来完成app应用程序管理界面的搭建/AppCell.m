//
//  AppCell.m
//  iOS开发UI篇-在UITableView的应用中使用动态单元格来完成app应用程序管理界面的搭建
//
//  Created by 谢俊伟 on 14-8-9.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "AppCell.h"
#import "AppInfo.h"
@interface AppCell()
@property (weak, nonatomic) IBOutlet UIImageView *appimg;
@property (weak, nonatomic) IBOutlet UILabel *apptitle;
@property (weak, nonatomic) IBOutlet UILabel *appdownload;
@property (weak, nonatomic) IBOutlet UIButton *appbtn;


@end

@implementation AppCell

-(void)setApp:(AppInfo *)app
{
    _app=app;
    self.apptitle.text=_app.name;
    self.appdownload.text=[NSString stringWithFormat:@"大小 %@ 下载量%@",_app.size,_app.download];
    self.appimg.image=[UIImage imageNamed:_app.icon];
}

- (IBAction)btnOnClick:(UIButton *)sender {
    sender.enabled=NO;
    if ([self.delegate respondsToSelector:@selector(btnDidClick:)]) {
        [self.delegate btnDidClick:self];
    }
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
