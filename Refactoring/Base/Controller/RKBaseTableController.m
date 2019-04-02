//
//  RKBaseTableController.m
//  Refactoring
//
//  Created by dingqiankun on 2019/4/1.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKBaseTableController.h"

@interface RKBaseTableController ()<UITableViewDelegate, UITableViewDataSource>


@end

@implementation RKBaseTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialize];
}

// 初始化
- (void)initialize
{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}


#pragma mark   --------  UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}


#pragma mark ----- 懒加载
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.tableFooterView = [UIView new];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}


@end
