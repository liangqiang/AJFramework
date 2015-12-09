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
    [self initSettings];
    [self setTabBarStyle];
    [self setNaviBarStyle];
    
    [self setupWindow];
    
    //延迟运行
    runBlockAfterDelay(3, ^{
        [DMStatusBarDebugWindow show];
    });
    
    return YES;
}

-(void)initSettings{
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

@end
