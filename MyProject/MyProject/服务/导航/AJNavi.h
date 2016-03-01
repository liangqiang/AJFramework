//
//  AJNaviService.h
//  MyProject
//
//  Created by liangqiang on 15/10/24.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AJNavi : NSObject

+(instancetype)sharedInstance;
@property (nonatomic,assign) BOOL animated;

//使用要求：
//1、在AppDelegate中，window.rootViewController为UINavigationController
//2、Navi的首页，如果为UITabBarController，那么要求每个子tab为UINavigationController，使用子tab的navi进行push；否则使用根navi进行push
//3、如使用withProp参数，则需在该Controller中先定义相应的属性

//创建VC
+(UIViewController*)createViewController:(NSString*)className;
+(UIViewController*)createViewController:(NSString*)className withProp:(NSDictionary*)prop;

//设置root vc
+(UIViewController*)setRootViewController:(NSString*)className;
+(UIViewController*)setRootViewController:(NSString*)className withProp:(NSDictionary*)prop;

//使用root/tab navi push vc
+(UINavigationController*)navigationController; //root 或 tab navi
+(UIViewController*)pushViewController:(NSString*)className;
+(UIViewController*)pushViewController:(NSString*)className withProp:(NSDictionary*)prop;
+(UIViewController*)popViewController;

//present vc
+(UIViewController*)presentViewController:(NSString*)className;
+(UIViewController*)presentViewController:(NSString*)className withProp:(NSDictionary*)prop;
+(void)dismissViewController;

@end
