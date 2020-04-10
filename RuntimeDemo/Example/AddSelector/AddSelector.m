//
//  AddSelector.m
//  RuntimeDemo
//
//  Created by Gavin on 2020/4/9.
//  Copyright © 2020 GSNICE. All rights reserved.
//

#import "AddSelector.h"
#import <objc/runtime.h>

@implementation AddSelector

/*
 在方法调用后，会进行消息发送（在类的方法缓存和class_rw_t中进行查找，以及此类的父类的方法缓存和class_rw_t中进行查找），如未能找到将进入动态方法解析阶段。
 由于是实例对象，则会调用实例方法：resolveInstanceMethod
 */
+(BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == @selector(eat)) {
        // 动态添加 eat 方法
        
        //第一个：给哪个类添加方法
        //第二个：添加方法的方法编号
        //第三个：添加方法的函数实现（函数地址）
        //第四个：函数的类型（返回值+参数类型） v:void @：对象->self
        class_addMethod(self, @selector(eat), eat, "v@:");
    }
    return [super resolveClassMethod:sel];
}

// 默认方法有两个隐式参数
void eat(id self, SEL sel)
{
    NSDictionary *dic = @{@"Fruits":@"apple",@"Vegetables":@"Potato"};
    NSLog(@"[AddSelector]===> %@ - %@ - Eat：%@",self,NSStringFromSelector(sel),dic);
}

@end
