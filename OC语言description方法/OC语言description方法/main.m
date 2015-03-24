//
//  main.m
//  OC语言description方法
//
//  Created by 谢俊伟 on 14-8-2.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
//两个成员变量
@property(nonatomic,assign)int age;
@property(nonatomic,strong)NSString *name;
@end

@implementation Person
//重写一个description方法,实现打印对象的所有成员变量
-(NSString *)description
{
    return [NSString stringWithFormat:@"age=%d,name=%@",_age,_name];
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        Person *p=[[Person alloc]init];
        p.age=10;
        p.name=@"yangyong";
        //使用NSLog打印对象
        NSLog(@"%@",p);
        Class c=[Person class];
        NSLog(@"%@",c);
        //NSLog(@"Hello, World!");
        
        //打印补充相关
        //打印对象地址
        NSLog(@"%p",p);
        //打印当前代码行号
        NSLog(@"%d",__LINE__);
        //打印当前文件路径
        NSLog(@"%s",__FILE__);
        //打印所属的方法或函数名
        NSLog(@"%s",__func__);

        
    }
    return 0;
}

