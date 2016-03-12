//
//  AJUtil.m
//  MyProject
//
//  Created by liangqiang on 15/10/26.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import "AJUtil.h"
#import "MBProgressHUD.h"

static MBProgressHUD  *s_progressHUD = nil;
static NSMutableDictionary *s_tags = nil;

@implementation AJUtil

+(instancetype)sharedInstance {
    static AJUtil *object;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        object = [self new];
    });
    return object;
}

+(void)toast:(NSString*)msg{
    UIView *view = [UIView newWith:[UIColor colorWithWhite:0 alpha:.7], nil];
    [view setCornerRadiusWith:@(7), nil];
    [mainWindow() addSubview:view];

    UILabel *label = [UILabel newWith:kFont16B, kWhiteColor, msg, @(NSTextAlignmentCenter), nil];
    label.numberOfLines = 0;
    [view addSubview:label];
    
    CGRect vFrame = mainWindow().frame;
    label.size = CGSizeMake(vFrame.size.width-30, 99999);
    [label sizeToFit];
    view.size = CGSizeMake(label.size.width + 30, label.size.height + 30);
    [view layoutWithInsets:UIEdgeInsetsCenter];
    [label layoutWithInsets:UIEdgeInsetsCenter];
    
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

+(void)showLoading{
    if (!s_progressHUD) {
        s_progressHUD = [[MBProgressHUD alloc] initWithView:mainWindow()];
        [s_progressHUD handleClick:^(UIView *view) { //点击消失
            ((MBProgressHUD*)view).taskInProgress = NO;
            [(MBProgressHUD*)view hide:YES];
        }];
    }else{
        [s_progressHUD hide:NO];
    }
    [mainWindow() addSubview:s_progressHUD];
    
    s_progressHUD.removeFromSuperViewOnHide = YES;
    s_progressHUD.animationType = MBProgressHUDAnimationFade;
    s_progressHUD.detailsLabelText = nil;
    
    s_progressHUD.opacity = 0.7;
    s_progressHUD.graceTime = 0.5; //延迟一会，避免一闪就消失
    s_progressHUD.taskInProgress = YES;
    s_progressHUD.minShowTime = 0.5;
    [s_progressHUD show:YES];
}

+(void)hideLoading{
    if (s_progressHUD) {
        s_progressHUD.taskInProgress = NO;
        [s_progressHUD hide:YES];
    }
}

+(NSInteger)tag:(NSString*)key{
    if (!s_tags) {
        s_tags = [NSMutableDictionary dictionary];
    }
    
    NSInteger number = [[s_tags objectForKey:key]integerValue];
    if (number == 0) {
        number = TAG_START_NUMBER + s_tags.count;
        [s_tags setObject:@(number) forKey:key];
    }
    
    return number;
}

+(void)performSelector:(SEL)selector onTarget:(id)target{
    if ([target respondsToSelector:selector]){
//            [target performSelector:callback withObject:nil];
        IMP imp = [target methodForSelector:selector];
        void (*func)(id, SEL) = (void *)imp;
        func(target, selector);
    }
}

+(void)runAfterDelay:(NSTimeInterval)delay block:(void(^)())block{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC*delay),
                   dispatch_get_main_queue(), block);
}

+(NSDate*) dateFromString:(NSString*)date format:(NSString*)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:format];
    return [formatter dateFromString:date];
}

+(NSString*)stringFromDate:(NSDate*)date format:(NSString*)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:date];
}


@end

#pragma mark- UIActionSheet
#import <objc/runtime.h>

@implementation  UIActionSheet (AJUtil)

-(void)setClickBlock:(AJActionSheetClickBlock)block{
    objc_setAssociatedObject(self, _cmd, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.delegate = self;
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
    AJActionSheetClickBlock block = objc_getAssociatedObject(self, @selector(setClickBlock:));
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

//void runBlockAfterDelay(NSTimeInterval delay, void (^block)(void)){
//    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC*delay),
//    //                   dispatch_get_current_queue(), block);
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC*delay),
//                   dispatch_get_main_queue(), block);
//    
//}

//void runSelector(id target, SEL selector){
//    if ([target respondsToSelector:selector]){
//        //    [target performSelector:callback withObject:nil];
//        IMP imp = [target methodForSelector:selector];
//        void (*func)(id, SEL) = (void *)imp;
//        func(target, selector);
//    }
//}




