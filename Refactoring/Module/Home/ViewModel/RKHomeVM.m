//
//  RKHomeVM.m
//  Refactoring
//
//  Created by dingqiankun on 2019/3/29.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKHomeVM.h"

@interface RKHomeVM ()

@property(nonatomic, strong)RKHomeRequest *homeRequest;


@end

@implementation RKHomeVM

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

// 初始化
- (void)setup
{
    // 创建命令
    self.command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return RKHomeRequest.requestSignal;
    }];
}


#pragma mark  ------ 懒加载


@end
