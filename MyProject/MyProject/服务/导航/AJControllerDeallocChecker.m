//
//  AJControllerDeallocChecker.m
//  MyProject
//
//  Created by liangqiang on 16/4/15.
//  Copyright © 2016年 liangqiang. All rights reserved.
//


static NSMutableArray *poppingControllers = nil;

@implementation UINavigationController (AJControllerDeallocChecker)
+(void)load{
    poppingControllers = [NSMutableArray array];
    [self swizzMethod:@"popViewControllerAnimated:"];
}

- (UIViewController *)swizz_popViewControllerAnimated:(BOOL)animated{
    UIViewController *controller = [self swizz_popViewControllerAnimated:animated];
    if (controller) {
        if ([poppingControllers count] > 0) {
            NSString *message = [NSString stringWithFormat:@"%@(%zd)没有dealloc释放!!",
                                 [poppingControllers lastObject],
                                 [poppingControllers count]];
            [AJUtil alert:message buttons:@[@"清除", @"取消"] block:^(NSInteger buttonIndex) {
                if (buttonIndex == 0) {
                    [poppingControllers removeAllObjects];
                }
            }];
        }
        [poppingControllers addObject:[controller description]];
    }
    return controller;
}
@end

@implementation UIViewController (AJControllerDeallocChecker)

+(void)load{
    [self swizzMethod:@"dealloc"];
}

-(void)swizz_dealloc{
    [poppingControllers removeObject:[self description]];
    [self swizz_dealloc];
}

@end