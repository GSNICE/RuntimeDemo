//
//  Person.m
//  RuntimeDemo
//
//  Created by Gavin on 2020/4/9.
//  Copyright © 2020 GSNICE. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

@implementation Person

+ (instancetype)modelIvaWayWithDict:(NSDictionary *)dict {
    id model = [[self alloc] init];
    unsigned int count = 0;
    
    Ivar *ivars = class_copyIvarList(self, &count);
    if (ivars) {
        for (int i = 0; i < count; i++) {
            Ivar ivar = ivars[i];
            NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];

            // 注意这里是拿到了成员变量带有下划线前缀的名称:"_name","_age"
            ivarName = [ivarName substringFromIndex:1];
            id value = dict[ivarName];
            [model setValue:value forKey:ivarName];
        }
    }
    return model;
}

+ (instancetype)modelPropertyWayWithDict:(NSDictionary *)dict {
    id model = [[self alloc] init];
    unsigned int count;
    objc_property_t *propertys = class_copyPropertyList(self, &count);
    for (int i = 0; i < count; i++) {
        objc_property_t property = propertys[i];
        const char *propertyName = property_getName(property);
        NSString *propertyNameStr = [NSString stringWithFormat:@"%s",propertyName];
        id value = dict[propertyNameStr];
        [model setValue:value forKey:propertyNameStr];
    }
    return model;
}



@end
