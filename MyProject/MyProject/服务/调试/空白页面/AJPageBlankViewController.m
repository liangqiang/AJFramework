//
//  AJPageBlankViewController.m
//  alijkManager
//
//  Created by liangqiang on 15/9/14.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import "AJPageBlankViewController.h"
#import "AJPageBlankViewModel.h"

@interface AJPageBlankViewController ()
@property (nonatomic,strong) AJPageBlankViewModel *viewModel;
@end

@implementation AJPageBlankViewController
@dynamic viewModel;

-(void)createViews{
    [super createViews];
    
    if (!self.title) {
        self.title = @"No Title";
    }
    [self scrollView];
//    [self constructBackButton];
}

-(void)constructBackButton{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, 8, APP_SCREEN_WIDTH-100, 50);
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn setBackgroundImage:[TDDCommon createImageWithColor:HEXCOLOR(0x5a5a5a) size:btn.size] forState:UIControlStateNormal];
    
    [btn tddHandleEvent:UIControlEventTouchUpInside callBack:^(UIControl *control) {
        [AJNaviService popViewController];
    }];
    [self.scrollView addSection:8+btn.height+8 subviews:@[btn]];
    
}
@end
