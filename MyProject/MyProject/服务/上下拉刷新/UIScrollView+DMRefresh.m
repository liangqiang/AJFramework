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
#import "AJDeallocObject.h"

@implementation UIScrollView (DMRefresh)

-(void)setDMHeaderViewInHolder:(NSObject*)holder withRefreshBlock:(AJRefreshViewBlock)refreshBlock{
    WEAKSELF
    if (holder) {
        [holder bindDeallocBlock:^{
            [weakSelf removeObserver];
        }];
    }

    CGRect rect = CGRectMake(0, 0, self.width, 44);
    DMRefreshHeaderView* headerView = [[DMRefreshHeaderView alloc]initWithFrame:rect];
    headerView.refreshBlock = refreshBlock;
    headerView.isHeader = YES;
    self.refreshHeaderView = headerView;
}

-(void)setDMFooterViewInHolder:(NSObject*)holder withRefreshBlock:(AJRefreshViewBlock)refreshBlock{
    WEAKSELF
    if (holder) {
        [holder bindDeallocBlock:^{
            [weakSelf removeObserver];
        }];
    }
    
    CGRect rect = CGRectMake(0, 0, self.width, 44);
    DMRefreshFooterView* footerView = [[DMRefreshFooterView alloc]initWithFrame:rect];
    footerView.refreshBlock = refreshBlock;
    footerView.isHeader = NO;
    self.refreshFooterView = footerView;
}

@end
