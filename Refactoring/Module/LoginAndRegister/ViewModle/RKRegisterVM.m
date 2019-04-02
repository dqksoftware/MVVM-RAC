//
//  RKRegisterVM.m
//  Refactoring
//
//  Created by dingqiankun on 2019/3/27.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKRegisterVM.h"
#import "RKRegisterRequest.h"

@interface RKRegisterVM ()

@property(nonatomic, strong)RKRegisterRequest *registerRequest;

@end

@implementation RKRegisterVM

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
    
    @weakify(self)
    self.codeEnableSignal = [RACSignal combineLatest:@[RACObserve(self, phoneNum)] reduce:^id _Nonnull(NSString *phoneNum){
        return @(phoneNum.validateMobile);
    }];
    
    self.registerEnableSignal = [RACSignal combineLatest:@[RACObserve(self, phoneNum), RACObserve(self, codeNum), RACObserve(self, agreeSelect)] reduce:^id _Nonnull(NSString *phoneNum, NSString *codeNum, NSNumber *agreeSelect){
        @strongify(self)
        self.registerRequest.phone = phoneNum;
        self.registerRequest.code = codeNum;
        return @(phoneNum.validateMobile && codeNum.length && agreeSelect.boolValue);
    }];
    
    self.registerCmd = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return self.registerRequest.requestSignal;
    }];
}


#pragma mark  ------ 懒加载

- (RKRegisterRequest *)registerRequest
{
    if (!_registerRequest) {
        _registerRequest = [RKRegisterRequest request];
    }
    return _registerRequest;
}


@end
