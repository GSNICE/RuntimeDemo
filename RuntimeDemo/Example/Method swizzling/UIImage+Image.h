//
//  UIImage+Image.h
//  RuntimeDemo
//
//  Created by Gavin on 2020/4/10.
//  Copyright © 2020 GSNICE. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Image)

// 传入 一个字符串 -> 返回 不被 渲染的原始图片
+ (id)imageOriginalWithImageName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
