//
//  AJStatusBarDebugWindow.m
//  alijkManager
//
//  Created by liangqiang on 15/9/14.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import "AJStatusBarDebugWindow.h"

@interface AJStatusBarDebugWindow ()

@end

@implementation AJStatusBarDebugWindow

+ (instancetype)show{
    CGRect frame = CGRectMake(APP_SCREEN_WIDTH/2 + 30, 0, 60, 20);
    AJStatusBarDebugWindow *debugWindow = [[AJStatusBarDebugWindow alloc]initWithFrame:frame];
    [[[UIApplication sharedApplication] keyWindow] addSubview:debugWindow];
    return debugWindow;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.hidden = NO;
        self.windowLevel = UIWindowLevelStatusBar + 1;
        
        [self initContentView];
    }
    return self;
}

-(void)initContentView{
    //DEBUG按钮
    UIButton* debugButton = [UIButton newWith:kFont12, kWhiteColor, @"调试", nil];
    [debugButton setBgColorWith:kRedColor, nil];
    [self addSubview:debugButton];
    [debugButton layoutWithInsets:UIEdgeInsetsZero];
    
    WEAKSELF
    [debugButton handleEvent:UIControlEventTouchUpInside withBlock:^(UIControl *control) {
        [weakSelf onDebugClicked];
    }];
}

-(void)onDebugClicked{
    NSString *topVCName = NSStringFromClass([topMostViewController() class]);
    if( ![topVCName isEqualToString:@"WDDebugViewController"] ){
        [AJNavi presentViewController:@"WDDebugViewController"];
    }else{
        [AJUtil toast:@"调试页已开启✈️🐶✈️"];
        [AJNavi dismissViewController];
    };
}

@end
