//
//  YZMutexLock.m
//  iOS-LockDemo
//
//  Created by eagle on 2018/8/8.
//  Copyright © 2018 yongzhen. All rights reserved.
//

#import "YZMutexLock.h"
#import <pthread.h>

@interface YZMutexLock()
@property (assign, nonatomic) pthread_mutex_t moneyMutexLock;

@end

@implementation YZMutexLock

/**
 初始化锁

 @param mutex 锁
 */
- (void)__initMutexLock:(pthread_mutex_t *)mutex{
    // 静态初始化
    //            pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
    
    // 初始化属性
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT);
    // 初始化锁
    pthread_mutex_init(mutex, &attr);
    // 销毁属性
    pthread_mutexattr_destroy(&attr);
    
   
    
    // 上面五行相当于下面一行
//    pthread_mutex_init(mutex, NULL); //传空，相当于PTHREAD_MUTEX_DEFAULT

}


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self __initMutexLock:&_moneyMutexLock];
    }
    return self;
}
- (void)__saveMoney
{
    pthread_mutex_lock(&_moneyMutexLock);
    
    [super __saveMoney];
    
     pthread_mutex_unlock(&_moneyMutexLock);
}

- (void)__drawMoney
{
     pthread_mutex_lock(&_moneyMutexLock);
    
    [super __drawMoney];
    
     pthread_mutex_unlock(&_moneyMutexLock);
}
- (void)dealloc
{
    //delloc时候，需要销毁锁
    pthread_mutex_destroy(&_moneyMutexLock);
}
@end
