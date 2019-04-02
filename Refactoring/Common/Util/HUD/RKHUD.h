//
//  RKHUD.h
//  Refactoring
//
//  Created by dingqiankun on 2019/3/29.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RKHUD : NSObject

// 村文本
+ (void)showText:(NSString *)message;

// 图文+提示文字
+ (void)showSuccess:(NSString *)message;

// 图文+提示文字
+ (void)showError:(NSString *)message;


@end

NS_ASSUME_NONNULL_END
