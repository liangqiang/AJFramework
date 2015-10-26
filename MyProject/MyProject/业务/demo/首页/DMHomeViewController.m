//
//  DMHomeViewController.m
//  MyProject
//
//  Created by liangqiang on 15/10/26.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import "DMHomeViewController.h"
#import "DMHomeViewModel.h"
@interface DMHomeViewController ()
@property (nonatomic,retain) DMHomeViewModel *viewModel;
@end

@implementation DMHomeViewController
@dynamic viewModel;

-(void)createViews{
    [super createViews];
    self.title = @"Home";
    
    [self.scrollView addBlank:15];
    [self createGotoTabSection];
}

-(void)createGotoTabSection{
    CGRect rect = CGRectMake(15, 0, APP_SCREEN_WIDTH-30, 30);
    UILabel *label = [[UILabel alloc]initWithFrame:rect];
    label.text = @"Goto Tab";
    
    WEAKSELF
    [label handleClick:^(UIView *view) {
        [weakSelf.viewModel onGotoTabClicked];
    }];
    
    UIView *section = [self.scrollView addSection:30 subviews:@[label]];
    [section addLineWithY:0];
    [section addLineWithY:section.height];
}
@end
