//
//  RKLoginUtil.h
//  Refactoring
//
//  Created by dingqiankun on 2019/3/26.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kLoginManager [RKLoginUtil sharedInstance]

NS_ASSUME_NONNULL_BEGIN

@interface RKLoginUtil : NSObject

@property(nonatomic, assign)BOOL login;  // 验证登录

@property(nonatomic, readonly)NSString *userToken;  // 获取用户token

// 单例 此类只能使用此方法创建对象
+ (instancetype)sharedInstance;

// 登录
- (void)goLoginComplete:(void(^)(void))doSome animation:(BOOL)animation;

// 存储用户token
- (void)storageUserTokenWithDict:(NSDictionary *)dict;

// 清除用户token
- (void)clearToken;


@end




/***
 *   用户信息类
 */
@interface RKUserInfo : NSObject

@property(nonatomic, copy)NSString *phone;

@property(nonatomic, copy)NSString *code;

@property(nonatomic, copy)NSString *token;

@property(nonatomic, copy)NSString *uuid;

@property(nonatomic, copy)NSString *uId;

@end


NS_ASSUME_NONNULL_END




