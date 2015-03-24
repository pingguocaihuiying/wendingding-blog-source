//
//  main.m
//  iOS开发UI篇-KVC简单介绍
//
//  Created by 谢俊伟 on 14-8-5.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        //        NSLog(@"Hello, World!");
        Person *pppp1=[[Person alloc]init];
        [pppp1 setValue:@"yangyong" forKeyPath:@"name"];
        [pppp1 setValue:@"23" forKeyPath:@"age"];
        Book *book1=[[Book alloc]init];
        book1.bookname=@"iPhone";
        pppp1.book=book1;
        
        Person *pppp2=[[Person alloc]init];
        [pppp2 setValue:@"heyun" forKeyPath:@"name"];
        [pppp2 setValue:@"22" forKeyPath:@"age"];
        Book *book2=[[Book alloc]init];
        book2.bookname=@"iOS";
        pppp2.book=book2;
        
        
        NSLog(@"%@",pppp1);
        NSLog(@"%@",[pppp2 valueForKeyPath:@"name"]);
        
        
        //建立一个存储person对象的数组
        NSArray *persons=@[pppp1,pppp2];
        NSLog(@"%@",[persons valueForKeyPath:@"book.bookname"]);
//        说明：用KVC取一个嵌套层次很深的路径的时候，只要诶它一个路径就能把想要的属性给拿出来。（.可以理解为路径。一直一直进入）。能够帮助我们很方便的编码
    }
    return 0;
}

