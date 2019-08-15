//
//  YZRwlock.m
//  iOS-LockDemo
//
//  Created by eagle on 2018/8/15.
//  Copyright © 2018 yongzhen. All rights reserved.
//

#import "YZRwlock.h"
#import <pthread.h>

@interface YZRwlock()
@property (assign, nonatomic) pthread_rwlock_t lock;

@end


@implementation YZRwlock

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 初始化锁
        pthread_rwlock_init(&_lock, NULL);
    }
    return self;
}

- (void)otherTest{
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    for (int i = 0; i < 3; i++) {
        dispatch_async(queue, ^{
            [self write];
            [self read];
        });
        
    }
    for (int i = 0; i < 3; i++) {
        dispatch_async(queue, ^{
            [self write];
        });
    }
}

- (void)read {
    pthread_rwlock_rdlock(&_lock);
    
    sleep(1);
    NSLog(@"%s", __func__);
    
    pthread_rwlock_unlock(&_lock);
}

- (void)write
{
    pthread_rwlock_wrlock(&_lock);
    
    sleep(1);
    NSLog(@"%s", __func__);
    
    pthread_rwlock_unlock(&_lock);
}

- (void)dealloc
{
    pthread_rwlock_destroy(&_lock);
}

-(void)test{
    // 初始化锁
    pthread_rwlock_t lock;
    pthread_rwlock_init(&lock, NULL);
    // 读-加锁
    pthread_rwlock_rdlock(&lock);
    // 读-尝试加锁
    pthread_rwlock_tryrdlock(&lock);
    // 写-加锁
    pthread_rwlock_wrlock(&lock);
    // 写-尝试加锁
    pthread_rwlock_trywrlock(&lock);
    // 解锁
    pthread_rwlock_unlock(&lock);
    // 销毁
    pthread_rwlock_destroy(&lock);
}

@end
