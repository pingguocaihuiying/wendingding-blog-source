//
//  ViewController.m
//  iOS开发篇-UITableview控件基本使用
//
//  Created by 谢俊伟 on 14-8-6.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "ViewController.h"
#import "Hero.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic)NSArray *heros;
@end

@implementation ViewController

#pragma mark - 懒加载
- (NSArray *)heros
{
    if (_heros == nil) {
        // 1.获得全路径
        NSString *fullPath =  [[NSBundle mainBundle] pathForResource:@"heros" ofType:@"plist"];
        // 2.更具全路径加载数据
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:fullPath];
        // 3.字典转模型
        NSMutableArray *models = [NSMutableArray arrayWithCapacity:dictArray.count];
        for (NSDictionary *dict in dictArray) {
            Hero *hero = [Hero heroWithDict:dict];
            [models addObject:hero];
        }
        // 4.赋值数据
        _heros = [models copy];
    }
    // 4.返回数据
    return _heros;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // 设置Cell的高度
    // 当每一行的cell高度一致的时候使用属性设置cell的高度
    self.tableView.rowHeight = 60;
    self.tableView.delegate = self;
    self.tableView.dataSource=self;
    
    
}

#pragma mark - UITableViewDataSource
// 返回多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
// 返回每一组有多少行
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heros.count;
}
// 返回哪一组的哪一行显示什么内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建CELL
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    // 2.设置数据
    // 2.1取出对应行的模型
    Hero *hero = self.heros[indexPath.row];
    // 2.2赋值对应的数据
    cell.textLabel.text = hero.name;
    cell.detailTextLabel.text = hero.intro;
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", hero.icon]];
    
    // 2.3设置cell的辅助视图
    // cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    if (0 == indexPath.row) {
        cell.accessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    }else
    {
        cell.accessoryView = [[UISwitch alloc] init];
    }
    //    UIButton *btn = [[UIButton alloc] init];
    //    btn.backgroundColor = [UIColor redColor];
    //    cell.accessoryView = btn;
    
    
    // 2.4设置cell的背景颜色
    cell.backgroundColor = [UIColor yellowColor];
    
    // 设置默认状态的背景
    //    UIView *view = [[UIView alloc] init];
    //    view.backgroundColor = [UIColor blueColor];
    //    cell.backgroundView = view;
    
    UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"buttondelete"]];
    cell.backgroundView = iv;
    
    // 设置选中状态的背景
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor purpleColor];
    cell.selectedBackgroundView = view2;
    // 3.返回cell
    return cell;
}

#pragma mark - 控制状态栏是否显示
/**
 *   返回YES代表隐藏状态栏, NO相反
 */
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
