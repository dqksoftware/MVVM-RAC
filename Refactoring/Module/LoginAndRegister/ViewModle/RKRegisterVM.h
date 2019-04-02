//
//  RKRegisterVM.h
//  Refactoring
//
//  Created by dingqiankun on 2019/3/27.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RKLoginRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface RKRegisterVM : NSObject

@property(nonatomic, copy)NSString *phoneNum;

@property(nonatomic, copy)NSString *codeNum;

@property(nonatomic, assign)BOOL agreeSelect;

@property(nonatomic, strong)RACSignal *codeEnableSignal;

@property(nonatomic, strong)RACSignal *registerEnableSignal;

@property(nonatomic, strong)RACCommand *registerCmd;

@end

NS_ASSUME_NONNULL_END
