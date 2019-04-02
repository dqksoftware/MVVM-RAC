//
//  RKHomeRequest.m
//  Refactoring
//
//  Created by dingqiankun on 2019/3/29.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKHomeRequest.h"
#import "RKHomeModel.h"

@implementation RKHomeRequest


- (Class)modelClass
{
    return RKHomeModel.class;
}

- (NSString *)requestUrl
{
    return @"https://daifaadmin.wsy.com/api-buyer/app-home-api/channel-list";
}

@end
