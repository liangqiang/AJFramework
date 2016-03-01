//
//  UIScrollView+AJAddition.m
//  MyProject
//
//  Created by liangqiang on 15/12/9.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import "UIScrollView+AJAddition.h"

@implementation UIScrollView (AJAddition)

-(void)setContentHeight:(NSInteger)contentHeight{
    objc_setAssociatedObject(self, @selector(contentHeight),
                             @(contentHeight),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSInteger)contentHeight{
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

-(void) addBlankSection:(NSInteger)height{
    self.contentHeight += height;
    [self setContentSize:CGSizeMake(self.width, self.contentHeight)];
}

-(void)addSection:(UIView*)section{
    section.top = self.contentHeight;
    [self addSubview:section];
    self.contentHeight += section.height;
    [self setContentSize:CGSizeMake(self.width, self.contentHeight)];
}

-(void)removeAllSections{
    UIView *headerView = [self viewWithTag:tag(AJRefreshHeaderView)];
    UIView *footerView = [self viewWithTag:tag(AJRefreshFooterView)];
    [self removeAllSubviews];
    if (headerView) {
        [self addSubview:headerView];
    }
    if (footerView) {
        [self addSubview:footerView];
    }
    self.contentHeight = 0;
    [self setContentSize:CGSizeMake(self.width, 0)];
}


@end
