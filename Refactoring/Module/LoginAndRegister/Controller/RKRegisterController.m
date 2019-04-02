//
//  RKRegisterController.m
//  Refactoring
//
//  Created by dingqiankun on 2019/3/25.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKRegisterController.h"
#import "RKRegisterView.h"
#import "RKRegisterVM.h"
#import "RKCommanWebController.h"

@interface RKRegisterController ()

@property(nonatomic, strong)RKRegisterView *registerView;

@property(nonatomic, strong)RKRegisterVM *registerVM;

@end

@implementation RKRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
    [self setup];
}

// 初始化
- (void)setup
{
    self.navigationItem.title = @"注册";
    RAC(self.registerView.validateCodeV.sendCodeBtn, enabled) = self.registerVM.codeEnableSignal;
    RAC(self.registerView.registerBtn, enabled) = self.registerVM.registerEnableSignal;
    RAC(self.registerVM, agreeSelect) = RACObserve(self.registerView.agreementV.selectBtn, selected);
    RAC(self.registerVM, phoneNum) = self.registerView.phoneV.textF.rac_textSignal;
    RAC(self.registerVM, codeNum) = self.registerView.validateCodeV.textF.rac_textSignal;
    @weakify(self)
    [[self.registerView.agreementV.agreementBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self)
        // 阅读规则
        NSLog(@"阅读规则");
        RKCommanWebController *webVC = [[RKCommanWebController alloc] init];
        [self.navigationController pushViewController:webVC animated:YES];
    }];
    
    [[self.registerView.registerBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self)
        // 立即注册
        [self.view showLoading];
        [self.registerVM.registerCmd execute:@"注册"];
    }];
    
    // 注册结果
    [self.registerVM.registerCmd.executionSignals.switchToLatest subscribeNext:^(RKBaseRequest *request) {
        /***
            // 真实请求成功
            [kLoginManager storageUserTokenWithDict:request.businessData];
         */
        @strongify(self)
        [self.view hideHUD];
        [RKHUD showSuccess:@"成功"];
        // 假装请求成功后的数据；  模拟
        NSDictionary *data = @{@"phone": @"888888", @"code": @"666666", @"token": @"llafdkfakafdffsff"};
        [kLoginManager storageUserTokenWithDict:data];
        [self.navigationController popViewControllerAnimated:YES];
    }];
}


// 初始化视图
- (void)createView
{
    [self.registerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.safeEqualToTop(self.view);
        make.bottom.safeEqualToBottom(self.view);
    }];
}

#pragma mark  ----- 懒加载
- (RKRegisterView *)registerView
{
    if (!_registerView) {
        _registerView = [[RKRegisterView alloc] init];
        [self.view addSubview:_registerView];
    }
    return _registerView;
}


- (RKRegisterVM *)registerVM
{
    if (!_registerVM) {
        _registerVM = [[RKRegisterVM alloc] init];
    }
    return _registerVM;
}


@end
