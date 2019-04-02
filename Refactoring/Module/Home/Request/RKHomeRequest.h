//
//  RKHomeRequest.h
//  Refactoring
//
//  Created by dingqiankun on 2019/3/29.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKBaseRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface RKHomeRequest : RKBaseRequest

@property(nonatomic, copy)NSString *pid;  // id

@property(nonatomic, copy)NSString *keyWord;  // 关键字

@end

NS_ASSUME_NONNULL_END
