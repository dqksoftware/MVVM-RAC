//
//  RKLoginUtil.m
//  Refactoring
//
//  Created by dingqiankun on 2019/3/26.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKLoginUtil.h"
#import "RKBaseNavigationController.h"
#import "RKLoginController.h"
#import "RKUserDefaultsUtil.h"

@interface RKLoginUtil()

@property(nonatomic, strong)RKUserInfo *userInfo;  //用户信息

@end

@implementation RKLoginUtil

#define _kUserTokenInfo @"_UserTokenPrivateKey"

+ (instancetype)sharedInstance
{
    static RKLoginUtil *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[RKLoginUtil alloc]init];
    });
    return sharedInstance;
}

- (void)goLoginComplete:(void(^)(void))doSome animation:(BOOL)animation
{
    if (self.login) {
        
    }else{
        RKLoginController *loginVC = [RKLoginController new];
        __block RKBaseNavigationController *loginNav = [[RKBaseNavigationController alloc] initWithRootViewController:loginVC];
        
        [UIViewController.currentViewController presentViewController:loginNav animated:animation completion:nil];
        loginVC.successBlock = ^{
            if (doSome) {
                [UIViewController.currentViewController dismissViewControllerAnimated:YES completion:nil];
                doSome();
            }
        };
    }
}

- (void)storageUserTokenWithDict:(NSDictionary *)dict
{
    self.userInfo = [RKUserInfo mj_objectWithKeyValues:dict];
    [RKUserDefaultsUtil saveValue:dict forkey:_kUserTokenInfo];
    // 发送通知  用户登录
}

- (void)clearToken
{
    self.userInfo = nil;
    [RKUserDefaultsUtil saveValue:nil forkey:_kUserTokenInfo];
    // 发送通知用户退出登录
}

- (NSString *)userToken
{
    return self.userInfo.token;
}

- (BOOL)login
{
    // 双层判断，1.token是否存在  2.token是否有效
    if (self.userToken) {
        return YES;
    }
    return NO;
}


@end






@implementation RKUserInfo

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"uId": @"id"};
}

@end
