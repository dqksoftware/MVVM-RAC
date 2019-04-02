//
//  RKLoginValidateCodeView.m
//  Refactoring
//
//  Created by dingqiankun on 2019/3/20.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKLoginValidateCodeView.h"

@implementation RKLoginValidateCodeView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createView];
    }
    return self;
}

// 初始化
- (void)createView
{
    self.textF.placeholder = @"请输入短信验证码";
    self.lineV.backgroundColor = kMainColor;
}

@end
