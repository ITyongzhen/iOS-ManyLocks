//
//  YZMutexRecursiveLock.m
//  iOS-LockDemo
//
//  Created by eagle on 2018/8/9.
//  Copyright © 2018 yongzhen. All rights reserved.
//

#import "YZMutexRecursiveLock.h"
#import <pthread.h>

@interface YZMutexRecursiveLock()
@property (assign, nonatomic) pthread_mutex_t MutexLock;

@end

@implementation YZMutexRecursiveLock

/**
 初始化锁
 
 @param mutex 锁
 */
- (void)__initMutexLock:(pthread_mutex_t *)mutex{
    // 递归锁：允许同一个线程对一把锁进行重复加锁
    
    // 初始化属性
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
    // 初始化锁
    pthread_mutex_init(mutex, &attr);
    // 销毁属性
    pthread_mutexattr_destroy(&attr);

    
}

- (void)otherTest{
    // 第一次进来直接加锁，第二次进来，已经加锁了。还能递归继续加锁
    pthread_mutex_lock(&_MutexLock);
    NSLog(@"加锁 %s",__func__);
    static int count = 0;
    if (count < 5) {
        count++;
        [self otherTest];
    }
     NSLog(@"解锁 %s",__func__);
    pthread_mutex_unlock(&_MutexLock);
    
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self __initMutexLock:&_MutexLock];
    }
    return self;
}

- (void)dealloc
{
    //delloc时候，需要销毁锁
    pthread_mutex_destroy(&_MutexLock);
}
@end
