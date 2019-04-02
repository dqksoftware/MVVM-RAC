//
//  RKHUD.m
//  Refactoring
//
//  Created by dingqiankun on 2019/3/29.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKHUD.h"
#import <MBProgressHUD/MBProgressHUD.h>

@implementation RKHUD

+ (MBProgressHUD *)hudWithView:(UIView *)view animated:(BOOL)animated
{
    MBProgressHUD *hud = nil;
    if (view == nil) {
        
        hud = [MBProgressHUD showHUDAddedTo:kWindow animated:YES];
    } else {
        hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    }
    hud.label.numberOfLines = 0;
    return hud;
}

+ (void)showText:(NSString *)message
{
    MBProgressHUD *hud = [RKHUD hudWithView:nil animated:YES];
    hud.userInteractionEnabled = YES;
    hud.label.text = message;
    hud.mode = MBProgressHUDModeText;
    NSInteger timestamp = [RKHUD timestampForMessage:message];
    [RKHUD hideAfterDelay:timestamp with:hud];
}

+ (void)showSuccess:(NSString *)message
{
    MBProgressHUD *hud = [RKHUD hudWithView:nil animated:YES];
    hud.minSize = CGSizeMake(100, 64);
    hud.label.text = message ? message : @"成功";
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:kGetImage(@"success-hud")];
    NSInteger timestamp = [RKHUD timestampForMessage:message];
    [RKHUD hideAfterDelay:timestamp with:hud];
}

+ (void)showError:(NSString *)message
{
    MBProgressHUD *hud = [RKHUD hudWithView:nil animated:YES];
    hud.minSize = CGSizeMake(100, 64);
    hud.label.text = message;
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:kGetImage(@"failed-hud")];
    hud.label.numberOfLines = 0;
    NSInteger timestamp = [RKHUD timestampForMessage:message];
    [RKHUD hideAfterDelay:timestamp with:hud];
}

+ (NSInteger)timestampForMessage:(NSString *)message
{
    NSInteger timestamp = 1.5;
    if (message.length > 10) {
        timestamp = timestamp + (message.length - 10) * 0.25;
    }
    return timestamp;
}

+ (void)hideAfterDelay:(NSInteger)timestamp with:(MBProgressHUD *)hud
{
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:timestamp];
}

@end
