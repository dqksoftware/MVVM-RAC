//
//  RKHomeModel.m
//  Refactoring
//
//  Created by dingqiankun on 2019/3/29.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKHomeModel.h"

@implementation ChannelList

@end

@implementation Data

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"channelList":@"ChannelList"};
}

@end

@implementation RKHomeModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"data":@"Data"};
}

@end
