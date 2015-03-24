//
//  addViewController.m
//  iOS开发Ui篇-实现一个私人通讯录小应用(一)
//
//  Created by 谢俊伟 on 14-8-12.
//  Copyright (c) 2014年 a. All rights reserved.
//


#import "addViewController.h"
#import "InfoModel.h"


@interface addViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
- (IBAction)addBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *addbtn;

@end

@implementation addViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.addbtn.enabled=NO;
    //1.获得通知中心
    NSNotificationCenter *center=[NSNotificationCenter defaultCenter];
    //2.注册监听
    [center addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.nameField];
    [center addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.phoneField];
}

//当文本框内容改变的时候，通知self调用该方法
-(void)textChange
{
    //判断，如果两个文本框的内容都改变（有值）的时候，添加按钮变成可交互的
    self.addbtn.enabled=(self.nameField.text.length>0&&self.phoneField.text.length>0);
    NSLog(@"通知调用的事件");
}

- (void)viewDidAppear:(BOOL)animated
{
    // 3.主动召唤出键盘
    [self.nameField becomeFirstResponder];
    //    [self.nameField resignFirstResponder];
}

- (IBAction)addBtnOnclick:(id)sender {
    
    //点击添加按钮后，把数据保存到模型数组中
    //跳转
    [self.navigationController popViewControllerAnimated:YES];
    
    //1.把当前界面文本框中的信息保存到模型中
    InfoModel *info=[[InfoModel alloc]init];
    info.name=self.nameField.text;
    info.phone=self.phoneField.text;
    
    //2.数据逆传（把当前控制器view的数据传递到上一个控制器的view中）
    //使用代理，自定义一个代理，并使用代理传递数据
    //如果代理方法存在就通知代理调用该方法，传递数据
    if ([self.delegate respondsToSelector:@selector(addViewControllerDidAddBtn:contatc:)]) {
        NSLog(@"sadafaf");
        [self.delegate addViewControllerDidAddBtn:self contatc:info];
    }
    
    NSLog(@"dddd");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addBtn:(UIButton *)sender {
}
@end
