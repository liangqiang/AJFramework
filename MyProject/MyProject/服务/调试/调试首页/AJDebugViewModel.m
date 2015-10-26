//
//  AJDebugViewModel.m
//  alijkManager
//
//  Created by liangqiang on 15/9/14.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import "AJDebugViewModel.h"

@implementation AJDebugViewModel

- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}

-(void)onCloseButtonClicked{
    [AJNaviService dismissViewController];
}

-(void)onPageDebugButtonClicked{
    [AJNaviService dismissViewController];
    [AJNaviService setRootViewController:@"AJPageDebugViewController"];
}

-(void)onPageReleaseButtonClicked{
    [AJNaviService dismissViewController];
    [AJNaviService setRootViewController:@"AJChoiceRoleViewController"];
}


-(void)onTabPageBackButtonClicked{
    [AJNaviService dismissViewController];
    [AJNaviService popViewController];
}

-(BOOL)isPageDebug{
    UINavigationController* nav = [AJNaviService rootNavigationController];
    NSArray* vcs = nav.viewControllers;
    NSString *className = [NSString stringWithUTF8String:object_getClassName(vcs[0])];
    return [className isEqualToString:@"AJPageDebugViewController"];
}

@end
