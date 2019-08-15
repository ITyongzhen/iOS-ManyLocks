//
//  YZBaseLock.m
//  iOS-LockDemo
//
//  Created by eagle on 2018/7/29.
//  Copyright © 2018 yongzhen. All rights reserved.
//

#import "YZBaseLock.h"

@interface YZBaseLock()
@property (assign, nonatomic) int money;
@end
@implementation YZBaseLock

- (void)otherTest {}
/**
 存钱、取钱演示
 */
- (void)moneyTest
{
    self.money = 100;

    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self __saveMoney];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self __drawMoney];
        }
    });
}

/**
 存钱
 */
- (void)__saveMoney
{
    int oldMoney = self.money;
    sleep(.2);
    oldMoney += 10;
    self.money = oldMoney;
    
    NSLog(@"存10元，还剩%d元 - %@", oldMoney, [NSThread currentThread]);
}

/**
 取钱
 */
- (void)__drawMoney
{
    int oldMoney = self.money;
    sleep(.2);
    oldMoney -= 20;
    self.money = oldMoney;
    
    NSLog(@"取20元，还剩%d元 - %@", oldMoney, [NSThread currentThread]);
}



@end
