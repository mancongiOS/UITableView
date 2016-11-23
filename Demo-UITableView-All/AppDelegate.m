//
//  AppDelegate.m
//  Demo-UITableView-All
//
//  Created by quhaola on 16/4/22.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "AppDelegate.h"

#import "TabbarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    TabbarController * tabbar = [[TabbarController alloc] init];
    
    self.window.rootViewController = tabbar;
    
    [self.window makeKeyAndVisible];
    return YES;
}



@end
