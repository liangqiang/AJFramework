//
//  AJStatusBarDebugWindow.m
//  alijkManager
//
//  Created by liangqiang on 15/9/14.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import "DMStatusBarDebugWindow.h"

@interface DMStatusBarDebugWindow ()

@end

@implementation DMStatusBarDebugWindow

+ (instancetype)show{
    DMStatusBarDebugWindow *debug = [[DMStatusBarDebugWindow alloc] initWithFrame:CGRectMake(APP_SCREEN_WIDTH/2 + 30, 0, 90, 20)];
    [[[UIApplication sharedApplication] keyWindow] addSubview:debug];
    return debug;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.hidden = NO;
        self.windowLevel = UIWindowLevelStatusBar + 1;
        
        //DEBUG按钮
        UIButton* debugButton = [[UIButton alloc]initWithFrame:self.bounds];
        [debugButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [debugButton.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
        debugButton.backgroundColor = HEXCOLOR(0xff0000);

        [debugButton setTitle:@"调试" forState:UIControlStateNormal];
        [debugButton handleEvent:UIControlEventTouchUpInside withBlock:^(UIControl *control) {
            NSString *topVCName = NSStringFromClass([topMostViewController() class]);
            if( ![topVCName isEqualToString:@"DMDebugViewController"] ){
                [DMNaviService presentViewController:@"DMDebugViewController"];
//                [AJNaviService presentViewController:@"AJDebugViewController" withParams:@{@"debugButton":debugButton}];
            }else{
                [AJUtil toast:@"调试页已开启✈️🐶✈️"];
            };
        }];
        [self addSubview:debugButton];
        
    }
    return self;
}

@end
