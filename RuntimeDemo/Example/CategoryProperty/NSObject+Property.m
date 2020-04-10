//
//  NSObject+Property.m
//  RuntimeDemo
//
//  Created by Gavin on 2020/4/10.
//  Copyright © 2020 GSNICE. All rights reserved.
//

#import "NSObject+Property.h"
#import <objc/runtime.h>

static const char *kName = "name";
@implementation NSObject (Property)

- (NSString *)name {
    // 根据关联的key,获取关联的值
    return objc_getAssociatedObject(self, kName);
}

- (void)setName:(NSString *)name {
    
    // 参数1 <#id object#> 给那个对象添加关联
    // 参数2 <#const void *key#> 关联的key 值,通过这个key 值获取
    // 参数3 <#id value#> 关联的value
    // 参数4 <#objc_AssociationPolicy policy#> 关联的策略
    objc_setAssociatedObject(self, kName, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
