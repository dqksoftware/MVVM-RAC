//
//  RKRegisterAgreementView.m
//  Refactoring
//
//  Created by dingqiankun on 2019/3/27.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKRegisterAgreementView.h"

@implementation RKRegisterAgreementView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    [self.selectBtn setImage:kGetImage(@"login-nomarl-iocn") forState:UIControlStateNormal];
    [self.selectBtn setImage:kGetImage(@"login-select-iocn") forState:UIControlStateSelected];
    self.titleLbl.text = @"我同意";
    self.titleLbl.font = kSysFont(15);
    [self.agreementBtn setTitle:@"《借贷协议》" forState:UIControlStateNormal];
    self.agreementBtn.titleLabel.font = kSysFont(15);
    [self.agreementBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
}

@end
