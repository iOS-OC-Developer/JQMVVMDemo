//
//  JQTableViewDelegate.m
//  JQMVVMDemo
//
//  Created by 韩俊强 on 2017/6/22.
//  Copyright © 2017年 HaRi. All rights reserved.
//

#import "JQTableViewDelegate.h"
#import "JQModel.h"

@implementation JQTableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if (_array.count>0) {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:((JQModel *)[_array objectAtIndex:indexPath.row]).title preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertVC addAction:cancleAction];
    }
}

@end
