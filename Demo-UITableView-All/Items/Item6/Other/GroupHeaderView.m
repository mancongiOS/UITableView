//
//  GroupHeaderView.m
//  Demo-UITableView-All
//
//  Created by quhaola on 16/4/27.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "GroupHeaderView.h"

@implementation GroupHeaderView

+ (instancetype)headerViewWithTitle:(NSString *)title rotation:(BOOL)isRotation tag:(NSUInteger)tag
{
    GroupHeaderView * headerView = [[GroupHeaderView alloc] init];
    
    [headerView setTitle:title forState:UIControlStateNormal];
    
    headerView.tag = tag;
    
    if (isRotation)
    {
        headerView.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }
    
    [headerView setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];

        // 设置图片模式
    headerView.imageView.contentMode = UIViewContentModeCenter;
        
    headerView.imageView.clipsToBounds = NO;
    
    headerView.backgroundColor = [UIColor orangeColor];
    
    return headerView;
}

// 改变图片的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 0, contentRect.size.width * (1.0 / 10), contentRect.size.height);
}

// 改变文字的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(contentRect.size.width * (1.0 / 10), 0, contentRect.size.width * (9.0 / 10), contentRect.size.height);
}

@end
