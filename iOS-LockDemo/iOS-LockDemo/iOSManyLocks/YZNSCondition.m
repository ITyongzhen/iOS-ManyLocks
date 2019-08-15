//
//  YZNSCondition.m
//  iOS-LockDemo
//
//  Created by eagle on 2018/8/14.
//  Copyright © 2018 yongzhen. All rights reserved.
//

#import "YZNSCondition.h"

@interface YZNSCondition()
@property (strong, nonatomic) NSCondition *condition;
@property (strong, nonatomic) NSMutableArray *data;
@end

@implementation YZNSCondition

- (instancetype)init
{
    if (self = [super init]) {
        self.condition = [[NSCondition alloc] init];
        self.data = [NSMutableArray array];
    }
    return self;
}

- (void)otherTest
{
    [[[NSThread alloc] initWithTarget:self selector:@selector(__remove) object:nil] start];
    
    [[[NSThread alloc] initWithTarget:self selector:@selector(__add) object:nil] start];
}
// 生产者-消费者模式

// 线程1
// 删除数组中的元素
- (void)__remove
{
    [self.condition lock];
    
    
    if (self.data.count == 0) {
        // 数据为空就等待（进入休眠，放开锁，被唤醒后，会再次对mutex加锁）
        NSLog(@"__remove - 等待");
        [self.condition wait];
    }
    
    [self.data removeLastObject];
    NSLog(@"删除了元素");
    
    [self.condition unlock];
}

// 线程2
// 往数组中添加元素
- (void)__add
{
    [self.condition lock];
    
    sleep(1);
    
    [self.data addObject:@"Test"];
    NSLog(@"添加了元素");
    
    // 激活一个等待该条件的线程
    [self.condition signal];
    // 激活所有等待该条件的线程
    //     [self.condition broadcast];
    
    [self.condition unlock];
}

@end
