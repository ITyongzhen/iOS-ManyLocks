//
//  YZDispatchGroup.m
//  iOS-LockDemo
//
//  Created by eagle on 2018/8/15.
//  Copyright © 2018 yongzhen. All rights reserved.
//

#import "YZDispatchGroup.h"

@implementation YZDispatchGroup
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)otherTest{
    
    //1.创建调度组
    dispatch_group_t group = dispatch_group_create();
    //2.队列
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    //3.调度组监听队列 标记开始本次执行
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
       [self downLoadImage1];
        //标记本次请求完成
          dispatch_group_leave(group);
    });
    

    //3.调度组监听队列 标记开始本次执行
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        [self downLoadImage2];
        //标记本次请求完成
        dispatch_group_leave(group);
    });
    
    //4,调度组都完成了
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        //执行完test1和test2之后，在进行请求test3
         [self reloadUI];
    });

}
- (void)downLoadImage1 {
    sleep(1);
    NSLog(@"%s--%@",__func__,[NSThread currentThread]);
}
- (void)downLoadImage2 {
     sleep(2);
    NSLog(@"%s--%@",__func__,[NSThread currentThread]);
}
- (void)reloadUI
{
    NSLog(@"%s--%@",__func__,[NSThread currentThread]);
}
@end
