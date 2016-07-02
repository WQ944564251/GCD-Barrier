//
//  ViewController.m
//  GCD-Barrier
//
//  Created by tarena50 on 16/7/1.
//  Copyright © 2016年 tarena50. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加墙必须是自建队列
    
    dispatch_queue_t queue = dispatch_queue_create(NULL, DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"预定黄焖鸡,%@",[NSThread currentThread]);
        sleep(5);
        NSLog(@"拿到黄焖鸡");
    });
    dispatch_async(queue, ^{
        NSLog(@"预定手抓饼,%@",[NSThread currentThread]);
        sleep(10);
        NSLog(@"拿到手抓饼");
    });
    dispatch_async(queue, ^{
        NSLog(@"预定铁板烧,%@",[NSThread currentThread]);
        sleep(15);
        NSLog(@"拿到铁板烧");
    });
    //添加墙
    dispatch_barrier_async(queue, ^{
        NSLog(@"带齐所有东西走人%@",[NSThread currentThread]);
    });
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
