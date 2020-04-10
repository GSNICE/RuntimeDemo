//
//  Dog.m
//  RuntimeDemo
//
//  Created by Gavin on 2020/4/9.
//  Copyright © 2020 GSNICE. All rights reserved.
//

#import "Dog.h"

@interface Dog ()

@property (nonatomic, copy) NSString *babyName;

@property (nonatomic, copy) NSString *babyAge;

@end

@implementation Dog

- (instancetype)init {
    self = [super init];
    if (self) {
        _name = @"Lafei";
        _age = @"6";
        
        _babyName = @"Diandian";
        _babyAge = @"1";
    }
    return self;
}

@end
