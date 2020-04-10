//
//  ViewController.m
//  RuntimeDemo
//
//  Created by Gavin on 2020/4/9.
//  Copyright © 2020 GSNICE. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

#import "Person.h"

#import "Dog.h"

#import "AddSelector.h"

#import "UIGestureRecognizer+Block.h"

#import "NSObject+Property.h"

#import "UIImage+Image.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 1.Json 转 Model
//    [self jsonToModel];
    
    // 2.访问私有变量
//    [self privateProperty];
    
    // 3.动态添加方法
//    [self addSelector];
    
    //  4.通过 block 回调 直接调用手势识别的 Action
//    [self gestureRecognizer];
    
    //  5.分类添加属性
//    [self categoryProperty];
    
    //  6.Method swizzling
    [self loadImageView];
}

#pragma mark - JsonToModel
- (void)jsonToModel {
    NSDictionary *dict = @{@"name":@"Gavin",@"age":@"27"};
    Person *person = [Person modelPropertyWayWithDict:dict];
    NSLog(@"[JsonToModel]===> name = %@,age = %@",person.name,person.age);
}

#pragma mark - PrivateProperty
- (void)privateProperty {
    Dog *lafei = [[Dog alloc] init];
    // 参数(目标类的名称，目标属性的名称)
    Ivar ivar = class_getInstanceVariable([lafei class], "_babyName");
    // 获取数据
    id babyName = object_getIvar(lafei, ivar);
    NSLog(@"[PrivateProperty]===> Dog BabyName: %@",babyName);
}

#pragma mark - AddSelector
- (void)addSelector {
    AddSelector *p = [[AddSelector alloc] init];
    
    // 默认 addSelector，没有实现 eat 方法，可以通过 performSelector 调用，但是会报错
    // 动态添加方法就不会报错
    [p performSelector:@selector(eat)];
}
#pragma mark - GestureRecognizer
- (void)gestureRecognizer {
    [self.view addGestureRecognizer:[UITapGestureRecognizer gs_gestureRecognizerWithActionBlock:^(id  _Nonnull gestureRecognizer) {
        NSLog(@"点击了 View");
    }]];
}
#pragma mark - CategoryProperty
- (void)categoryProperty {
    NSObject *objc = [[NSObject alloc] init];
    objc.name = @"Gavin";
    NSLog(@"[CategoryProperty]===> %@",objc.name);
}
#pragma mark - Method swizzling
- (void)loadImageView {
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"image"];
}

@end
