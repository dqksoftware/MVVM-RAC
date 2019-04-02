//
//  RKValidateCodeButton.h
//  Refactoring
//
//  Created by dingqiankun on 2019/3/27.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, RKValidateCodeButtonState)

{
    RKValidateCodeButtonStateNormal = 0,
    RKValidateCodeButtonStateSent = 1,
    RKValidateCodeButtonStateReSend = 2
};

@interface RKValidateCodeButton : UIButton

@property(nonatomic, assign, readonly)RKValidateCodeButtonState btnState;

- (void)code_setTitle:(NSString *)title forState:(RKValidateCodeButtonState)state;

@end

NS_ASSUME_NONNULL_END
