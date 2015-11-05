//
//  UIViewController+DMNavi.m
//  MyProject
//
//  Created by liangqiang on 15/11/5.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import "UIViewController+DMNavi.h"

@implementation UIViewController (DMNavi)

-(void)setDefaultDMNaviButton{
    UIButton *leftBarButton =  [UIButton buttonWithType:UIButtonTypeCustom];
    leftBarButton.frame = CGRectMake(0, 0, 60, 44);
    [leftBarButton setImage:DMIconFontWhiteBack forState:UIControlStateNormal];
    [leftBarButton setImage:DMIconFontWhiteBackSelected forState:UIControlStateHighlighted];
    [leftBarButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 40)];
    [leftBarButton handleClick:^(UIView *view) {
        [DMNaviService popViewController];
    }];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBarButton];
}

-(UIButton*)setLeftDMNaviButton{
    return nil;
}

-(UIButton*)setRightDMNaviButton{
    UIButton *rightBarButton =  [UIButton buttonWithType:UIButtonTypeCustom];
    rightBarButton.frame=CGRectMake(0, 0, 44, 44.0);
    [rightBarButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightBarButton setTitleColor:HEXCOLOR(0xa1dfec) forState:UIControlStateHighlighted];
    [rightBarButton setTitleColor:HEXCOLOR(0x7ee6fc) forState:UIControlStateDisabled];
    [rightBarButton setTitle:@"保存" forState:UIControlStateNormal];
    rightBarButton.titleLabel.font = [UIFont systemFontOfSize:16.f];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBarButton];

    return rightBarButton;
}

@end
