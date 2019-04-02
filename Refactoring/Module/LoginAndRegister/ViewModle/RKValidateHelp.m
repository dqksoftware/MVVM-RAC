//
//  RKValidateHelp.m
//  Refactoring
//
//  Created by dingqiankun on 2019/3/25.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKValidateHelp.h"

@implementation RKValidateHelp

+ (BOOL)validateMobile:(NSString *)phoneNum
{
    if (phoneNum.length) {
        if (!phoneNum.validateMobile) {
            [RKHUD showText:@"手机号格式不正确"];
        }
        return phoneNum.validateMobile;
    }else{
        // 弹窗显示
        [RKHUD showText:@"手机号不能为空"];
        return NO;
    }
}

@end
