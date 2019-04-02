//
//  RKRegisterView.m
//  Refactoring
//
//  Created by dingqiankun on 2019/3/25.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKRegisterView.h"



@implementation RKRegisterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView
{
    CGFloat margin = 15.f;
    [self.phoneV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.left.equalTo(@(margin));
        make.right.equalTo(self.mas_right).offset(-margin);
        make.height.equalTo(@50);
        make.top.equalTo(@0);
    }];
    
    [self.validateCodeV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.left.right.equalTo(self.phoneV);
        make.top.equalTo(self.phoneV.mas_bottom);
    }];
    
    [self.agreementV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.phoneV);
        make.right.equalTo(self.phoneV);
        make.height.equalTo(@50);
        make.top.equalTo(self.validateCodeV.mas_bottom).offset(20);
    }];
    
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.agreementV.mas_bottom).offset(20);
        make.left.right.equalTo(self.phoneV);
        make.height.equalTo(@50);
    }];
}


#pragma mark  ------- 懒加载

- (RKRegisterPhoneView *)phoneV
{
    if (!_phoneV) {
        _phoneV = [[RKRegisterPhoneView alloc] init];
        [self addSubview:_phoneV];
    }
    return _phoneV;
}

- (RKRegisterValidateCodeView *)validateCodeV
{
    if (!_validateCodeV) {
        _validateCodeV = [[RKRegisterValidateCodeView alloc] init];
        [self addSubview:_validateCodeV];
    }
    return _validateCodeV;
}

- (RKRegisterAgreementView *)agreementV
{
    if (!_agreementV) {
        _agreementV = [[RKRegisterAgreementView alloc] init];
        [self addSubview:_agreementV];
    }
    return _agreementV;
}

- (UIButton *)registerBtn
{
    if (!_registerBtn) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerBtn setTitle:@"立即注册" forState:UIControlStateNormal];
        _registerBtn.backgroundColor = kMainColor;
        [_registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self addSubview:_registerBtn];
    }
    return _registerBtn;
}


@end
