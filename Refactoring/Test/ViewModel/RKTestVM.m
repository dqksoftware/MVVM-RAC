//
//  RKTestVM.m
//  Refactoring
//
//  Created by dingqiankun on 2019/4/1.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKTestVM.h"

@implementation RKTestVM

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    @weakify(self)
    // 刷新
    self.loadDataCmd = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        @strongify(self)
//        self.testRequest.needRefresh = input ? [input boolValue] : NO;
        self.testRequest.needRefresh = self.needRefresh;
        return self.testRequest.requestSignal;
    }];
}

#pragma mark  ------  懒加载
- (RKTestRequest *)testRequest
{
    if (!_testRequest) {
        _testRequest = [RKTestRequest request];
    }
    return _testRequest;
}



@end
