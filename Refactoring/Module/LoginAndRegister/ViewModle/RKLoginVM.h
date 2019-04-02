//
//  RKLoginVM.h
//  Refactoring
//
//  Created by dingqiankun on 2019/3/21.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RKLoginRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface RKLoginVM : NSObject

@property(nonatomic, copy)NSString *validateCode;  // 验证码

@property(nonatomic, copy)NSString *phoneNum; // 手机号

@property(nonatomic, strong)RACCommand *command;  // 登录命令

@property(nonatomic, strong)RACCommand *codeCommand;  // 验证码

@property(nonatomic, strong)RACSignal *loginBtnEnableSignal;  // 登录是否可用

@property(nonatomic, strong)RACSignal *validateCodeBtnEnableSignal;  // 验证码是否可用

@property(nonatomic, strong)RKLoginRequest *loginRequest; // 登录请求

@property(nonatomic, strong)RKValidateCodeRequest *validateCodeRequest;  // 获取验证码

@property(nonatomic, strong)NSDictionary *loginData;  // 响应数据

@end

NS_ASSUME_NONNULL_END
