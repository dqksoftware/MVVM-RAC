//
//  RKHomeView.m
//  Refactoring
//
//  Created by dingqiankun on 2019/3/29.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKHomeView.h"

@implementation RKHomeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView
{
    [self.greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(@100);
        make.height.equalTo(@130);
    }];
    self.greenView.backgroundColor = [UIColor greenColor];
    
    [self.blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self.greenView.mas_bottom).offset(30);
        make.height.equalTo(@130);
    }];
    self.blueView.backgroundColor = [UIColor blueColor];
}

- (UIView *)greenView
{
    if (!_greenView) {
        _greenView = [[UIView alloc] init];
        [self addSubview:_greenView];
    }
    return _greenView;
}

- (UIView *)blueView
{
    if (!_blueView) {
        _blueView = [[UIView alloc] init];
        [self addSubview:_blueView];
    }
    return _blueView;
}


@end
