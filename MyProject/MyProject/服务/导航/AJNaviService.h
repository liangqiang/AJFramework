//
//  AJNaviService.h
//  MyProject
//
//  Created by liangqiang on 15/10/24.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AJNaviService : NSObject

+(instancetype)sharedInstance;
@property (nonatomic,assign) BOOL animated;

//使用要求：
//1、在AppDelegate中，将window.rootViewController设置为UINavigationController
//2、如使用withProp参数，则需在该Controller中先定义相应的属性
//3、如使用tab navi方法，则每个子tab的root要求是UINavigationController

//创建VC
+(UIViewController*)createViewController:(NSString*)className;
+(UIViewController*)createViewController:(NSString*)className withProp:(NSDictionary*)prop;

//设置root vc
+(UINavigationController*)rootNavigationController;
+(UIViewController*)setRootViewController:(NSString*)className;
+(UIViewController*)setRootViewController:(NSString*)className withProp:(NSDictionary*)prop;

//使用root navi push vc
+(UIViewController*)pushViewController:(NSString*)className;
+(UIViewController*)pushViewController:(NSString*)className withProp:(NSDictionary*)prop;
+(UIViewController*)popViewController;

//present vc
+(UIViewController*)presentViewController:(NSString*)className;
+(UIViewController*)presentViewController:(NSString*)className withProp:(NSDictionary*)prop;
+(void)dismissViewController;

//使用tab navi push
+(UINavigationController*)tabNavigationController;
+(UIViewController*)tabPushViewController:(NSString*)className;
+(UIViewController*)tabPushViewController:(NSString*)className withProp:(NSDictionary*)prop;
+(UIViewController*)tabPopViewController;

@end
