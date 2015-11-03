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
@property (nonatomic,strong) DMHomeViewModel *viewModel;
@end

@implementation DMHomeViewController
@dynamic viewModel;

-(void)dealloc{
    NSLog(@"");
}

-(void)createViews{
    [super createViews];
    if (self.title == nil) {
        self.title = [NSString stringWithFormat:@"%u", arc4random()];
        self.hidesBottomBarWhenPushed = YES;
    }
    
    [self.scrollView addBlank:15];
    [self createSetNaviRootSection];

    [self.scrollView addBlank:15];
    [self createSetTabRootSection];

    [self.scrollView addBlank:15];
    [self createPushBlankSection];

    [self.scrollView addBlank:15];
    [self createLoadingSection];
    
    [self.scrollView addBlank:15];
    [self createCoreTextDemoSection];
}

-(void)createSetNaviRootSection{
    CGRect rect = CGRectMake(15, 0, APP_SCREEN_WIDTH-30, 30);
    UILabel *label = [[UILabel alloc]initWithFrame:rect];
    label.text = @"Set Navi Root";
    
    WEAKSELF
    [label handleClick:^(UIView *view) {
        [weakSelf.viewModel onSetNaviRootClicked];
    }];
    
    UIView *section = [self.scrollView addSection:30 subviews:@[label]];
    [section addLineWithY:0];
    [section addLineWithY:section.height];
}

-(void)createSetTabRootSection{
    CGRect rect = CGRectMake(15, 0, APP_SCREEN_WIDTH-30, 30);
    UILabel *label = [[UILabel alloc]initWithFrame:rect];
    label.text = @"Set Tab Root";
    
    WEAKSELF
    [label handleClick:^(UIView *view) {
        [weakSelf.viewModel onSetTabRootClicked];
    }];
    
    UIView *section = [self.scrollView addSection:30 subviews:@[label]];
    [section addLineWithY:0];
    [section addLineWithY:section.height];
}

-(void)createPushBlankSection{
    CGRect rect = CGRectMake(15, 0, APP_SCREEN_WIDTH-30, 30);
    UILabel *label = [[UILabel alloc]initWithFrame:rect];
    label.text = @"Push Blank";
    
    WEAKSELF
    [label handleClick:^(UIView *view) {
        [weakSelf.viewModel onPushBlankClicked];
    }];
    
    UIView *section = [self.scrollView addSection:30 subviews:@[label]];
    [section addLineWithY:0];
    [section addLineWithY:section.height];
}

-(void)createLoadingSection{
    CGRect rect = CGRectMake(15, 0, APP_SCREEN_WIDTH-30, 30);
    UILabel *label = [[UILabel alloc]initWithFrame:rect];
    label.text = @"show Loading";
    
    WEAKSELF
    [label handleClick:^(UIView *view) {
        [weakSelf.viewModel onLoadingClicked];
    }];
    
    UIView *section = [self.scrollView addSection:30 subviews:@[label]];
    [section addLineWithY:0];
    [section addLineWithY:section.height];
}

-(void)createCoreTextDemoSection{
    CGRect rect = CGRectMake(15, 0, APP_SCREEN_WIDTH-30, 30);
    UILabel *label = [[UILabel alloc]initWithFrame:rect];
    label.text = @"core text demo";
    
    WEAKSELF
    [label handleClick:^(UIView *view) {
        [weakSelf.viewModel onCoreTextDemoClicked];
    }];
    
    UIView *section = [self.scrollView addSection:30 subviews:@[label]];
    [section addLineWithY:0];
    [section addLineWithY:section.height];
}

@end
