//
//  AJUtil.h
//  MyProject
//
//  Created by liangqiang on 15/10/26.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AJUtil : NSObject

+(void)toast:(NSString*)msg;

+ (UIImage *)createImageWithColor:(UIColor *)color size:(CGSize)size;

@end

UIWindow *mainWindow();
UIViewController *topMostViewController();
