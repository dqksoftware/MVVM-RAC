//
//  RKLoginView.h
//  Refactoring
//
//  Created by dingqiankun on 2019/3/20.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RKLoginPhoneView.h"
#import "RKLoginValidateCodeView.h"

NS_ASSUME_NONNULL_BEGIN

@interface RKLoginView : UIView

@property(nonatomic, strong)RKLoginPhoneView *phoneV;

@property(nonatomic, strong)RKLoginValidateCodeView *codeV;

@property(nonatomic, strong)UIButton *loginBtn;

@property(nonatomic, strong)UIButton *registerBtn;

@end

NS_ASSUME_NONNULL_END
