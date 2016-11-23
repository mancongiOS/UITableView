//
//  Seven_oneViewController.m
//  Demo-UITableView-All
//
//  Created by goulela on 16/6/14.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "Seven_oneViewController.h"

@interface Seven_oneViewController ()

@end

@implementation Seven_oneViewController

#pragma mark - 生命周期
#pragma mark viewDidLoad
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self basicSetting];
}


#pragma mark - 系统代理

#pragma mark - 点击事件

#pragma mark - 实现方法
#pragma mark 基本设置
- (void)basicSetting
{
    self.title = @"第二个页面";
    self.view.backgroundColor = [UIColor orangeColor];
}

#pragma mark - setter & getter
@end
