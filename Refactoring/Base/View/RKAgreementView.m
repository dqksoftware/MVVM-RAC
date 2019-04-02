//
//  RKAgreementView.m
//  Refactoring
//
//  Created by dingqiankun on 2019/3/27.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKAgreementView.h"

@implementation RKAgreementView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
        [self _setup];
    }
    return self;
}

- (void)createView
{
    [self.selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [self.titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.selectBtn.mas_right);
        make.height.equalTo(@30);
        make.centerY.equalTo(self.selectBtn.mas_centerY);
    }];
    
    [self.agreementBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLbl.mas_right).offset(5);
        make.height.equalTo(self.titleLbl.mas_height);
        make.centerY.equalTo(self.selectBtn.mas_centerY);
    }];
}

- (void)_setup
{
    @weakify(self)
    [[self.selectBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self)
        [self.selectBtn setSelected:!self.selectBtn.isSelected];
    }];
}

#pragma mark -------  懒加载

- (UIButton *)selectBtn
{
    if (!_selectBtn) {
        _selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_selectBtn setImage:kGetImage(@"login-nomarl-iocn") forState:UIControlStateNormal];
        [_selectBtn setImage:kGetImage(@"login-select-iocn") forState:UIControlStateSelected];
        [self addSubview:_selectBtn];
    }
    return _selectBtn;
}

- (UILabel *)titleLbl
{
    if (!_titleLbl) {
        _titleLbl = [[UILabel alloc] init];
        [self addSubview:_titleLbl];
    }
    return _titleLbl;
}

- (UIButton *)agreementBtn
{
    if (!_agreementBtn) {
        _agreementBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_agreementBtn];
    }
    return _agreementBtn;
}





@end
