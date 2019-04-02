//
//  RKMoreDisorderlyRequestVM.m
//  Refactoring
//
//  Created by dingqiankun on 2019/4/2.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKMoreDisorderlyVM.h"

@interface RKMoreDisorderlyVM ()

@end


@implementation RKMoreDisorderlyVM

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
    [self.upCmd = [RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return self.upRequest.requestSignal;
    }];
    
    [self.downCmd = [RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return self.downRequest.requestSignal;
    }];
}

- (RKMoreDisorderlyDownRequest *)downRequest
{
    if (!_downRequest) {
        _downRequest = [RKMoreDisorderlyDownRequest request];
    }
    return _downRequest;
}

- (RKMoreDisorderlyUpRequest *)upRequest
{
    if (!_upRequest) {
        _upRequest = [RKMoreDisorderlyUpRequest request];
    }
    return _upRequest;
}


@end
