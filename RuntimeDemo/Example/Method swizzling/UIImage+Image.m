//
//  UIImage+Image.m
//  RuntimeDemo
//
//  Created by Gavin on 2020/4/10.
//  Copyright © 2020 GSNICE. All rights reserved.
//

#import "UIImage+Image.h"
#import <objc/runtime.h>

@implementation UIImage (Image)
// load 方法只在类初始化加入内存中时执行一次，方法的交换只执行一次即可。
+ (void)load {
    Method originalMethod = class_getClassMethod(self, @selector(imageNamed:));
    
    Method replaceMethod = class_getClassMethod(self, @selector(imageOriginalWithImageName:));
    
    method_exchangeImplementations(originalMethod, replaceMethod);
}

+ (id)imageOriginalWithImageName:(NSString *)name {
    // UIImageRenderingModeAlwaysOriginal:始终绘制图片原始状态，不使用 Tint Color。
    UIImage *image = [[self imageOriginalWithImageName:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    if (image == nil) {
        NSLog(@"[Method swizzling]===> 加载图片为空!");
    }
    return image;
}

@end
