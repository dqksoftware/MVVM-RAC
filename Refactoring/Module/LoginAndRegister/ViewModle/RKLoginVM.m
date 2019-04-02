//
//  RKLoginVM.m
//  Refactoring
//
//  Created by dingqiankun on 2019/3/21.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKLoginVM.h"
#import "RKValidateHelp.h"

@implementation RKLoginVM

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

// 初始化
- (void)setup
{
    @weakify(self)
    // 登录按钮是否可用
    self.loginBtnEnableSignal = [RACSignal combineLatest:@[RACObserve(self, phoneNum), RACObserve(self, validateCode)] reduce:^id _Nonnull(NSString *phoneNum, NSString *validateCode){
        @strongify(self)
        self.loginRequest.phone = phoneNum;
        self.loginRequest.code = validateCode;
        return @(phoneNum.length && validateCode.length && [phoneNum length]);
    }];
    
    // 验证码按钮是否可用
    self.validateCodeBtnEnableSignal = [RACSignal combineLatest:@[RACObserve(self, phoneNum)] reduce:^id _Nonnull(NSString *phoneNum){
        
        return @(phoneNum.validateMobile);
    }];
    
    self.codeCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [self.validateCodeRequest.requestSignal filter:^BOOL(id  _Nullable value) {
            return [RKValidateHelp validateMobile:self.phoneNum];
        }];
    }];
    
    // 登录
    self.command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input)  {
        @strongify(self)
        return [self.loginRequest.requestSignal filter:^BOOL(id  _Nullable value) {
            return [RKValidateHelp validateMobile:self.phoneNum];
        }];
    }];
}




#pragma mark  ------  懒加载
- (RKLoginRequest *)loginRequest
{
    if (!_loginRequest) {
        _loginRequest = [RKLoginRequest new];
    }
    return _loginRequest;
}

- (RKValidateCodeRequest *)validateCodeRequest
{
    if (!_validateCodeRequest) {
        _validateCodeRequest = [RKValidateCodeRequest new];
    }
    return _validateCodeRequest;
}



@end
