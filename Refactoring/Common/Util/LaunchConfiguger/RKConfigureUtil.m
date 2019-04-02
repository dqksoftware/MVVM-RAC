//
//  RKConfigureUtil.m
//  Refactoring
//
//  Created by dingqiankun on 2019/3/21.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKConfigureUtil.h"

@implementation RKConfigureUtil

static RKConfigureUtil *_configureUtil;
+(RKConfigureUtil *)sharedOneTimeClass
{
    static dispatch_once_t oneToken;
    
    dispatch_once(&oneToken, ^{
        
        _configureUtil = [[RKConfigureUtil alloc]init];
        
    });
    
    return _configureUtil;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self delegateLunchConfigure];
    }
    return self;
}

// delegate 启动一些配置信息
- (void)delegateLunchConfigure
{
    // 网络host配置
    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
    config.baseUrl = kHost;
}

@end
