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

+(void)showLoading;
+(void)hideLoading;

+(NSInteger)tag:(NSString*)key;

@end

//------------------------------------------------------------------------------
@interface UIActionSheet (AJUtil) <UIActionSheetDelegate>
-(void)setClickBlock:(AJActionSheetClickBlock)block;
@end

//用来生成唯一tag（数字）
//用法：通过约定，保证输入的name不重复即可，通常按 页面标识＋控件标识 来命名，如 tag(MineAvatar), tag(MineName)
//优点：简单可直接用；不同的入参，对应不同的tag；xcode输入时有联想提示
#define TAG_START_NUMBER 900000
#define tag(name) [AJUtil tag:@#name]
#define tag2(name,index) [AJUtil tag:[NSString stringWithFormat:@"%@_%zd", @#name, index]]


UIWindow *mainWindow();
UIViewController *topMostViewController();

//延迟执行block
void runBlockAfterDelay(NSTimeInterval delay, void (^block)(void));

void runSelector(id target, SEL selector);
