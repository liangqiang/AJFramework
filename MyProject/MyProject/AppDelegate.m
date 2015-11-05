//
//  AppDelegate.m
//  MyProject
//
//  Created by liangqiang on 15/10/22.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import "AppDelegate.h"
#import "DMStatusBarDebugWindow.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self setTabBarStyle];
    [self setNaviBarStyle];
    
    [self setupWindow];
    
    [DMStatusBarDebugWindow show];
    
    return YES;
}

-(void)setupWindow{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [UINavigationController new];
    //首界面
    UIViewController *firstVC = [DMNaviService setFirstViewController:@"DMHomeViewController"];
    firstVC.title = @"首页";
    [self.window makeKeyAndVisible];
}

-(void)setTabBarStyle{
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:kGrayTextColor} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:kMainBlueColor} forState:UIControlStateSelected];
}

-(void)setNaviBarStyle{
    // 设置导航栏背景色与字体颜色
    [[UINavigationBar appearance] setBarTintColor:kNavBgColor];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:HEXCOLOR(0xffffff), NSFontAttributeName:[UIFont systemFontOfSize:18]}];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
