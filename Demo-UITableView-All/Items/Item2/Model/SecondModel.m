//
//  SecondModel.m
//  Demo-UITableView-All
//
//  Created by quhaola on 16/4/23.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "SecondModel.h"

@implementation SecondModel

#warning 这个是什么意思? 怎么使用?
- (instancetype)initWithDict:(NSDictionary *)dict
{
    
    if (self = [super init])
    {
        self.name   = dict[@"name"];
        self.icon   = dict[@"icon"];
        self.intro  = dict[@"intro"];
    }
    return self;
}

//抛出异常
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

@end
