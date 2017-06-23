//
//  JQTableViewModel.m
//  JQMVVMDemo
//
//  Created by 韩俊强 on 2017/6/22.
//  Copyright © 2017年 HaRi. All rights reserved.
//

#import "JQTableViewModel.h"
#import "JQModel.h"

@implementation JQTableViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)headerRefreshRequestWithCallBack:(callBack)callBack
{
    //后台执行
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(2);
        dispatch_async(dispatch_get_main_queue(), ^{
           
            //主线程刷新视图
            NSMutableArray *arr = [NSMutableArray array];
            for (int i = 0; i < 20; i++) {
                int j = arc4random() % 100;
                JQModel *model = [[JQModel alloc]init];
                model.title = [NSString stringWithFormat:@"随机数:%d 小韩哥MVVMDemo",j];
                [arr addObject:model];
            }
            callBack(arr);
        });
    });
}

- (void)footerRefreshRequestWithCallBack:(callBack)callBack
{
    //后台执行
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(2);
        dispatch_async(dispatch_get_main_queue(), ^{
            
            //主线程刷新视图
            NSMutableArray *arr = [NSMutableArray array];
            for (int i = 0; i < 20; i++) {
                int j = arc4random() % 100;
                JQModel *model = [[JQModel alloc]init];
                model.title = [NSString stringWithFormat:@"随机数:%d 小韩哥MVVMDemo",j];
                [arr addObject:model];
            }
            callBack(arr);
        });
    });
}

@end
