//
//  RKTestVM.h
//  Refactoring
//
//  Created by dingqiankun on 2019/4/1.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RKTestRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface RKTestVM : NSObject

@property(nonatomic, strong)RACCommand *loadDataCmd;  // 刷新

@property(nonatomic, strong)RKTestRequest *testRequest; // 请求

@property(nonatomic, assign)BOOL needRefresh;

@end

NS_ASSUME_NONNULL_END
