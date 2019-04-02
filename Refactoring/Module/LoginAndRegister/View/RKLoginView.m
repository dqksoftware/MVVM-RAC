//
//  RKLoginView.m
//  Refactoring
//
//  Created by dingqiankun on 2019/3/20.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKLoginView.h"


@interface RKLoginView ()

@property(nonatomic, strong)UIImageView *logoImgV;


@end

@implementation RKLoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

// 初始化视图
- (void)createView
{
    [self.logoImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(70, 70));
        make.top.equalTo(@120);
    }];
    
    [self.phoneV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.logoImgV.mas_bottom).offset(70);
        make.height.equalTo(@50);
        make.left.equalTo(@30);
        make.right.equalTo(self.mas_right).offset(-30);
    }];
    
    [self.codeV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.centerX.height.equalTo(self.phoneV);
        make.top.equalTo(self.phoneV.mas_bottom).offset(10);
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.codeV.mas_bottom).offset(30);
        make.width.equalTo(self.codeV);
        make.height.equalTo(@44);
    }];
    
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.loginBtn.mas_centerX);
        make.height.equalTo(@20);
        make.top.equalTo(self.loginBtn.mas_bottom).offset(30);
        make.width.equalTo(@100);
    }];
}


- (UIImageView *)logoImgV
{
    if (!_logoImgV) {
        _logoImgV = [[UIImageView alloc] initWithImage:kGetImage(@"login-logo-icon")];
        [self addSubview:_logoImgV];
    }
    return _logoImgV;
}

- (RKLoginPhoneView *)phoneV
{
    if (!_phoneV) {
        _phoneV = [[RKLoginPhoneView alloc] init];
        [self addSubview:_phoneV];
    }
    return _phoneV;
}

- (RKLoginValidateCodeView *)codeV
{
    if (!_codeV) {
        _codeV = [[RKLoginValidateCodeView alloc] init];
        [self addSubview:_codeV];
    }
    return _codeV;
}

- (UIButton *)loginBtn
{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _loginBtn.backgroundColor = kMainColor;
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [self addSubview:_loginBtn];
    }
    return _loginBtn;
}

- (UIButton *)registerBtn
{
    if (!_registerBtn) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerBtn setTitle:@"立即注册" forState:UIControlStateNormal];
        [_registerBtn setTitleColor:kMainColor forState:UIControlStateNormal];
        [self addSubview:_registerBtn];
    }
    return _registerBtn;
}


@end
