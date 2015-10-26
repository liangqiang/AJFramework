//
//  AJPageDebugViewController.m
//  alijkManager
//
//  Created by liangqiang on 15/9/10.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import "AJPageDebugViewController.h"
#import "AJPageDebugViewModel.h"

@interface AJPageDebugViewController ()
@property (nonatomic,strong) AJPageDebugViewModel *viewModel;
@end

@implementation AJPageDebugViewController
@dynamic viewModel;

-(void)createViews{
    [super createViews];
    
    self.title = @"页面调试";
    [self createButtons];
    [self createExtraButton];
}

-(void)updateViews{
    [super updateViews];
}


-(void)createButtons{
    for (AJPageDebugButtonItem *button in self.viewModel.buttons) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(50, 8, APP_SCREEN_WIDTH-100, 50);
        [btn setTitle:button.title forState:UIControlStateNormal];
        [btn setBackgroundImage:[TDDCommon createImageWithColor:HEXCOLOR(0x5a5a5a) size:btn.size] forState:UIControlStateNormal];
        
        [btn tddHandleEvent:UIControlEventTouchUpInside callBack:^(UIControl *control) {
            [AJNaviService pushViewController:button.vcClass];
        }];
        [self.scrollView addSection:8+btn.height+8 subviews:@[btn]];
    }
}

-(void)createExtraButton{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, 8, APP_SCREEN_WIDTH-100, 50);
    [btn setTitle:@"其他" forState:UIControlStateNormal];
    [btn setBackgroundImage:[TDDCommon createImageWithColor:HEXCOLOR(0x5a5a5a) size:btn.size] forState:UIControlStateNormal];
    
    WEAKSELF
    [btn tddHandleEvent:UIControlEventTouchUpInside callBack:^(UIControl *control) {
        [weakSelf.viewModel onExtraButtonClicked];
    }];
    [self.scrollView addSection:8+btn.height+8 subviews:@[btn]];
}

@end
