//
//  RKLoginRequest.h
//  Refactoring
//
//  Created by dingqiankun on 2019/3/22.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKBaseRequest.h"

NS_ASSUME_NONNULL_BEGIN


/**
    appKey=E10ADC3949BA59ABBE56E057F20F883E  /
 */


@interface RKLoginRequest : RKBaseRequest

@property(nonatomic, copy)NSString *phone;  // 手机号码

@property(nonatomic, copy)NSString *code;  // 验证码

@end

@interface RKValidateCodeRequest : RKBaseRequest

@property(nonatomic, copy)NSString *salty_MD5;  //盐

@property(nonatomic, copy)NSString *phoneNum;  

@end



NS_ASSUME_NONNULL_END
