//
//  RKHomeVM.h
//  Refactoring
//
//  Created by dingqiankun on 2019/3/29.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RKHomeRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface RKHomeVM : NSObject

@property(nonatomic, strong)RACCommand *command;  // 命令

@end

NS_ASSUME_NONNULL_END
