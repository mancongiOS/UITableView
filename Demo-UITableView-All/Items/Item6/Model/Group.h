//
//  Group.h
//  Demo-UITableView-All
//
//  Created by quhaola on 16/4/27.
//  Copyright © 2016年 MC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Group : NSObject

// 组名
@property (nonatomic,  copy) NSString * name;

// 组内好友数组
@property (nonatomic, copy) NSArray * friends;

@property (nonatomic, assign, getter=isExpand) BOOL expand;

// 创建方法
+ (instancetype)groupWithName:(NSString *)name friends:(NSArray *)friends;

@end
