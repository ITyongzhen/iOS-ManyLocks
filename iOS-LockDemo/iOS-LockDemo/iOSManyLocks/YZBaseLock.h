//
//  YZBaseLock.h
//  iOS-LockDemo
//
//  Created by eagle on 2018/7/29.
//  Copyright © 2018 yongzhen. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface YZBaseLock : NSObject
- (void)moneyTest;
- (void)otherTest;
#pragma mark - 暴露给子类去使用


/**
 存钱
 */
- (void)__saveMoney;

/**
 取钱
 */
- (void)__drawMoney;

/**
 使用说明
 */
- (void)__UseApi;
@end

