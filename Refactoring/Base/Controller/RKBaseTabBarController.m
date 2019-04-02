//
//  RKBaseTabBarController.m
//  Refactoring
//
//  Created by dingqiankun on 2019/3/20.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKBaseTabBarController.h"
#import "RKHomeController.h"
#import "RKBaseNavigationController.h"
#import "RKMineController.h"
#import "RKTestController.h"

@interface RKBaseTabBarController ()

@end

@implementation RKBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initTabbas];
}

// 初始化tabbar
- (void)initTabbas
{
    NSMutableArray *controllers = [NSMutableArray array];
    NSArray *tabbarDatas = @[
                             @[@"icon_nomarl", @"icon_select", @"首页", [RKTestController class]],
                             @[@"icon_nomarl", @"icon_select", @"我的", [RKMineController class]]
                            ];
    for (int i = 0; i < tabbarDatas.count; i++) {
        NSString *icon_nomarl = [tabbarDatas[i] objectAtIndex:0];
        NSString *icon_select = [tabbarDatas[i] objectAtIndex:1];
        NSString *title = [tabbarDatas[i] objectAtIndex:2];
        RKBaseController *vc = [[[tabbarDatas[i] objectAtIndex:3] alloc] init];
        RKBaseNavigationController *baseNavigationVC = [[RKBaseNavigationController alloc] initWithRootViewController:vc];
        baseNavigationVC.tabBarItem = [self createTabBarItem:icon_nomarl selectIcon:icon_select title:title tag:i];
        [controllers addObject:baseNavigationVC];
    }
    self.viewControllers = controllers;
}

- (UITabBarItem *)createTabBarItem:(NSString *)icon_normal
              selectIcon:(NSString *)icon_select
                   title:(NSString *)title
                     tag:(NSInteger)tag
{
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:title image:nil tag:tag];
    [item setTitleTextAttributes:@{NSFontAttributeName: kSysFont(12), NSForegroundColorAttributeName: kHexColor(0x000)} forState:UIControlStateNormal];
    [item setTitleTextAttributes:@{NSFontAttributeName: kSysFont(12), NSForegroundColorAttributeName: kMainColor} forState:UIControlStateSelected];
    [item setTitlePositionAdjustment:UIOffsetMake(item.titlePositionAdjustment.horizontal, item.titlePositionAdjustment.vertical)];
    [item setImage:[kGetImage(icon_normal) imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [item setSelectedImage:[kGetImage(icon_select) imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    return item;
}




@end
