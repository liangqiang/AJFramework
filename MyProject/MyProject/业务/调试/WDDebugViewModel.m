//
//  AJDebugViewModel.m
//  alijkManager
//
//  Created by liangqiang on 15/9/14.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import "WDDebugViewModel.h"

@implementation WDDebugViewModel

- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}

-(void)loadData{
    [self notifyToRefresh];
}


-(void)onCloseButtonClicked{
    [AJNavi dismissViewController];
}

-(void)onPageDebugButtonClicked{
    [AJNavi dismissViewController];
    [AJNavi setRootViewController:@"AJPageDebugViewController"];
}

-(void)onPageReleaseButtonClicked{
    [AJNavi dismissViewController];
    [AJNavi setRootViewController:@"AJChoiceRoleViewController"];
}


-(void)onTabPageBackButtonClicked{
    [AJNavi dismissViewController];
    [AJNavi popViewController];
}

-(BOOL)isPageDebug{
    UINavigationController* nav = [AJNavi navigationController];
    NSArray* vcs = nav.viewControllers;
    NSString *className = [NSString stringWithUTF8String:object_getClassName(vcs[0])];
    return [className isEqualToString:@"AJPageDebugViewController"];
}

@end
