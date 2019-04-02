//
//  RKBasePageRequest.m
//  Refactoring
//
//  Created by dingqiankun on 2019/4/1.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import "RKBasePageRequest.h"
#import <objc/runtime.h>

@interface RKBasePageRequest ()

@property(nonatomic, assign, readwrite)NSInteger page;  // 页数

@property(nonatomic, assign, readwrite)NSInteger pageSize;  // d页数展示大小

@property(nonatomic, assign, readwrite)BOOL isHasMoreData;  // 是否有下一页

@property(nonatomic, strong, readwrite)NSMutableArray *businessModelArray;  // 业务模型数组

@end

@implementation RKBasePageRequest

/**
    根据个人公司情况修改key值对应的请求参数
 */
static const char *private_page_key = "pageNow";
static const char *private_pagesize_key = "pagesize";


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

// 初始化
- (void)setup
{
    self.page = 1;
    self.pageSize = 15;
    self.needRefresh = YES;
}

- (void)warning:(NSString *)selector
{
    NSString *warning = @"";
    if ([self isKindOfClass:self.class]) {
        warning = @"该类请勿直接使用，请继承 [RKBaseRequest] 类";
    }else{
        warning = [NSString stringWithFormat:@"请在子类实现%@方法", selector];
    }
    NSAssert(NO, warning);
}

- (id)requestArgument
{
    NSMutableDictionary *dictM = [NSMutableDictionary dictionaryWithDictionary:@{[NSString stringWithUTF8String:private_page_key] : @(self.page), [NSString stringWithUTF8String:private_pagesize_key] : @(self.pageSize)}];
     return dictM;
}

- (BOOL)isHasMoreData
{
    NSArray *resultArray = [self resultModelArray];
    
    if (resultArray.count < self.pageSize) {
        return NO;
    }
    return YES;
}

- (NSString *)keyForArray
{
    return nil;
}

- (Class)modelInArray
{
    [self warning:nil];
    return nil;
}

- (NSString *)multilayerKeyForArray
{
    return nil;
}

- (NSArray *)resultModelArray
{
    NSArray *modelArray = nil;
    if (!self.modelInArray) {
        return nil;
    }
    // 指向数组的ky
    if (self.keyForArray && ![self.keyForArray isEqualToString:@"data"]) {
        modelArray = self.businessData[self.keyForArray];
        return [self.modelInArray mj_objectArrayWithKeyValuesArray:modelArray];
    }
    // 多层key
    if (self.multilayerKeyForArray) {
        modelArray = self.businessData[self.multilayerKeyForArray];
        return [self.modelInArray mj_objectArrayWithKeyValuesArray:modelArray];
    }
    modelArray = self.businessData;
    
    return [self.modelInArray mj_objectArrayWithKeyValuesArray:modelArray];
}

// 刷新
- (void)startRefresh
{
    self.needRefresh = YES;
}

// 网络请求
- (void)startWithCompletion:(RequestCompleteBlock)completeBlock
{
    if (self.needRefresh) {
        self.page = 1;
    }else {
        self.page += 1;
    }
    [self startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        if (self.needRefresh) {
            [self.businessModelArray removeAllObjects];  // 移除所有数据
        }
        [self.businessModelArray addObjectsFromArray:[self resultModelArray]];
        self.needRefresh = NO;
        completeBlock(self, self.error);
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        // 链接服务器失败
        self.page -= 1;
        self.needRefresh = NO;
        completeBlock(self, self.error);
    }];
}

#pragma  mark  ---- 懒加载
- (NSMutableArray *)businessModelArray
{
    if (!_businessModelArray) {
        _businessModelArray = [NSMutableArray array];
    }
    return _businessModelArray;
}

- (void)removeObjectAtIndex:(NSInteger)index
{
    
    if (index < self.businessModelArray.count) {
        @try {
            [self.businessModelArray removeObjectAtIndex:index];
        } @catch (NSException *exception) {
            NSLog(@"((((((((((  exception: %@  %@", exception.name, exception.reason);
        } @finally {
            
        }
        
    }
}

#pragma mark  ------  重写 getter setter

- (NSInteger)pageSize
{
    return [objc_getAssociatedObject(self, private_pagesize_key) integerValue];
}

- (NSInteger)page
{
    return [objc_getAssociatedObject(self, private_page_key) integerValue];
}

- (void)setPage:(NSInteger)page
{
    
    objc_setAssociatedObject(self, private_page_key, kFormat(@"%zd", page), OBJC_ASSOCIATION_ASSIGN);
}

- (void)setPageSize:(NSInteger)pageSize
{
    objc_setAssociatedObject(self, private_pagesize_key, kFormat(@"%zd", pageSize), OBJC_ASSOCIATION_ASSIGN);
}



@end
