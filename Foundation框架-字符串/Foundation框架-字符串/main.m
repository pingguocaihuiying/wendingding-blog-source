//
//  main.m
//  Foundation框架-字符串
//
//  Created by 谢俊伟 on 14-8-3.
//  Copyright (c) 2014年 a. All rights reserved.
//http://www.cnblogs.com/wendingding/p/3711400.html

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        //--------------------------------------------------
        //NSString和NSMutableString的使用与注意
        //6中创建字符串的形式
        //最简单快速的创建方式
        NSString *s1=@"yangyong";
        //使用格式
        NSString *s3=[[NSString alloc]initWithFormat:@"my age is %d",10];
        //C字符串转换为OC字符串
        NSString *s4=[[NSString alloc]initWithUTF8String:"a"];
        //OC字符串转为C字符串
        const char *cs=[s4 UTF8String];
        
        //从文件读取信息到字符串
        //NSUTF8StringEncoding 用到中文就可以用这种编码
        NSString *s5=[[NSString alloc]initWithContentsOfFile:@"path" encoding:NSUTF8StringEncoding error:nil];
        
        //根据资源路径读取内容到字符串
        NSURL *url=[NSURL fileURLWithPath:@"path"];
        NSString *s6=[[NSString alloc]initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
        //打印内容
        NSLog(@"s6=\n%@",s6);
        //--------------------------------------
        //使用注意
        //字符串的导入导出
        //把字符串写入到文件,若这个文件不存在则创建一个
        [@"content" writeToFile:@"path.txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];
        //如果要换行的话,使用\n,可以通过统计\n的个数来测试代码量
        
        //把字符串导入到资源位置
        NSString *str=@"123asd";
        NSURL *url1=[NSURL fileURLWithPath:@"path.txt"];
        [str writeToURL:url atomically:YES encoding:NSUTF8StringEncoding error:nil];
        //类方法
        //在实际的开发过程中,通常直接使用类方法
//        [NSURL URLWithString:<#(NSString *)#>];
//        [NSString stringWithFormat:<#(NSString *), ...#>];
//        [NSString stringWithContentsOfFile:<#(NSString *)#> encoding:<#(NSStringEncoding)#> error:<#(NSError *__autoreleasing *)#>];
        //--------------------------------------
        //NSMutableString的使用和注意
        NSMutableString *s7=[NSMutableString stringWithString:@"yangyong age is 23"];
        [s7 appendString:@"haha"];
        
        //修改 删除
        //获取is的范围
        //在开发中,通常把这两个方法连起来使用,一个获取范围,一个删除
        NSRange range=[s7 rangeOfString:@"is"];
        [s7 deleteCharactersInRange:range];
        
        //不可变字符串
        NSString *s8=@"age is 10";
        NSString *s9=[s8 stringByAppendingString:@"xx"];
        
        

        
        //NSLog(@"Hello, World!");
        
    }
    return 0;
}



























