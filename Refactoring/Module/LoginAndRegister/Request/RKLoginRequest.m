//
//  RKLoginRequest.m
//  Refactoring
//
//  Created by dingqiankun on 2019/3/22.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKLoginRequest.h"

@implementation RKLoginRequest

- (NSString *)requestUrl
{
    return cLoginApi;
}

- (id)requestArgument
{
    [super requestArgument];
    return @{@"phone": self.phone, @"code": self.code};
}

@end


@implementation RKValidateCodeRequest : RKBaseRequest

- (NSString *)requestUrl
{
    return kFormat(@"%@%@/%@/%@?",kHost, cValidateCodeApi, self.salty_MD5, self.phoneNum);
}

- (NSString *)salty_MD5
{
 
    NSString *appendStr = [NSString stringWithFormat:@"%@%@", [self.phoneNum substringWithRange:NSMakeRange(self.phoneNum.length - 4, 4)],@"tt^hz"];
    
    return [RKEncryptionUtil md5String:appendStr];
}

@end
