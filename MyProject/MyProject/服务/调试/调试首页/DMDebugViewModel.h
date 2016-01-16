//
//  AJDebugViewModel.h
//  alijkManager
//
//  Created by liangqiang on 15/9/14.
//  Copyright (c) 2015年 SunX. All rights reserved.
//


@interface DMDebugViewModel : NSObject

@property (nonatomic, assign, readonly) BOOL isPageDebug;


-(void)onPageDebugButtonClicked;
-(void)onPageReleaseButtonClicked;

-(void)onTabPageBackButtonClicked;

-(void)onCloseButtonClicked;

@end
