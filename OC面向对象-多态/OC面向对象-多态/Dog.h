//
//  Dog.h
//  OC面向对象-多态
//
//  Created by 谢俊伟 on 14-8-2.
//  Copyright (c) 2014年 a. All rights reserved.
//

#import "Animal.h"

//Dog类继承自Animal类,拥有了Animal类中的所有属性和方法
@interface Dog : Animal

//在子类中声明了父类中国年已有的eat方法,这称之为方法的重写
-(void)eat;
@end
