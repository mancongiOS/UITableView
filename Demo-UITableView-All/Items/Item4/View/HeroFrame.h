//
//  HeroFrame.h
//  Demo-UITableView-All
//
//  Created by quhaola on 16/4/25.
//  Copyright © 2016年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kIntroLabelFont [UIFont systemFontOfSize:14.0f]


@class HeroModel;

@interface HeroFrame : NSObject

@property (nonatomic, assign) CGRect  iconFrame;

@property (nonatomic, assign) CGRect  introFrame;
@property (nonatomic, assign) CGRect  nameFrame;

@property (nonatomic, assign) CGRect  typeFrame;

@property (nonatomic, assign) CGFloat  cellHeight;

@property (nonatomic, strong) HeroModel * heroModel;


@end
