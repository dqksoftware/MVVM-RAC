//
//  RKTestCell.h
//  Refactoring
//
//  Created by dingqiankun on 2019/4/1.
//  Copyright © 2019 rongshu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RKDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RKTestCell : UITableViewCell

@property(nonatomic, strong)UILabel *titleLbl;

@property(nonatomic, strong)UILabel *priceLbl;

@property(nonatomic, strong)UILabel *shopNameLbl;

@property(nonatomic, strong)UIImageView *goodsImgv;


- (void)setViewWithModel:(RKDataModel *)model;

@end

NS_ASSUME_NONNULL_END
