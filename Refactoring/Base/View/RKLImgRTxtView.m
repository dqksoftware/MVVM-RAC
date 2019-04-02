//
//  RKLImgRTxtView.m
//  Refactoring
//
//  Created by dingqiankun on 2019/3/20.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKLImgRTxtView.h"

@interface RKLImgRTxtView ()



@end

@implementation RKLImgRTxtView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
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
    
    [self.textF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.logoImgV.mas_left).offset(15);
        make.centerY.equalTo(self.logoImgV.mas_centerY);
        make.height.equalTo(@30);
        make.right.equalTo(self);
    }];
    
    [[self.textF rac_signalForSelector:@selector(becomeFirstResponder)] subscribeNext:^(RACTuple * _Nullable x) {
        self.lineV.backgroundColor = kMainColor;
    }];
    
    [[self.textF rac_signalForSelector:@selector(resignFirstResponder)] subscribeNext:^(RACTuple * _Nullable x) {
        
        self.lineV.backgroundColor = self.textF.text.length > 0 ? kMainColor : [UIColor grayColor];
    }];
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
        _lineV.backgroundColor = [UIColor grayColor];
        [self addSubview:_lineV];
    }
    return _lineV;
}

@end
