//
//  YZNSLock.m
//  iOS-LockDemo
//
//  Created by eagle on 2018/8/13.
//  Copyright © 2018 yongzhen. All rights reserved.
//

#import "YZNSLock.h"

@interface YZNSLock()
@property (nonatomic,strong) NSLock *lock;
@end


@implementation YZNSLock

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.lock =[[NSLock alloc] init];
    }
    return self;
}
- (void)__saveMoney
{
    [self.lock lock];
    [super __saveMoney];
    
    [self.lock unlock];
}

- (void)__drawMoney
{
    [self.lock lock];
    
    [super __drawMoney];
    
    [self.lock unlock];
}
- (void)dealloc
{
   
}

//- (void)lock; //加锁
//- (void)unlock; //解锁
//- (BOOL)tryLock; //尝试加锁，如果加锁失败，就返回NO,加锁成功就返回YES
//- (BOOL)lockBeforeDate:(NSDate *)limit; //在给定的时间内尝试加锁，加锁成功就返回YES,如果过了时间还没加上锁，就返回NO。

@end
