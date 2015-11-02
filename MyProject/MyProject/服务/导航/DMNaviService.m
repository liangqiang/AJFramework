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
        _animated = YES;  //默认YES
    }
    return self;
}

#pragma mark - 创建vc
+(UIViewController*)createViewController:(NSString*)className{
    return [self createViewController:className withProp:nil];
}

+(UIViewController*)createViewController:(NSString*)className withProp:(NSDictionary*)prop{
    UIViewController *vc = [NSClassFromString(className) new];
    [vc safeSetProperty:prop];
    vc.hidesBottomBarWhenPushed = YES; //隐藏tabbar，子tab中的vc要设置为NO
    return vc;
}

#pragma mark - 设置root vc
+(UIViewController*)setFirstViewController:(NSString*)className{
    return [self setRootViewController:className withProp:nil];
}

+(UIViewController*)setRootViewController:(NSString*)className withProp:(NSDictionary*)prop{
    UINavigationController *navi = (UINavigationController*)[mainWindow() rootViewController];
    UIViewController* vc = [self createViewController:className withProp:prop];
    [navi setViewControllers:@[vc] animated:[DMNaviService sharedInstance].animated];
//    if ([vc isKindOfClass:[UITabBarController class]] || [vc isKindOfClass:[UINavigationController class]]) {
//        mainWindow().rootViewController = vc;
//    }else{
//        mainWindow().rootViewController = [[UINavigationController alloc]initWithRootViewController:vc];
//    }
    return vc;
}

#pragma mark - push vc
+(UINavigationController*)navigationController{
    UINavigationController *navi = (UINavigationController*)[mainWindow() rootViewController];
    UIViewController *first = [navi.viewControllers firstObject];
    if ([first isKindOfClass:[UITabBarController class]]) {
        UIViewController *selected = ((UITabBarController*)first).selectedViewController;
        if ([selected isKindOfClass:[UINavigationController class]]) {
            return (UINavigationController*)selected;
        }
    }
    
    return navi;
}

+(UIViewController*)pushViewController:(NSString*)className{
    return [self pushViewController:className withProp:nil];
}

+(UIViewController*)pushViewController:(NSString*)className withProp:(NSDictionary*)prop{
    UINavigationController* navi = [self navigationController];
    if (!navi) {
        [AJUtil toast:@"navi not found"];
        return nil;
    }

    UIViewController* vc = [self createViewController:className withProp:prop];
    if (vc) {
        [navi pushViewController:vc animated:[DMNaviService sharedInstance].animated];
    }
    return vc;
}

+(UIViewController*)popViewController{
    UINavigationController* navi = [self navigationController];
    return [navi popViewControllerAnimated:[DMNaviService sharedInstance].animated];
}

#pragma mark - present vc
+(UIViewController*)presentViewController:(NSString*)className{
    return [self presentViewController:className withProp:nil];
}

+(UIViewController*)presentViewController:(NSString*)className withProp:(NSDictionary*)prop{
    UINavigationController* navi = [self navigationController];
    if (!navi) {
        [AJUtil toast:@"navi not found"];
        return nil;
    }

    UIViewController* vc = [self createViewController:className withProp:prop];
    if (vc) {
        [navi presentViewController:vc animated:[DMNaviService sharedInstance].animated completion:^{
            //null
        }];
    }
    return vc;
}

+(void)dismissViewController{
    UINavigationController* navi = [self navigationController];
    [navi dismissViewControllerAnimated:[DMNaviService sharedInstance].animated completion:^{
        //null
    }];
}

@end