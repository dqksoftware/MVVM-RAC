//
//  RKLoginPhoneView.m
//  Refactoring
//
//  Created by dingqiankun on 2019/3/20.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKLoginPhoneView.h"

@implementation RKLoginPhoneView

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
    self.textF.keyboardType = UIKeyboardTypeNumberPad;
    self.textF.placeholder = @"请输入手机号";
}


@end
