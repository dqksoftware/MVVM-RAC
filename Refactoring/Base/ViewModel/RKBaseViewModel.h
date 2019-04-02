//
//  RKBaseViewModel.h
//  Refactoring
//
//  Created by dingqiankun on 2019/3/29.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RKBaseViewModel : NSObject

@property(nonatomic, strong)RACCommand *command;  // 子类必须创建此对象

@property(nonatomic, strong)RACSignal *requestSignal;

@end

NS_ASSUME_NONNULL_END
