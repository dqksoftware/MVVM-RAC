//
//  RKUserDefaultsUtils.m
//  Refactoring
//
//  Created by dingqiankun on 2019/3/28.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKUserDefaultsUtil.h"
#import "NSData+CommonCrypto.h"

static const NSString *aes256key = @"com.rk.03080414.noencrypted";

@implementation RKUserDefaultsUtil

+ (void)saveValue:(id)value forkey:(NSString *)key
{
    // 先加密 后存储
    NSData *encryptedData = [self AES256EncryptedDataUsingValue:value];
    [kUserDefaults setObject:encryptedData forKey:key];
    [kUserDefaults synchronize];
}

+ (id)valueWithKey:(NSString *)key
{
    id value = [kUserDefaults valueForKey:key];
    // 解密
    if ([value isKindOfClass:[NSData class]]) {
        return [self decryptedAES256DataUsingValue:value];
    }
    return value;
}

+ (void)saveBoolValue:(BOOL)value withKey:(NSString *)key
{
    [kUserDefaults setBool:value forKey:key];
    [kUserDefaults synchronize];
}

+ (BOOL)boolValueWithKey:(NSString *)key
{
    return [kUserDefaults boolForKey:key];
}

+ (NSData *)AES256EncryptedDataUsingValue:(id)value
{
    NSData *data = nil;
    if ([value isKindOfClass:[NSData class]]) {
        data = [NSData dataWithData:data];
    } else {
        NSError *error;
        @try {
            data = [NSKeyedArchiver archivedDataWithRootObject:value requiringSecureCoding:YES error:&error];
        } @catch (NSException *exception) {
            return value;
        } @finally {
            
        }
    }
    NSError *error = nil;
    data = [data AES256EncryptedDataUsingKey:aes256key error:&error];
    if (error == nil) {
        return data;
    }
    return nil;
}

+ (NSData *)decryptedAES256DataUsingValue:(id)value
{
    NSData *data = [NSData dataWithData:value];
    NSError *error = nil;
    data = [data decryptedAES256DataUsingKey:aes256key error:&error];
    return data;
}

@end
