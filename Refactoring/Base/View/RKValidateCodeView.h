//
//  RKValidateCodeView.h
//  Refactoring
//
//  Created by dingqiankun on 2019/3/20.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RKValidateCodeButton.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^SendeCodeNextBlock)(RACSignal *signal);

@interface RKValidateCodeView : UIView

@property(nonatomic, strong)UIImageView *logoImgV;

@property(nonatomic, strong)UITextField *textF;

@property(nonatomic, strong)UIView *lineV;

@property(nonatomic, strong)RKValidateCodeButton *sendCodeBtn;

@property(nonatomic, copy)SendeCodeNextBlock sendCodeNext;

@end

NS_ASSUME_NONNULL_END
