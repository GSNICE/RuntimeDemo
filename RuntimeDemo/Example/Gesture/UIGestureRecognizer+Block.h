//
//  UIGestureRecognizer+Block.h
//  RuntimeDemo
//
//  Created by Gavin on 2020/4/10.
//  Copyright © 2020 GSNICE. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^GSGestureBlock)(id gestureRecognizer);

@interface UIGestureRecognizer (Block)

+(instancetype)gs_gestureRecognizerWithActionBlock:(GSGestureBlock)block;

@end

NS_ASSUME_NONNULL_END
