//
//  UIScrollView+TDDRefresh.h
//  alijkManager
//
//  Created by liangqiang on 15/9/16.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "AJRefreshViewBase.h"

@interface UIScrollView (AJRefreshBase)

@property (nonatomic,strong) AJRefreshViewBase* refreshHeaderView;
@property (nonatomic,strong) AJRefreshViewBase* refreshFooterView;
@property (nonatomic, assign) BOOL          hasObserver;       //是否添加observer

//必需执行，否则KVO无法释放
- (void)removeObserver;

-(void)autoRefreshHeaderView;
-(void)stopRefresh;

@end
