//
//  RKHomeController.m
//  Refactoring
//
//  Created by dingqiankun on 2019/3/26.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKHomeController.h"
#import "RKTestController.h"

@interface RKHomeController ()

@property(nonatomic, strong)NSArray *dataSouce;

@end

@implementation RKHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!kLoginManager.login) {
        [kLoginManager goLoginComplete:^{
            // 登录完成后做的一些事情
        } animation:YES];
    }
    [self setup];
    [self createView];
}

#pragma mark --- NetWorkRequest
- (void)setup
{
    self.dataSouce = @[@"分页请求"];
}

// 创建视图
- (void)createView
{
    // 表视图
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.safeEqualToTop(self.view);
        make.left.right.equalTo(self.view);
        make.bottom.safeEqualToBottom(self.view);
    }];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

#pragma mark ------- UITableViewDelegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSouce.count;
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
    cell.textLabel.text = self.dataSouce[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:[RKTestController new] animated:YES];
}



@end
