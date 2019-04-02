//
//  ModeSwitching.h
//  Refactoring
//
//  Created by dingqiankun on 2019/3/21.
//  Copyright © 2019 rongshu. All rights reserved.
//

#ifndef ModeSwitching_h
#define ModeSwitching_h

#ifdef DEBUG

/***************   debug 模式      *******************/

#define kHost @"http://47.111.96.113/"    // 域名


#else

/***************   release 模式      *******************/

#define kHost @"http://47.111.96.113/"    // 域名


#endif


#endif /* ModeSwitching_h */
