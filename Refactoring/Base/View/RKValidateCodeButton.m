//
//  RKValidateCodeButton.m
//  Refactoring
//
//  Created by dingqiankun on 2019/3/27.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKValidateCodeButton.h"

@interface RKValidateCodeButton ()

@property(nonatomic, assign, readwrite)RKValidateCodeButtonState btnState;

@end

@implementation RKValidateCodeButton


- (void)code_setTitle:(NSString *)title forState:(RKValidateCodeButtonState)state
{
    self.btnState = state;
    switch (state) {
        case RKValidateCodeButtonStateNormal:
        {
            [self setTitle:title forState:UIControlStateNormal];
            self.enabled = YES;
        }
            break;
        case RKValidateCodeButtonStateSent:
        {
            [self setTitle:title forState:UIControlStateNormal];
            self.enabled = NO;
        }
            break;
        case RKValidateCodeButtonStateReSend:
        {
            [self setTitle:title forState:UIControlStateNormal];
             self.enabled = YES;
        }
            break;
        default:
            break;
    }
    
    
    
    [self setShapeWith:state];
}


- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    if (!enabled) {
        self.layer.borderColor = [UIColor grayColor].CGColor;
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }else {
        if (self.btnState == RKValidateCodeButtonStateSent) {
            
        }else {
            self.layer.borderColor = kMainColor.CGColor;
            [self setTitleColor:kMainColor forState:UIControlStateNormal];
        }
    }
}

- (void)setShapeWith:(RKValidateCodeButtonState)state
{
    self.layer.borderWidth = 1.0f;
    self.layer.cornerRadius = 8.f;
    // 备用设置各种外观形态
    switch (state) {
        case RKValidateCodeButtonStateNormal:
        {
            
        }
            break;
        case RKValidateCodeButtonStateSent:
        {
           
        }
            break;
        case RKValidateCodeButtonStateReSend:
        {
           
        }
            break;
        default:
            break;
    }
}



@end
