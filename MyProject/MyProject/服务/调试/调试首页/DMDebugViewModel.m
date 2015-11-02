//
//  AJDebugViewModel.m
//  alijkManager
//
//  Created by liangqiang on 15/9/14.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import "DMDebugViewModel.h"

@implementation DMDebugViewModel

- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}

-(void)onCloseButtonClicked{
    [DMNaviService dismissViewController];
}

-(void)onPageDebugButtonClicked{
    [DMNaviService dismissViewController];
    [DMNaviService setFirstViewController:@"AJPageDebugViewController"];
}

-(void)onPageReleaseButtonClicked{
    [DMNaviService dismissViewController];
    [DMNaviService setFirstViewController:@"AJChoiceRoleViewController"];
}


-(void)onTabPageBackButtonClicked{
    [DMNaviService dismissViewController];
    [DMNaviService popViewController];
}

-(BOOL)isPageDebug{
    UINavigationController* nav = [DMNaviService navigationController];
    NSArray* vcs = nav.viewControllers;
    NSString *className = [NSString stringWithUTF8String:object_getClassName(vcs[0])];
    return [className isEqualToString:@"AJPageDebugViewController"];
}

@end
