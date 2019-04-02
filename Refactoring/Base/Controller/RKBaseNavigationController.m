//
//  RKBaseNavigationController.m
//  Refactoring
//
//  Created by dingqiankun on 2019/3/20.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKBaseNavigationController.h"

@interface RKBaseNavigationController ()

@end

@implementation RKBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
        // 设置返回按钮
    }
    viewController.hidesBottomBarWhenPushed = self.viewControllers.count>0;
    [super pushViewController:viewController animated:animated];
}

@end
