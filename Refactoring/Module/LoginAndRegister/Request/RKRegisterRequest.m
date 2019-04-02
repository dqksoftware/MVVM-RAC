//
//  RKRegisterRequest.m
//  Refactoring
//
//  Created by dingqiankun on 2019/4/1.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKRegisterRequest.h"

@implementation RKRegisterRequest

- (NSString *)requestUrl
{
    return @"/api.xxx/xxx";
}

- (id)requestArgument
{
    return @{@"phone": self.phone?:@"", @"code": self.code?:@""};
}

- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}

@end
