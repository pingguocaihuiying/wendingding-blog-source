//
//  ViewController.m
//  iOS开发Ui篇-实现一个私人通讯录小应用(一)
//
//  Created by 谢俊伟 on 14-8-11.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD.h"
#import "MBProgressHUD+show.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *numberField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UISwitch *rempwdSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;
- (IBAction)rempwdChange:(UISwitch *)sender;
- (IBAction)loginBtnChange:(UISwitch *)sender;
- (IBAction)loginBrnOnClick:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSNotificationCenter *center=[NSNotificationCenter defaultCenter];
    
    //
    [center addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.numberField];
    [center addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.pwdField];
    self.loginBtn.enabled=NO;
}

-(void)textChange
{
    NSLog(@"textchange");
    self.loginBtn.enabled=(self.numberField.text.length>0&&self.pwdField.text.length>0);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rempwdChange:(UISwitch *)sender {
    if (self.rempwdSwitch.isOn==NO) {
        [self.autoLoginSwitch setOn:NO animated:YES];
    }
}

- (IBAction)loginBtnChange:(UISwitch *)sender {
    if (self.autoLoginSwitch.isOn==YES) {
        [self.rempwdSwitch setOn:YES animated:YES];
    }
}

- (IBAction)loginBrnOnClick:(UIButton *)sender {
    //[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [MBProgressHUD showMessage:@"正在努力加载...."];
    
    //让后面的操作在3秒钟之后再执行
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        if (![self.numberField.text isEqualToString:@"YY"]) {
//            //登录操作后，取出蒙版
//            [MBProgressHUD hideHUD];
//            //输入账号不正确，则提示错误信息
//            [MBProgressHUD showError:@"输入的账号不存在！"];
//            return;
//        }
//        if (![self.pwdField.text isEqualToString:@"123"]) {
//            //输入密码不正确，则提示错误信息
//            [MBProgressHUD hideHUD];
//            [MBProgressHUD showError:@"输入的密码不正确!"];
//            return;
//        }
        //如果密码和账号都正确的话，跳转到新的界面
        //移除蒙版
        [MBProgressHUD hideHUD];
        //跳转到新的界面，使用segue(需要判断-手动)
        [self performSegueWithIdentifier:@"login2contact" sender:@"xjw"];
    });
    
    //[MBProgressHUD hideHUD];
    //[MBProgressHUD showMessage:@"s" view:self.view];
}

//在segue跳转之前会调用这个方法，会传入performSegueWithIdentifier方法创建好的segue对象
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"%@",sender);
    //数据的正向传递
    //1.拿到目标控制器
    UIViewController *vc=segue.destinationViewController;
    //2.设置目标控制器的标题
    vc.title=[NSString stringWithFormat:@"%@的联系人列表",self.numberField.text];
    
    /*
     // 执行segue的perform内部实现
     UIViewController *sourceVc = segue.sourceViewController;
     UINavigationController *nav = sourceVc.navigationController;
     [nav pushViewController:segue.destinationViewController animated:YES];
     */
}


@end


























