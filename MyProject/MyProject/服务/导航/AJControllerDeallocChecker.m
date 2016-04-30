//
//  AJControllerDeallocChecker.m
//  MyProject
//
//  Created by liangqiang on 16/4/15.
//  Copyright © 2016年 liangqiang. All rights reserved.
//


static NSMutableArray *kPoppingControllers = nil;

@implementation UINavigationController (AJControllerDeallocChecker)
+(void)load{
    kPoppingControllers = [NSMutableArray array];
    [self swizzMethod:@"popViewControllerAnimated:"];
}

- (UIViewController *)swizz_popViewControllerAnimated:(BOOL)animated{
    UIViewController *controller = [self swizz_popViewControllerAnimated:animated];
    if (controller) {
        if ([kPoppingControllers count] > 0) {
            NSString *message = [NSString stringWithFormat:@"%@(%zd)没有dealloc释放!!",
                                 [kPoppingControllers lastObject],
                                 [kPoppingControllers count]];
            [AJUtil alertMessage:message buttons:@[@"清除", @"取消"] block:^(NSInteger buttonIndex) {
                if (buttonIndex == 0) {
                    [kPoppingControllers removeAllObjects];
                }
            }];
        }
        [kPoppingControllers addObject:[controller description]];
    }
    return controller;
}
@end

@implementation UIViewController (AJControllerDeallocChecker)

+(void)load{
    [self swizzMethod:@"dealloc"];
    [self swizzMethod:@"viewWillAppear:"];
}

-(void)swizz_dealloc{
    [kPoppingControllers removeObject:[self description]];
    [self swizz_dealloc];
}

- (void)swizz_viewWillAppear:(BOOL)animated
{
    if ([[kPoppingControllers lastObject] isEqualToString:[self description]]) {
        [kPoppingControllers removeLastObject];
    }
    
    [self swizz_viewWillAppear:animated];
}

@end