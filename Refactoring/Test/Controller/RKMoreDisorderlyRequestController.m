//
//  RKMoreDisorderlyRequestController.m
//  Refactoring
//
//  Created by dingqiankun on 2019/4/2.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKMoreDisorderlyRequestController.h"
#import "RKMoreDisorderlyVM.h"
#import "RKDisorderlyView.h"
#import "RKMoreDisorderlyRequest.h"

@interface RKMoreDisorderlyRequestController ()

@property(nonatomic, strong)RKMoreDisorderlyVM *disordlyVM;

@property(nonatomic, strong)RKDisorderlyView *disorderlyView;

@property(nonatomic, strong)NSArray *downDataSource;

@end

@implementation RKMoreDisorderlyRequestController

static NSString *cellID = @"cellIdentier";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
    [self setup];
}

// 初始化
- (void)setup
{
    // 获取参数  模拟
    self.disordlyVM.upRequest.rid = 30;
    self.disordlyVM.upRequest.siteId = 1;
    self.disordlyVM.downRequest.pid = 1;
    self.disordlyVM.downRequest.siteId = 1;
    [self.disorderlyView showLoading];
    @weakify(self)
    [[self.disordlyVM.upCmd.executionSignals.switchToLatest delay:1.5] subscribeNext:^(RKMoreDisorderlyUpRequest *request) {
        @strongify(self)
        //  此段代码只是演示 真正开发 应该生成对应模型。  如果不想配置模型的话，可以使用以下方式。 更多request功能请参照RKBaseRequest.
        NSArray *arrayData = request.businessData;
        NSDictionary *dictData = arrayData.firstObject;
        NSArray *arrGoods = dictData[@"goods"];
        NSDictionary *dict = arrGoods.firstObject;
        [self.disorderlyView hideHUD];
        [self.disorderlyView.imageV sd_setImageWithURL:[NSURL URLWithString:dict[@"pic_url"]]];
    }];
    [self.tableView showLoading];
    [[self.disordlyVM.downCmd.executionSignals.switchToLatest delay:1] subscribeNext:^(RKMoreDisorderlyDownRequest *request) {
        @strongify(self)
        self.downDataSource = request.businessData;
        [self.tableView hideHUD];
        [self.tableView reloadData];
    }];
    
    // 发送请求
    [self.disordlyVM.upCmd execute:@""];
    [self.disordlyVM.downCmd execute:@""];
}

// 创建视图
- (void)createView
{
    [self.disorderlyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.safeEqualToTop(self.view);
        make.height.equalTo(@160);
    }];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellIdentier"];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.safeEqualToBottom(self.view);
        make.top.equalTo(self.disorderlyView.mas_bottom);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.downDataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    NSDictionary *dict = self.downDataSource[indexPath.row];
    cell.textLabel.text = dict[@"name"];
    return cell;
}


- (RKDisorderlyView *)disorderlyView
{
    if (!_disorderlyView) {
        _disorderlyView = [[RKDisorderlyView alloc] init];
        [self.view addSubview:_disorderlyView];
    }
    return _disorderlyView;
}

- (RKMoreDisorderlyVM *)disordlyVM
{
    if (!_disordlyVM) {
        _disordlyVM = [[RKMoreDisorderlyVM alloc] init];
    }
    return _disordlyVM;
}


@end
