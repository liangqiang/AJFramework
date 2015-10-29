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

-(void)setDMHeaderViewInHolder:(NSObject*)holder withRefreshBlock:(AJRefreshViewBlock)refreshBlock;
-(void)setDMFooterViewInHolder:(NSObject*)holder withRefreshBlock:(AJRefreshViewBlock)refreshBlock;


//去掉上拉加载更多，隐藏或设置为nil
// self.footerView.hidden = YES;
// or
// 

@end
