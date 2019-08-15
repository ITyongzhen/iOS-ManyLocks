//
//  YZSynchronized.m
//  iOS-LockDemo
//
//  Created by eagle on 2018/8/14.
//  Copyright © 2018 yongzhen. All rights reserved.
//

#import "YZSynchronized.h"

@interface YZSynchronized()

@end

@implementation YZSynchronized
- (void)__saveMoney
{
    @synchronized (self) {
        [super __saveMoney];
    }
}

- (void)__drawMoney
{
    @synchronized (self) {
        [super __drawMoney];
    }
}
@end
