//
//  RKMoreDisorderlyRequest.h
//  Refactoring
//
//  Created by dingqiankun on 2019/4/2.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKBaseRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface RKMoreDisorderlyDownRequest : RKBaseRequest

@property(nonatomic, assign)NSInteger siteId;

@property(nonatomic, assign)NSInteger pid;

@end

@interface RKMoreDisorderlyUpRequest : RKBaseRequest

@property(nonatomic, assign)NSInteger siteId;

@property(nonatomic, assign)NSInteger rid;

@end



NS_ASSUME_NONNULL_END
