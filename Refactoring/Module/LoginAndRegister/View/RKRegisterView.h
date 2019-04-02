//
//  RKRegisterView.h
//  Refactoring
//
//  Created by dingqiankun on 2019/3/25.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RKRegisterValidateCodeView.h"
#import "RKRegisterPhoneView.h"
#import "RKRegisterAgreementView.h"

NS_ASSUME_NONNULL_BEGIN

@interface RKRegisterView : UIView

@property(nonatomic, strong)RKRegisterValidateCodeView *validateCodeV;

@property(nonatomic, strong)RKRegisterPhoneView *phoneV;

@property(nonatomic, strong)UIButton *registerBtn;

@property(nonatomic, strong)RKRegisterAgreementView *agreementV;

@end

NS_ASSUME_NONNULL_END
