//
//  Friend.h
//  Demo-UITableView-All
//
//  Created by quhaola on 16/4/27.
//  Copyright © 2016年 MC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Friend : NSObject

@property (nonatomic, copy) NSString  * iconName;
@property (nonatomic, copy) NSString  * name;
@property (nonatomic, copy) NSString  * sign;
@property (nonatomic, assign,getter=isVip) BOOL vip;

+ (instancetype)friendWithIconName:(NSString *)iconName name:(NSString *)name sign:(NSString *)sign;

@end
