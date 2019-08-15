//
//  YZBarrier.m
//  iOS-LockDemo
//
//  Created by eagle on 2018/8/15.
//  Copyright © 2018 yongzhen. All rights reserved.
//

#import "YZBarrier.h"

@interface YZBarrier ()
@property (strong, nonatomic) dispatch_queue_t queue;
@end
@implementation YZBarrier

- (void)otherTest{
    
    // 初始化队列
    self.queue = dispatch_queue_create("rw_queue", DISPATCH_QUEUE_CONCURRENT);
    
    for (int i = 0; i < 3; i++) {
        // 读
        dispatch_async(self.queue, ^{
            [self read];
        });
        // 写
        dispatch_barrier_async(self.queue, ^{
            [self write];
        });
         // 读
        dispatch_async(self.queue, ^{
            [self read];
        });
         // 读
        dispatch_async(self.queue, ^{
            [self read];
        });
        
    }
}

- (void)read {
    sleep(1);
    NSLog(@"read");
}

- (void)write
{
    sleep(1);
    NSLog(@"write");
}
@end
