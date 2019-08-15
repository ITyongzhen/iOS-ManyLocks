//
//  ViewController.m
//  iOS-LockDemo
//
//  Created by eagle on 2018/7/29.
//  Copyright © 2018 yongzhen. All rights reserved.
//

#import "ViewController.h"
#import "YZBaseLock.h"
#import "YZOSSpinLock.h"
#import "YZUnfairLock.h"
#import "YZMutexLock.h"
#import "YZMutexRecursiveLock.h"
#import "YZMutexCondLock.h"
#import "YZNSLock.h"
#import "YZNSRecursiveLock.h"
#import "YZNSCondition.h"
#import "YZNSConditionLock.h"
#import "YZSemaphore.h"
#import "YZSynchronized.h"
#import "YZRwlock.h"
#import "YZBarrier.h"
#import "YZDispatchGroup.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    YZBaseLock *lock = [[YZDispatchGroup alloc] init];
//    [lock moneyTest];
    [lock otherTest];
    
    
    
    
}


@end
