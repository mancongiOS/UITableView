//
//  Group.m
//  Demo-UITableView-All
//
//  Created by quhaola on 16/4/27.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "Group.h"

@implementation Group

+ (instancetype)groupWithName:(NSString *)name friends:(NSArray *)friends
{
    Group * group = [[Group alloc] init];
    
    group.name = name;
    
    group.friends = friends;
    
    return group;
}

@end
