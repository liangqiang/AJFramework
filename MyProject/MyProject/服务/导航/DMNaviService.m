//
//  AJNaviService.m
//  MyProject
//
//  Created by liangqiang on 15/10/24.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import "DMNaviService.h"

@implementation DMNaviService

+(instancetype)sharedInstance {
    static DMNaviService *object;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        object = [self new];
    });
    return object;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        self.animated = YES;  //默认YES
    }
    return self;
}

#pragma mark - 创建vc
+(UIViewController*)createViewController:(NSString*)className{
    return [self createViewController:className withProp:nil];
}

+(UIViewController*)createViewController:(NSString*)className withProp:(NSDictionary*)prop{
    id vc = [NSClassFromString(className) new];
    [vc safeSetProperty:prop];
    return vc;
}

#pragma mark - 设置root vc
+(UINavigationController*)rootNavigationController{
//    UIWindow *mainWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
    return (UINavigationController*)[mainWindow() rootViewController];
}

+(UIViewController*)setRootViewController:(NSString*)className{
    return [self setRootViewController:className withProp:nil];
}

+(UIViewController*)setRootViewController:(NSString*)className withProp:(NSDictionary*)prop{
    UINavigationController* navi = [self rootNavigationController];
    UIViewController* vc = [self createViewController:className withProp:prop];
    if (vc) {
        [navi setViewControllers:@[vc] animated:[DMNaviService sharedInstance].animated];
    }
    return vc;
}

#pragma mark - push vc

+(UIViewController*)pushViewController:(NSString*)className{
    return [self pushViewController:className withProp:nil];
}

+(UIViewController*)pushViewController:(NSString*)className withProp:(NSDictionary*)prop{
    UINavigationController* navi = [self rootNavigationController];
    UIViewController* vc = [self createViewController:className withProp:prop];
    [navi pushViewController:vc animated:[DMNaviService sharedInstance].animated];
    return vc;
}

+(UIViewController*)popViewController{
    UINavigationController* navi = [self rootNavigationController];
    return [navi popViewControllerAnimated:[DMNaviService sharedInstance].animated];
}

#pragma mark - present vc
+(UIViewController*)presentViewController:(NSString*)className{
    return [self presentViewController:className withProp:nil];
}

+(UIViewController*)presentViewController:(NSString*)className withProp:(NSDictionary*)prop{
    UINavigationController* navi = [self rootNavigationController];
    UIViewController* vc = [self createViewController:className withProp:prop];
    [navi presentViewController:vc animated:[DMNaviService sharedInstance].animated completion:^{
        //null
    }];
    return vc;
}

+(void)dismissViewController{
    UINavigationController* navi = [self rootNavigationController];
    [navi dismissViewControllerAnimated:[DMNaviService sharedInstance].animated completion:^{
        //null
    }];
}

#pragma mark - 使用tab navi push
+(UINavigationController*)tabNavigationController{
    UIViewController *tab = ((UINavigationController*)[self rootNavigationController]).topViewController;
    if ([tab isKindOfClass:[UITabBarController class]]) {
        UIViewController *selected = ((UITabBarController*)tab).selectedViewController;
        if ([selected isKindOfClass:[UINavigationController class]]) {
            return (UINavigationController*)selected;
        }
    }
    return nil;
}

+(UIViewController*)tabPushViewController:(NSString*)className{
    return [self tabPushViewController:className withProp:nil];
}

+(UIViewController*)tabPushViewController:(NSString*)className withProp:(NSDictionary*)prop{
    UINavigationController* navi = [self tabNavigationController];
    UIViewController* vc = [self createViewController:className withProp:prop];
    [navi pushViewController:vc animated:[DMNaviService sharedInstance].animated];
    return vc;
}

+(UIViewController*)tabPopViewController{
    UINavigationController* navi = [self tabNavigationController];
    return [navi popViewControllerAnimated:[DMNaviService sharedInstance].animated];
}


@end