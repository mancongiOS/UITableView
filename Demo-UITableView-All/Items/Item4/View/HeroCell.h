//
//  HeroCell.h
//  Demo-UITableView-All
//
//  Created by quhaola on 16/4/25.
//  Copyright © 2016年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HeroFrame;

@interface HeroCell : UITableViewCell

/**
 Cell --> HeroModel 重写了model的setter方法,给cell的子视图填充数据,并确定动态子视图的frame.
 
 Cell --> HeroFrame --> HeroModel 重写HeroFrame的setter方法,确定动态子视图的frame,并填充数据.
 */

@property (nonatomic, strong) HeroFrame * heroFrame;

+ (instancetype)heroCellWithTableView:(UITableView *)tableView;

@end
