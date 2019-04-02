//
//  RKRegisterPhoneView.m
//  Refactoring
//
//  Created by dingqiankun on 2019/3/25.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKRegisterPhoneView.h"

@implementation RKRegisterPhoneView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView
{
    self.textF.placeholder = @"请输入11位手机号";
    self.textF.keyboardType = UIKeyboardTypeNumberPad;
    [self.logoImgV mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@0);
    }];
}


@end
