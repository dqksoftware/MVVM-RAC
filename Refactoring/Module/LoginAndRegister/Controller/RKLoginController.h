//
//  RKLoginController.h
//  Refactoring
//
//  Created by dingqiankun on 2019/3/20.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKBaseController.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^LoginSuccessBlock)(void);

@interface RKLoginController : RKBaseController

@property(nonatomic, copy)LoginSuccessBlock successBlock;

@end

NS_ASSUME_NONNULL_END
