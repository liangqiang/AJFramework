//
//  UIScrollView+TDDRefresh.h
//  alijkManager
//
//  Created by liangqiang on 15/9/16.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIScrollView+AJRefreshBase.h"

@interface UIScrollView (DMRefresh)

//注意：holder不能为nil！并且要先设置holder，再设置headerBlock、footerBlock。
//统一方法
//-(void)setDMRefreshHeaderBlock:(AJRefreshViewBlock)headerBlock footerBlock:(AJRefreshViewBlock)footerBlock inHolder:(id)holder;

//独立方法，设置刷新
-(void)setDMRefreshHolder:(id)holder;
-(void)setDMRefreshHeaderBlock:(AJRefreshViewBlock)headerBlock;
-(void)setDMRefreshFooterBlock:(AJRefreshViewBlock)footerBlock;

//去掉刷新View
//1、设置为nil。   self.refreshFooterView = nil;
//2、或者隐藏。    self.refreshFooterView.hidden = YES;
//3、调用set方法，block传nil。  [scrollView setHeaderBlock:nil footerBlock:nil inHolder:self];

//关闭刷新
//[scrollView stopRefresh]

@end
