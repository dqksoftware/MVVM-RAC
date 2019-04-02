//
//  RKTestController.m
//  Refactoring
//
//  Created by dingqiankun on 2019/4/1.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKTestController.h"
#import "RKTestVM.h"
#import "RKTestCell.h"
#import "RKDataModel.h"

@interface RKTestController ()

@property(nonatomic, strong)RKTestVM *testVM;

@property(nonatomic, strong)NSArray *dataSource;

@end

@implementation RKTestController

static NSString *cellIdentifer = @"cellId";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!kLoginManager.login) {
        [kLoginManager goLoginComplete:^{
            // 登录完成后做的一些事情
        } animation:YES];
    }
    
    [self setup];
    [self requestBlock];
    [self createView];
}

// 视图
- (void)createView
{
    [self.tableView registerClass:[RKTestCell class] forCellReuseIdentifier:cellIdentifer];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.safeEqualToTop(self.view);
        make.bottom.equalTo(self.view);
    }];
}

// 初始化
- (void)setup
{
    @weakify(self)
    [self.tableView addHeaderWithCallback:^{
        @strongify(self)
        self.testVM.needRefresh = YES;
        [self.testVM.loadDataCmd execute:@"刷新"];
    }];
    
    [self.tableView addFooterWithCallback:^{
        @strongify(self)
        self.testVM.needRefresh = NO;
        [self.testVM.loadDataCmd execute:@"加载更多"];
    }];
}

// 请求
- (void)requestBlock
{
    [self.view showLoading];
    @weakify(self)
    [self.testVM.loadDataCmd.executionSignals.switchToLatest subscribeNext:^(RKBasePageRequest *request) {
        @strongify(self)
        [self.tableView endRefreshingHasMoreData:request.isHasMoreData tip:nil];
        [self.tableView headerEndRefreshing];
        [self.view hideHUD];
        self.dataSource = request.businessModelArray;
        [self.tableView reloadData];
    }];
    [self.testVM.loadDataCmd execute:@"刷新"];
}

#pragma mark   ---- tableviewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RKTestCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer forIndexPath:indexPath];
    RKDataModel *dataModel = self.dataSource[indexPath.row];
    [cell setViewWithModel:dataModel];
    return cell;
}

#pragma mark  ------  懒加载

- (RKTestVM *)testVM
{
    if (!_testVM) {
        _testVM = [[RKTestVM alloc] init];
    }
    return _testVM;
}




@end
