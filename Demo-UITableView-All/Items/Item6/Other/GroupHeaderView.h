//
//  GroupHeaderView.h
//  Demo-UITableView-All
//
//  Created by quhaola on 16/4/27.
//  Copyright © 2016年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupHeaderView : UIButton

+ (instancetype)headerViewWithTitle:(NSString *)title rotation:(BOOL)isRotation tag:(NSUInteger)tag;

@end
