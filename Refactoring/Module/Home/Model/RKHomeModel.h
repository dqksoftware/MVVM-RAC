//
//  RKHomeModel.h
//  Refactoring
//
//  Created by dingqiankun on 2019/3/29.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChannelList : NSObject

@property(nonatomic, copy)NSString *name;

@property(nonatomic, copy)NSString *ad_pid;

@property(nonatomic, copy)NSString *pid;

@end

@interface Data : NSObject

@property(nonatomic, assign)NSInteger siteId;

@property(nonatomic, copy)NSString *name;

@property(nonatomic, copy)NSArray<ChannelList *> *channelList;

@end

@interface RKHomeModel : NSObject

@property(nonatomic, strong)NSArray<Data *> *data;

@end

NS_ASSUME_NONNULL_END
