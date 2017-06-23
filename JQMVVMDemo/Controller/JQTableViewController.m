//
//  JQTableViewController.m
//  JQMVVMDemo
//
//  Created by 韩俊强 on 2017/6/22.
//  Copyright © 2017年 HaRi. All rights reserved.
//

#import "JQTableViewController.h"
#import "YiRefreshHeader.h"
#import "YiRefreshFooter.h"
#import "JQModel.h"
#import "JQTableViewModel.h"
#import "JQTableViewDataSource.h"
#import "JQTableViewDelegate.h"

#define iOS7 [[[UIDevice currentDevice]systemVersion] floatValue] >= 7.0
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface JQTableViewController ()
{
    YiRefreshHeader *refreshHeader;
    YiRefreshFooter *refreshFooter;
    NSMutableArray *totalSource;
    JQTableViewModel *tableViewModel;
    UITableView *tableView;
    JQTableViewDataSource *tableViewDataSource;
    JQTableViewDelegate *tableViewDelegate;
}

@end

@implementation JQTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (iOS7) {
        self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    }
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"MVVM - JQTableViewController";
    
    [self setupTableView];
    [self initRefreshHeaderAndFooter];
}

// init tableView
- (void)setupTableView
{
    tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64) style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableViewDelegate = [[JQTableViewDelegate alloc]init];
    tableViewDataSource = [[JQTableViewDataSource alloc]init];
    tableView.delegate = tableViewDelegate;
    tableView.dataSource = tableViewDataSource;
    tableViewModel = [[JQTableViewModel alloc]init];
    totalSource = 0;
}

// init refresh
- (void)initRefreshHeaderAndFooter
{
    // 头部刷新
    refreshHeader = [[YiRefreshHeader alloc]init];
    refreshHeader.scrollView = tableView;
    [refreshHeader header];
    __weak typeof(self) weakSelf = self;
    refreshHeader.beginRefreshingBlock = ^(){
        [weakSelf headerRefreshAction];
    };
    [refreshHeader beginRefreshing];
    
    // 底部上拉
    refreshFooter = [[YiRefreshFooter alloc]init];
    refreshFooter.scrollView = tableView;
    [refreshFooter footer];
    refreshFooter.beginRefreshingBlock = ^(){
        [weakSelf footerRefreshAction];
    };
}

- (void)headerRefreshAction
{
    [tableViewModel headerRefreshRequestWithCallBack:^(NSArray *array) {
        totalSource = (NSMutableArray *)array;
        tableViewDataSource.array = totalSource;
        tableViewDelegate.array = totalSource;
        [refreshHeader endRefreshing];
        [tableView reloadData];
    }];
}

- (void)footerRefreshAction
{
    [tableViewModel footerRefreshRequestWithCallBack:^(NSArray *array) {
        totalSource = (NSMutableArray *)array;
        tableViewDataSource.array = totalSource;
        tableViewDelegate.array = totalSource;
        [refreshFooter endRefreshing];
        [tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
