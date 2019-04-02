//
//  RKRegisterValidateCodeView.m
//  Refactoring
//
//  Created by dingqiankun on 2019/3/25.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKRegisterValidateCodeView.h"

@implementation RKRegisterValidateCodeView

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
    self.textF.placeholder = @"请输入验证码";
    self.lineV.backgroundColor = kMainColor;
    [self.logoImgV mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@0);
    }];
}


@end
