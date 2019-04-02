//
//  RKLoginController.m
//  Refactoring
//
//  Created by dingqiankun on 2019/3/20.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKLoginController.h"
#import "RKLoginView.h"
#import "RKLoginVM.h"
#import "RKRegisterController.h"

@interface RKLoginController ()

@property(nonatomic, strong)RKLoginView *loginView;

@property(nonatomic, strong)RKLoginVM *loginVM;

@property(nonatomic, strong)NSDictionary *loginData;

@end


@implementation RKLoginController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createView];
    [self setup];
}

// 初始化视图
- (void)createView
{
    [self.loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view);
    }];
}

// 初始化
- (void)setup
{
    // 绑定信号
    RAC(self.loginVM, phoneNum) = self.loginView.phoneV.textF.rac_textSignal;
    RAC(self.loginVM, validateCode) = self.loginView.codeV.textF.rac_textSignal;
    RAC(self.loginView.loginBtn, enabled) = self.loginVM.loginBtnEnableSignal;
    RAC(self.loginView.codeV.sendCodeBtn, enabled) = self.loginVM.validateCodeBtnEnableSignal;
    RAC(self, loginData) = RACObserve(self.loginVM, loginData);


    @weakify(self)
    [[self.loginView.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self)
        [self.loginVM.command execute:@"点击登录"];
        
    }];
    // 登录
    [self.loginVM.command.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        if (self.successBlock) {
            self.successBlock();
        }
    }];
    
    // 点击注册
    [[self.loginView.registerBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self)
        RKRegisterController *registerVC = [[RKRegisterController alloc] init];
        [self.navigationController pushViewController:registerVC animated:YES];
    }];
    
    [RACObserve(self.loginView.loginBtn, enabled) subscribeNext:^(id  _Nullable x) {
        [self.loginView.loginBtn setBackgroundColor: [x boolValue] ? kMainColor : [UIColor grayColor]];
    }];
}


#pragma mark  ------  懒加载

- (RKLoginView *)loginView
{
    if (!_loginView) {
        _loginView = [[RKLoginView alloc] init];
        [self.view addSubview:_loginView];
    }
    return _loginView;
}

- (RKLoginVM *)loginVM
{
    if (!_loginVM) {
        _loginVM = [[RKLoginVM alloc] init];
    }
    return _loginVM;
}


@end
