//
//  UIScrollView+TDDRefresh.m
//  alijkManager
//
//  Created by liangqiang on 15/9/16.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import "UIScrollView+AJRefresh.h"
#import "AJRefreshHeaderView.h"
#import "AJRefreshFooterView.h"

@implementation UIScrollView (AJRefresh)

-(void)setRefreshHeaderBlock:(AJRefreshViewBlock)headerBlock{
    if (headerBlock) {
        CGRect rect = CGRectMake(0, 0, self.width, 44);
        AJRefreshHeaderView* headerView = [[AJRefreshHeaderView alloc]initWithFrame:rect];
        headerView.refreshBlock = headerBlock;
        headerView.isHeader = YES;
        self.refreshHeaderView = headerView;
    }else{
        self.refreshHeaderView = nil;
    }
}

-(void)setRefreshFooterBlock:(AJRefreshViewBlock)footerBlock{
    if (footerBlock) {
        CGRect rect = CGRectMake(0, 0, self.width, 44);
        AJRefreshFooterView* footerView = [[AJRefreshFooterView alloc]initWithFrame:rect];
        footerView.refreshBlock = footerBlock;
        footerView.isHeader = NO;
        self.refreshFooterView = footerView;
    }else{
        self.refreshFooterView = nil;
    }
}


@end
