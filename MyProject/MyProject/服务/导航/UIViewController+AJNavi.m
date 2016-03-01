//
//  UIViewController+DMNavi.m
//  MyProject
//
//  Created by liangqiang on 15/11/5.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import "UIViewController+AJNavi.h"

@implementation UIViewController (AJNavi)

+(void)load{
}

-(UIButton*)defaultLeftNaviButton{
    UIButton *button = objc_getAssociatedObject(self, _cmd);
    if (button == nil) {
        button =  [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(0, 0, 60, 44.0);
        [button setImage:AJIconFontWhiteBack forState:UIControlStateNormal];
        [button setImage:AJIconFontWhiteBackSelected forState:UIControlStateHighlighted];
        [button setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 40)];
        [button handleClick:^(UIView *view) {
            [AJNavi popViewController];
        }];

        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        objc_setAssociatedObject(self, _cmd, button, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return button;
}

-(UIButton*)leftNaviButton{
    UIButton *button = objc_getAssociatedObject(self, _cmd);
    if (button == nil) {
        button =  [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(0, 0, 44, 44.0);
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:HEXCOLOR(0xa1dfec) forState:UIControlStateHighlighted];
        [button setTitleColor:HEXCOLOR(0x7ee6fc) forState:UIControlStateDisabled];
        button.titleLabel.font = [UIFont systemFontOfSize:16.f];
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        objc_setAssociatedObject(self, _cmd, button, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return button;
}


-(UIButton*)rightNaviButton{
    UIButton *button = objc_getAssociatedObject(self, _cmd);
    if (button == nil) {
        button =  [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(0, 0, 44, 44.0);
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:HEXCOLOR(0xa1dfec) forState:UIControlStateHighlighted];
        [button setTitleColor:HEXCOLOR(0x7ee6fc) forState:UIControlStateDisabled];
//        [button setTitle:@"保存" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:16.f];
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        objc_setAssociatedObject(self, _cmd, button, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return button;
}

@end
