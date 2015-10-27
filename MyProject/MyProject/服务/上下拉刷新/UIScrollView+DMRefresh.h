//
//  UIScrollView+TDDRefresh.h
//  alijkManager
//
//  Created by liangqiang on 15/9/16.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIScrollView+AJRefreshBase.h"
#import "AJRefreshViewBase.h"

@interface UIScrollView (DMRefresh)

-(void)setDMHeaderViewRefreshBlock:(AJRefreshViewBlock)refreshBlock;
-(void)setDMFooterViewRefreshBlock:(AJRefreshViewBlock)refreshBlock;

//去掉上拉加载更多，隐藏或设置为nil
//self.footerView.hidden = !model.hasMore;

//注意：dealloc前，scrollView必需执行removeObserver，否则KVO无法释放
-(void)setDeallocParent:(NSObject*)parent;

@end
