//
//  RKUserDefaultsUtils.h
//  Refactoring
//
//  Created by dingqiankun on 2019/3/28.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface RKUserDefaultsUtil : NSObject

+ (void)saveValue:(id)value forkey:(NSString *)key;

+ (id)valueWithKey:(NSString *)key;

+ (void)saveBoolValue:(BOOL)value withKey:(NSString *)key;

+ (BOOL)boolValueWithKey:(NSString *)key;


@end

NS_ASSUME_NONNULL_END
