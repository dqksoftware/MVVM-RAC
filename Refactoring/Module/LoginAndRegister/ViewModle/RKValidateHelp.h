//
//  RKValidateHelp.h
//  Refactoring
//
//  Created by dingqiankun on 2019/3/25.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RKValidateHelp : NSObject

// 验证手机号
+ (BOOL)validateMobile:(NSString *)phoneNum;

@end

NS_ASSUME_NONNULL_END
