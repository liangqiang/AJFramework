//
//  DMTabHomeViewController.m
//  MyProject
//
//  Created by liangqiang on 15/10/26.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import "DMTabHomeViewController.h"
#import "DMTabHomeViewModel.h"

@interface DMTabHomeViewController ()
@property (nonatomic,strong) DMTabHomeViewModel *viewModel;
@end

@implementation DMTabHomeViewController
@dynamic viewModel;

-(void)createViews{
    [super createViews];
    
    self.title = @"";
    
    NSMutableArray *controllers = [NSMutableArray array];
    for (DMTabHomeItem *tab in self.viewModel.tabs) {
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:tab.title image:tab.imageNormal selectedImage:tab.imageSelected];
        [tab.controller setTabBarItem:item];
        
//        tab.controller.title = tab.title;
        [controllers addObject:tab.controller];
    }
    self.viewControllers = controllers;
    
}

@end
