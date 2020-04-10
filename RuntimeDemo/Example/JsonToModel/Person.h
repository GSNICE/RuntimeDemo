//
//  Person.h
//  RuntimeDemo
//
//  Created by Gavin on 2020/4/9.
//  Copyright © 2020 GSNICE. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *age;

///  通过获取成员变量列表的方式进行 Model To Dic 的转换（YYModel）
+ (instancetype)modelIvaWayWithDict:(NSDictionary *)dict;
///  通过获取属性列表的方式进行 Model To Dic 的转换（MJextension，JsonModel）
+ (instancetype)modelPropertyWayWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
