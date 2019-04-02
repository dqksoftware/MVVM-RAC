//
//  RKValidateCodeView.m
//  Refactoring
//
//  Created by dingqiankun on 2019/3/20.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKValidateCodeView.h"
#import "RKLoginRequest.h"


@interface RKValidateCodeView ()

@property(nonatomic, assign)NSInteger totalSeconds;

@property(nonatomic, strong)RACSignal *signal;

@end

@implementation RKValidateCodeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
        [self setup];
    }
    return self;
}

// 初始化
- (void)initialization
{
    
    [self.lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self);
        make.height.equalTo(@1);
    }];
    
    [self.logoImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.bottom.equalTo(self.lineV.mas_bottom).offset(-15);
    }];
    
    [self.sendCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.centerY.equalTo(self.logoImgV.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(110, 30));
    }];
    
    [self.textF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.logoImgV.mas_left).offset(15);
        make.centerY.equalTo(self.logoImgV.mas_centerY);
        make.height.equalTo(@30);
        make.right.equalTo(self.sendCodeBtn.mas_left).offset(-10);
    }];
}

- (void)setup
{
    @weakify(self)
    [[self.sendCodeBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self)
        [self setTime];
    }];
}

#pragma mark -------- 私有方法按钮事件倒计时
- (void)setTime
{
    self.totalSeconds = 60; // 设置倒计时时间
    self.sendCodeBtn.enabled = NO;
    if (self.sendCodeNext) {
        self.sendCodeNext(self.signal);
    }
    [self.sendCodeBtn code_setTitle:@"60 s" forState:RKValidateCodeButtonStateSent];
    // 开始倒计时
    @weakify(self)
    self.signal = [[RACSignal interval:1 onScheduler:[RACScheduler mainThreadScheduler]] takeUntilBlock:^BOOL(id x) {
        @strongify(self)
        
        if (self.totalSeconds == 0) {
            return YES;
        }
        return NO;
    }];
    [self.signal subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        self.totalSeconds--;
        NSLog(@"++++++++++  %zd", self.totalSeconds);
        NSArray* info = self.totalSeconds == 0 ? @[@"重新发送", @(RKValidateCodeButtonStateReSend)] : @[kFormat(@"%.2zd s", self.totalSeconds), @(RKValidateCodeButtonStateSent)];
        [self.sendCodeBtn code_setTitle:info[0] forState:[info[1] integerValue]];
    }];
}


#pragma mark  ------ 懒加载
- (RKValidateCodeButton *)sendCodeBtn
{
    if (!_sendCodeBtn) {
        _sendCodeBtn = [RKValidateCodeButton buttonWithType:UIButtonTypeCustom];
        [_sendCodeBtn code_setTitle:@"获取验证码" forState:RKValidateCodeButtonStateNormal];
        [self addSubview:_sendCodeBtn];
    }
    return _sendCodeBtn;
}

- (UIImageView *)logoImgV
{
    if (!_logoImgV) {
        _logoImgV = [[UIImageView alloc] initWithImage:kGetImage(@"")];
        [self addSubview:_logoImgV];
    }
    return _logoImgV;
}

- (UITextField *)textF
{
    if (!_textF) {
        _textF = [[UITextField alloc] init];
        [self addSubview:_textF];
    }
    return _textF;
}

- (UIView *)lineV
{
    if (!_lineV) {
        _lineV = [[UIView alloc] init];
        [self addSubview:_lineV];
    }
    return _lineV;
}
@end
