//
//  DMTabHomeViewModel.m
//  MyProject
//
//  Created by liangqiang on 15/10/26.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import "DMTabHomeViewModel.h"

@implementation DMTabHomeViewModel

-(void)loadAllTabs{
    self.tabs = [NSMutableArray array];
    
    [self addTab:@[@"医生", DMIconFontService, DMIconFontServiceSelect, @"DMHomeViewController"]];
    [self addTab:@[@"用药", DMIconFontPatient, DMIconFontPatientSelect, @"DMHomeViewController"]];
    [self addTab:@[@"我的", DMIconFontMine, DMIconFontMineSelect, @"DMHomeViewController"]];
}

-(void)addTab:(NSArray*)params{
    DMTabHomeItem *item = [DMTabHomeItem new];
    item.title = params[0];
    item.imageNormal = [params[1] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item.imageSelected = [params[2] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item.vcClass = params[3];
    UIViewController *vc = [NSClassFromString(params[3]) new];
    vc.title = params[0];
    vc.hidesBottomBarWhenPushed = NO;
    item.controller = [[UINavigationController alloc]initWithRootViewController:vc];
    [_tabs addObject:item];
}

@end

@implementation DMTabHomeItem

@end