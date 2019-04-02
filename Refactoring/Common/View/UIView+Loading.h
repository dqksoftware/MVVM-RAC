//
//  UIView+Loading.h
//  Refactoring
//
//  Created by dingqiankun on 2019/3/29.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Loading)

- (void)showLoading;

- (void)showLoadigWith:(NSString *)message;

- (void)hideHUD;

@end

NS_ASSUME_NONNULL_END
