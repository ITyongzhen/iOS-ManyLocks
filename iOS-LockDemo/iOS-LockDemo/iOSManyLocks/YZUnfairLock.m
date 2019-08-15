//
//  YZUnfairLock.m
//  iOS-LockDemo
//
//  Created by eagle on 2018/7/29.
//  Copyright © 2018 yongzhen. All rights reserved.
//

#import "YZUnfairLock.h"
#import <os/lock.h>

@interface YZUnfairLock()
@property (nonatomic ,assign) os_unfair_lock moneyLock;

@end

@implementation YZUnfairLock
- (instancetype)init
{
    
    if (self = [super init]) {
        self.moneyLock = OS_UNFAIR_LOCK_INIT;
    }
    return self;
}

- (void)__saveMoney
{
    os_unfair_lock_lock(&_moneyLock);
    
    [super __saveMoney];
    
    os_unfair_lock_unlock(&_moneyLock);
}

- (void)__drawMoney
{
    os_unfair_lock_lock(&_moneyLock);
    
    [super __drawMoney];
    
    os_unfair_lock_unlock(&_moneyLock);
}
- (void)__UseApi{
    // 初始化
    os_unfair_lock lock = OS_UNFAIR_LOCK_INIT;
    //尝试加锁(如果不需要等待，就直接加锁，返回true。如果需要等待，就不加锁，返回false)
    BOOL res = os_unfair_lock_trylock(&lock);
    //加锁
    os_unfair_lock_lock(&lock);
    //解锁
    os_unfair_lock_unlock(&lock);
}

@end
