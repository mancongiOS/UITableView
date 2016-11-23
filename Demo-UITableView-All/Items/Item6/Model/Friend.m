//
//  Friend.m
//  Demo-UITableView-All
//
//  Created by quhaola on 16/4/27.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "Friend.h"

@implementation Friend

+ (instancetype)friendWithIconName:(NSString *)iconName name:(NSString *)name sign:(NSString *)sign
{
    Friend * friend = [[Friend alloc] init];
    
    friend.iconName = iconName;
    friend.name = name;
    friend.sign = sign;
    
    return friend;
}

@end
