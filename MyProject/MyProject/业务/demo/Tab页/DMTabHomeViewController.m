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

-(instancetype)init{
    if (self=[super init]) {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    return self;
}

-(void)viewDidLoad{
//    self.navigationController.navigationBarHidden = YES;
    
    [self.viewModel loadAllTabs];
    
    NSMutableArray *controllers = [NSMutableArray array];
    for (DMTabHomeItem *tab in self.viewModel.tabs) {
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:tab.title image:tab.imageNormal selectedImage:tab.imageSelected];
        [tab.controller setTabBarItem:item];
        [controllers addObject:tab.controller];
    }
    self.viewControllers = controllers;

}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)updateViews{
    
}
//-(void)createViews{
//    [super createViews];
//    
//    self.title = @"";
//    
//    NSMutableArray *controllers = [NSMutableArray array];
//    for (DMTabHomeItem *tab in self.viewModel.tabs) {
//        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:tab.title image:tab.imageNormal selectedImage:tab.imageSelected];
//        [tab.controller setTabBarItem:item];
//        
////        tab.controller.title = tab.title;
//        [controllers addObject:tab.controller];
//    }
//    self.viewControllers = controllers;
//}

#pragma mark - getter

-(id)viewModel{
    if (!_viewModel) {
        _viewModel = [DMTabHomeViewModel new];
        _viewModel.holder = self;
        
        WEAKSELF
        [_viewModel setAjRefreshBlock:^{
            [weakSelf updateViews];
        }];
    }
    return _viewModel;
}


@end
