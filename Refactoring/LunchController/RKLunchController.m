//
//  RKLunchController.m
//  Refactoring
//
//  Created by dingqiankun on 2019/3/20.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKLunchController.h"
#import "RKBaseTabBarController.h"

@interface RKLunchController ()

@end

@implementation RKLunchController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setRootController];
}

- (void)setRootController
{
    
    kWindow.rootViewController = [RKBaseTabBarController new];
}


@end
