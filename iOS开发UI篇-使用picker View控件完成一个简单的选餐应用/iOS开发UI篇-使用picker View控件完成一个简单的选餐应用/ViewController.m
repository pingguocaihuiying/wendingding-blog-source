//
//  ViewController.m
//  iOS开发UI篇-使用picker View控件完成一个简单的选餐应用
//
//  Created by 谢俊伟 on 14-8-11.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *fruitLab;
@property (strong, nonatomic) IBOutlet UILabel *stapleLab;
@property (strong, nonatomic) IBOutlet UILabel *drinkLab;
@property (strong, nonatomic) NSArray *foods;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
- (IBAction)randomFood:(UIButton *)sender;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    for (int component=0; component<self.foods.count; component++) {
        [self pickerView:nil didSelectRow:1 inComponent:component];
    }
}

-(NSArray *)foods
{
    if (_foods==nil) {
        NSString *fullpath=[[NSBundle mainBundle]pathForResource:@"foods.plist" ofType:nil];
        NSArray *arrayM=[NSArray arrayWithContentsOfFile:fullpath];
        _foods=arrayM;
    }
    return _foods;
}

- (IBAction)randomFood:(UIButton *)sender {
    for (int component=0; component<self.foods.count; component++) {
        int total=[self.foods[component] count];
        int randomNumber=arc4random()%total;
        int oldRow=[self.pickerView selectedRowInComponent:component];
        while (oldRow==randomNumber) {
            randomNumber=arc4random()%total;
        }
        [self.pickerView selectRow:randomNumber inComponent:component animated:YES];
        [self pickerView:nil didSelectRow:randomNumber inComponent:component];
    }
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return self.foods.count;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSArray *arrayM=self.foods[component];
    return arrayM.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSArray *arrayM=self.foods[component];
    NSString *name=arrayM[row];
    return  name;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString *name=self.foods[component][row];
    if (0==component)
    {
        self.fruitLab.text=name;
    }else if(1==component)
    {
        self.stapleLab.text=name;
    }else
    {
        self.drinkLab.text=name;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
