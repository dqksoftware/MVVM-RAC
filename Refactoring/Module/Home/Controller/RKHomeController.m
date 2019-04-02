//
//  RKHomeController.m
//  Refactoring
//
//  Created by dingqiankun on 2019/3/26.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKHomeController.h"
#import "RKHomeVM.h"
#import "RKHomeModel.h"
#import "RKHUD.h"
#import "RKHomeView.h"
#import "RKTestController.h"

@interface RKHomeController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong)RKHomeVM *homeVM;  // VM

@property(nonatomic, strong)RKHomeModel *homeModel; // 模型

@property(nonatomic, strong)UITableView *tableView; //表视图

@property(nonatomic, strong)RKHomeView *homeView;  //

@end

@implementation RKHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /****
     
        请看： RKTestController
     
        RKTestController 在Test文件夹下，作为示例，RKHomeControllr  后期会更具更j接近公司的项目去做

     **/
    
}

#pragma mark --- NetWorkRequest
- (void)sendRequest
{
    [self.homeView.blueView showLoading];
    [self.homeView.greenView showLoading];
    @weakify(self)
    [self.homeVM.command.executionSignals.switchToLatest subscribeNext:^(RKBaseRequest *request) {
        @strongify(self)
        self.homeModel = request.businessModel;
        [self.homeView.blueView hideHUD];
        [self.tableView reloadData];
    }];
    [self.homeVM.command execute:@""];
}

// 创建视图
- (void)createView
{
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(handAction)];
    self.navigationItem.rightBarButtonItem = rightBar;
    
    [self.homeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@100);
        make.size.mas_equalTo(CGSizeMake(200, 200));
        make.top.equalTo(@100);
    }];
    
    // 表视图
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.safeEqualToTop(self.view);
        make.left.right.equalTo(self.view);
        make.bottom.safeEqualToBottom(self.view);
    }];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.tableFooterView = [UIView new];
}

#pragma mark ------- UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.homeModel.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    Data *data = self.homeModel.data[section];
    return data.channelList.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    Data *data = self.homeModel.data[section];
    return data.name;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 33.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Data *data = self.homeModel.data[indexPath.section];
    
    ChannelList *channelList = data.channelList[indexPath.row];
    
    cell.textLabel.text = channelList.name;
    return cell;
}

- (void)handAction
{
    [self.navigationController pushViewController:[RKTestController new] animated:YES];
    
//    [self.homeVM.command execute:nil];
}

#pragma mark   -------  懒加载

- (RKHomeVM *)homeVM
{
    if (!_homeVM) {
        _homeVM = [[RKHomeVM alloc] init];
    }
    return _homeVM;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (RKHomeView *)homeView
{
    if (!_homeView) {
        _homeView = [[RKHomeView alloc] init];
        [self.view addSubview:_homeView];
    }
    return _homeView;
}


@end
