//
//  RKRegisterRequest.h
//  Refactoring
//
//  Created by dingqiankun on 2019/4/1.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKBaseRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface RKRegisterRequest : RKBaseRequest

@property(nonatomic, copy)NSString *phone;

@property(nonatomic, copy)NSString *code;

@end

NS_ASSUME_NONNULL_END
