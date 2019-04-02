//
//  UIView+Loading.m
//  Refactoring
//
//  Created by dingqiankun on 2019/3/29.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "UIView+Loading.h"
#import <objc/runtime.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <objc/runtime.h>

@interface UIView ()

@property(nonatomic, strong)MBProgressHUD *hud;

@end

@implementation UIView (Loading)

static const void *private_hudkey = &private_hudkey;

- (void)showLoading
{
    if (self.hud) {
        [self hideHUD];
        [self createHud];
    } else {
        [self createHud];
    }
    self.hud.customView = [self createCustomView];
}

- (void)showLoadigWith:(NSString *)message
{
    if (self.hud) {
        [self hideHUD];
        [self createHud];
    } else{
        [self createHud];
    }
    self.hud.label.text = message;
    self.hud.label.text = @"加载中...";
    self.hud.customView = [self createCustomView];
}

- (void)hideHUD
{
    if (self.hud) {
        [self.hud removeFromSuperViewOnHide];
        [self.hud hideAnimated:YES];
        objc_setAssociatedObject(self, private_hudkey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

// 创建自定义视图
- (UIView *)createCustomView
{
    UIImageView *imageV = [[UIImageView alloc] initWithImage:kGetImage(@"loading-hud")];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.toValue = @(M_PI * 2);
    animation.duration = 1.f;
    animation.repeatCount = MAXFLOAT;
    [imageV.layer addAnimation:animation forKey:@"rotationAnimation"];
    return imageV;
}

- (void)createHud
{
    self.hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    self.hud.bezelView.backgroundColor = [UIColor clearColor];
    self.hud.mode = MBProgressHUDModeCustomView;
    self.hud.label.font = kSysFont(10);
    self.hud.label.textColor = kMainColor;
}
- (MBProgressHUD *)hud
{
    return objc_getAssociatedObject(self, private_hudkey);
}

- (void)setHud:(MBProgressHUD *)hud
{
    if (!self.hud) {
        objc_setAssociatedObject(self, private_hudkey, hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

#pragma mark ---  懒加载


@end
