//
//  TabbarController.m
//  Demo-UITableView-All
//
//  Created by quhaola on 16/4/22.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "TabbarController.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"
#import "SixthViewController.h"
#import "SevenViewController.h"
#import "EightViewController.h"
#import "NineViewController.h"

#import "NavigationController.h"


@interface TabbarController ()

@end

@implementation TabbarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addAllViewControllers];
    
    [self setItems];
}

- (void)addAllViewControllers
{
    FirstViewController * first = [[FirstViewController alloc] init];
    NavigationController * nav1 = [[NavigationController alloc] initWithRootViewController:first];
    
    SecondViewController * second = [[SecondViewController alloc] init];
    NavigationController * nav2 = [[NavigationController alloc] initWithRootViewController:second];
    
    ThirdViewController * third = [[ThirdViewController alloc] init];
    NavigationController * nav3 = [[NavigationController alloc] initWithRootViewController:third];
    
    FourthViewController * Fourth = [[FourthViewController alloc] init];
    NavigationController * nav4 = [[NavigationController alloc] initWithRootViewController:Fourth];
    
    FifthViewController * fifth = [[FifthViewController alloc] init];
    NavigationController * nav5 = [[NavigationController alloc] initWithRootViewController:fifth];
    
    SixthViewController * sixth = [[SixthViewController alloc] init];
    NavigationController * nav6 = [[NavigationController alloc] initWithRootViewController:sixth];
    
    SevenViewController * seven = [[SevenViewController alloc] init];
    NavigationController * nav7 = [[NavigationController alloc] initWithRootViewController:seven];
    
    EightViewController * eight = [[EightViewController alloc] init];
    NavigationController * nav8 = [[NavigationController alloc] initWithRootViewController:eight];
    
    NineViewController * nine = [[NineViewController alloc] init];
    NavigationController * nav9 = [[NavigationController alloc] initWithRootViewController:nine];
    

    
    
    self.viewControllers = @[nav1,nav2,nav3,nav4,nav5,nav6,nav7,nav8,nav9];
}

- (void)setItems
{
    NSArray * titleArray = @[@"基本概念",@"MVC赋值",@"搜索",@"Cell-Frame模型",@"编辑模式",@"通讯录",@"cell上button页面跳转",@"cell-button复用",@"cell的滚动"];
    NSArray * imageArray = @[@"1.png",@"2.png",@"3.png",@"4.png",@"5.png",@"6.png",@"7.png",@"8.png",@"9.png",@"10.png"];
    NSArray * imageSelArray = @[@"1.png",@"2.png",@"3.png",@"4.png",@"5.png",@"6.png",@"7.png",@"8.png",@"9.png",@"10.png"];

    
    
    for (int i = 0; i < titleArray.count; i ++)
    {
        UIViewController * viewController = self.viewControllers[i];
        
        viewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:titleArray[i] image:[[UIImage imageNamed:imageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:imageSelArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    }
}

@end
