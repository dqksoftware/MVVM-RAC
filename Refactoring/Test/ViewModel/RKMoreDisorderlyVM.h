//
//  RKMoreDisorderlyRequestVM.h
//  Refactoring
//
//  Created by dingqiankun on 2019/4/2.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RKMoreDisorderlyRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface RKMoreDisorderlyVM : NSObject

@property(nonatomic, strong)RACCommand *upCmd;

@property(nonatomic, strong)RACCommand *downCmd;

@property(nonatomic, strong)RKMoreDisorderlyDownRequest *downRequest;

@property(nonatomic, strong)RKMoreDisorderlyUpRequest *upRequest;

@end

NS_ASSUME_NONNULL_END
