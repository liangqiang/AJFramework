//
//  AJUtil.m
//  MyProject
//
//  Created by liangqiang on 15/10/26.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import "AJUtil.h"

@implementation AJUtil

+(void)toast:(NSString*)msg{
    //创建label，宽度固定长度扩展
    int padding=30;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(padding/2, padding/2, 230, 30)];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.font = [UIFont boldSystemFontOfSize:16];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    [label sizeToFit];
    
    CGRect vFrame = mainWindow().frame;
    CGRect rect = CGRectMake((vFrame.size.width-label.frame.size.width-padding)/2, (vFrame.size.height-label.frame.size.height-padding)/2,label.frame.size.width+padding, label.frame.size.height+padding);
    
    UIView *view = [[UIView alloc]initWithFrame:rect];
    view.layer.cornerRadius = 7;
    view.clipsToBounds = YES;
    view.backgroundColor = [UIColor colorWithWhite:0 alpha:.7];
    [view addSubview:label];
    [mainWindow() addSubview:view];
    
    [UIView animateWithDuration:.5 delay:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        view.alpha = 0;
    } completion:^(BOOL finished){
        [view removeFromSuperview];
    }];
}

+(id)actionSheet:(NSString*)title buttons:(NSArray*)buttons block:(AJActionSheetClickBlock)block{
    UIActionSheet *as = [UIActionSheet new];
    //    as.title = [NSString stringWithFormat:@"%@(DEBUG)", title];
    as.title = title;
    for (NSString* button in buttons) {
        [as addButtonWithTitle:button];
    }
    as.cancelButtonIndex = buttons.count-1; //最后一个是取消
    [as setClickBlock:block];
    [as showInView:mainWindow()];
    return as;
}


+ (UIImage *)createImageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

@end

#pragma mark- UIActionSheet
#import <objc/runtime.h>

static char *UIActionSheetClickBlock;

@implementation  UIActionSheet (AJUtil)

-(void)setClickBlock:(AJActionSheetClickBlock)block{
    objc_setAssociatedObject(self, &UIActionSheetClickBlock, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.delegate = self;
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
    AJActionSheetClickBlock block = objc_getAssociatedObject(self, &UIActionSheetClickBlock);
    if (block!= nil){
        block(buttonIndex);
    }
}

@end

UIWindow *mainWindow() {
    id appDelegate = [UIApplication sharedApplication].delegate;
    if (appDelegate && [appDelegate respondsToSelector:@selector(window)]) {
        return [appDelegate window];
    }
    
    NSArray *windows = [UIApplication sharedApplication].windows;
    if ([windows count] == 1) {
        return [windows firstObject];
    }
    else {
        for (UIWindow *window in windows) {
            if (window.windowLevel == UIWindowLevelNormal) {
                return window;
            }
        }
    }
    return nil;
}

UIViewController *topMostViewController() {
    UIViewController *topViewController = mainWindow().rootViewController;
    UIViewController *temp = nil;
    while (YES) {
        temp = nil;
        if ([topViewController isKindOfClass:[UINavigationController class]]) {
            temp = ((UINavigationController *)topViewController).visibleViewController;
            
        } else if ([topViewController isKindOfClass:[UITabBarController class]]) {
            temp = ((UITabBarController *)topViewController).selectedViewController;
        }
        else if (topViewController.presentedViewController != nil) {
            temp = topViewController.presentedViewController;
        }
        
        if (temp != nil) {
            topViewController = temp;
        } else {
            break;
        }
    }
    return topViewController;
}


