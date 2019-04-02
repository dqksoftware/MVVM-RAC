//
//  RKBasePageRequest.h
//  Refactoring
//
//  Created by dingqiankun on 2019/4/1.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKBaseRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface RKBasePageRequest : RKBaseRequest


@property(nonatomic, assign, readonly)NSInteger page;  // 页数

@property(nonatomic, assign, readonly)NSInteger pageSize;  // 页数展示大小

@property(nonatomic, assign, readonly)BOOL isHasMoreData;  // 判断是否还有更多数据

@property(nonatomic, strong, readonly)NSMutableArray *businessModelArray;  // 业务模型数组

@property(nonatomic, assign)BOOL needRefresh; // 刷新


// 删除数组中的某个元素
- (void)removeObjectAtIndex:(NSInteger)index;

// 返回数据中指向数组的key名字
- (NSString *)keyForArray;

// 数组内模型的Model
- (Class)modelInArray;

/**
    多层key 指向的 模型数组  如下结构：  list 业务模型数组
 {
    message: "",
    data: {
        info:{
            id: 112345,
            list: [
                    {
                         id: "112344"
                         name: "凉鞋"，
                         color: "red"
                    }
            ];
        }
    }
    code: 0
 }
 
 */
- (NSString *)multilayerKeyForArray;


@end

NS_ASSUME_NONNULL_END

