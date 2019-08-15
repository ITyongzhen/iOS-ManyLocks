//
//  YZOSSpinLock.m
//  iOS-LockDemo
//
//  Created by eagle on 2018/7/29.
//  Copyright © 2018 yongzhen. All rights reserved.
//

#import "YZOSSpinLock.h"
#import <libkern/OSAtomic.h>

@interface YZOSSpinLock()
@property (assign, nonatomic) OSSpinLock moneyLock;
@end

@implementation YZOSSpinLock

- (instancetype)init
{
    
    if (self = [super init]) {
        self.moneyLock = OS_SPINLOCK_INIT;
    }
    return self;
}

- (void)__drawMoney
{
    OSSpinLockLock(&_moneyLock);
    
    [super __drawMoney];
    
    OSSpinLockUnlock(&_moneyLock);
}

- (void)__saveMoney
{
    OSSpinLockLock(&_moneyLock);
    
    [super __saveMoney];
    
    OSSpinLockUnlock(&_moneyLock);
}

- (void)__UseApi{
    // 初始化
    OSSpinLock lock = OS_SPINLOCK_INIT;
    //尝试加锁(如果不需要等待，就直接加锁，返回true。如果需要等待，就不加锁，返回false)
    BOOL res = OSSpinLockTry(lock);
    //加锁
    OSSpinLockLock(lock);
    //解锁
    OSSpinLockUnlock(lock);
}


@end
