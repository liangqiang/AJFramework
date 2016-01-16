//
//  UIScrollView+TDDRefresh.m
//  alijkManager
//
//  Created by liangqiang on 15/9/16.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import "UIScrollView+DMRefresh.h"
#import "DMRefreshHeaderView.h"
#import "DMRefreshFooterView.h"

@implementation UIScrollView (DMRefresh)

-(void)setDMRefreshHeaderBlock:(AJRefreshViewBlock)headerBlock{
    if (headerBlock) {
        CGRect rect = CGRectMake(0, 0, self.width, 44);
        DMRefreshHeaderView* headerView = [[DMRefreshHeaderView alloc]initWithFrame:rect];
        headerView.refreshBlock = headerBlock;
        headerView.isHeader = YES;
        self.refreshHeaderView = headerView;
    }else{
        self.refreshHeaderView = nil;
    }
}

-(void)setDMRefreshFooterBlock:(AJRefreshViewBlock)footerBlock{
    if (footerBlock) {
        CGRect rect = CGRectMake(0, 0, self.width, 44);
        DMRefreshFooterView* footerView = [[DMRefreshFooterView alloc]initWithFrame:rect];
        footerView.refreshBlock = footerBlock;
        footerView.isHeader = NO;
        self.refreshFooterView = footerView;
    }else{
        self.refreshFooterView = nil;
    }
}


@end
