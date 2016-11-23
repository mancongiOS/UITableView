//
//  HeroFrame.m
//  Demo-UITableView-All
//
//  Created by quhaola on 16/4/25.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "HeroFrame.h"

#import "HeroModel.h"

// 间距
#define kMargin 10.0f
// 图标宽高
#define kIconWh 60.0f
// 标签宽度
#define kLabelWidth 200.0f
// 标签高度
#define kLabelHeight 20.0f
// 类型标签宽度
#define kTypeLabelWidth 80.0f

#define kWidth [UIScreen mainScreen].bounds.size.width

@implementation HeroFrame

- (void)setHeroModel:(HeroModel *)heroModel
{
    _heroModel = heroModel;
    
    // 1. 计算出来所有的cell子视图的frame
    
    _iconFrame = CGRectMake(kMargin, kMargin, kIconWh, kIconWh);
    
    // 获取头像的最大x值
    CGFloat iconMaxX = CGRectGetMaxX(_iconFrame);
    _nameFrame = CGRectMake(kMargin + iconMaxX, kMargin, kLabelWidth, kLabelHeight);
    
    _typeFrame = CGRectMake(kWidth - kTypeLabelWidth, kMargin, kTypeLabelWidth, kLabelHeight);
    
    // 获取nameLabel的最大Y值
    CGFloat nameMaxY = CGRectGetMaxY(_nameFrame);
    
    // 获取介绍文本的动态高度
    CGFloat introLabelHeight = [heroModel.intro boundingRectWithSize:CGSizeMake(kLabelWidth, HUGE_VAL) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : kIntroLabelFont} context:nil].size.height;
    
    _introFrame = CGRectMake(kMargin + iconMaxX, nameMaxY + kMargin, kLabelWidth, introLabelHeight);
    
    _cellHeight = CGRectGetMaxY(_introFrame) + kMargin;
}



@end
