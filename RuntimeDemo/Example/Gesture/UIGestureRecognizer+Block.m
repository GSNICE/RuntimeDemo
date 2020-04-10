//
//  UIGestureRecognizer+Block.m
//  RuntimeDemo
//
//  Created by Gavin on 2020/4/10.
//  Copyright © 2020 GSNICE. All rights reserved.
//

#import "UIGestureRecognizer+Block.h"
#import <objc/runtime.h>

static const int target_key;
@implementation UIGestureRecognizer (Block)
//  通过 runtime 的关联对象技术，对自定义的回调 Block 进行 setAssociated，然后通过给 Tap 手势添加 Action 的方式，在响应的 Action 中，通过 getAssociated 获得 Block，进行事件转发。
+(instancetype)gs_gestureRecognizerWithActionBlock:(GSGestureBlock)block {
    return [[self alloc] initWithActionBlock:block];
}

- (instancetype)initWithActionBlock:(GSGestureBlock)block {
    self = [self init];
    [self addActionBlock:block];
    [self addTarget:self action:@selector(invoke:)];
    return self;
}

-(void)addActionBlock:(GSGestureBlock)block {
    if (block) {
        objc_setAssociatedObject(self, &target_key, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}

-(void)invoke:(id)sender{
    GSGestureBlock block = objc_getAssociatedObject(self, &target_key);
    if (block) {
        block(sender);
    }
}

@end
