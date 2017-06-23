//
//  JQTableViewModel.h
//  JQMVVMDemo
//
//  Created by 韩俊强 on 2017/6/22.
//  Copyright © 2017年 HaRi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^callBack) (NSArray *array);

@interface JQTableViewModel : NSObject

// 刷新头部 - 网络请求
- (void)headerRefreshRequestWithCallBack:(callBack)callBack;

// 刷新底部 - 网络请求
- (void)footerRefreshRequestWithCallBack:(callBack)callBack;

@end
