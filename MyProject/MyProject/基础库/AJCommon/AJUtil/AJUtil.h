//
//  AJUtil.h
//  MyProject
//
//  Created by liangqiang on 15/10/26.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^AJActionSheetClickBlock)(NSInteger buttonIndex);

@interface AJUtil : NSObject

+(void)toast:(NSString*)msg;

+(id)actionSheet:(NSString*)title buttons:(NSArray*)buttons block:(AJActionSheetClickBlock)block;

+(UIImage *)createImageWithColor:(UIColor *)color size:(CGSize)size;

@end

//------------------------------------------------------------------------------
@interface UIActionSheet (AJUtil) <UIActionSheetDelegate>
-(void)setClickBlock:(AJActionSheetClickBlock)block;
@end


UIWindow *mainWindow();
UIViewController *topMostViewController();
