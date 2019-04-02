//
//  ConstantMacro.h
//  Refactoring
//
//  Created by dingqiankun on 2019/3/18.
//  Copyright © 2019 rongshu. All rights reserved.
//

#ifndef ConstantMacro_h
#define ConstantMacro_h

// 屏幕尺寸
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


// 字体\颜色
#define kSysFont(size) [UIFont systemFontOfSize:size]
#define kBoldFont(size) [UIFont boldSystemFontOfSize:size]

#define kRGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define kRGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define kHexColor(c) [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:1.0]
#define kHexColorA(c, a) [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:a]
#define kMainColor [UIColor colorWithRed:((0xFFA54F>>16)&0xFF)/255.0 green:((0xFFA54F>>8)&0xFF)/255.0 blue:(0xFFA54F&0xFF)/255.0 alpha:1.0]

// 常用对象方法
#define kGetImage(name) [UIImage imageNamed:name]
#define kFormat(string, args...) [NSString stringWithFormat:string, args]


// 常用对象
#define kWindow [[UIApplication sharedApplication] delegate].window
#define kUserDefaults [NSUserDefaults standardUserDefaults]

// 设备判断
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPhone)

#define kIphone4        ([[UIScreen mainScreen] bounds].size.height == 480.f)
#define kIphone5        ([[UIScreen mainScreen] bounds].size.height == 568.f) // 640 * 1336 (5, 5s)
#define kIphone6        ([[UIScreen mainScreen] bounds].size.height == 667.f) // 750 * 1334 (6, 6s, 7)
#define kIphone6p       ([[UIScreen mainScreen] bounds].size.height == 736.f) // 1242 * 2208 (6 plus, 7plus)
#define kIphoneX        ([[UIScreen mainScreen] bounds].size.height == 812.f) // 1125 * 2436 (X)

// 版本号
#define kApp_Version [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"]

// build版本号
#define kApp_BuildVersion [[NSBundle mainBundle] infoDictionary][@"CFBundleVersion"]



#endif /* ConstantMacro_h */
