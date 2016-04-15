//
//  UIScrollView+TDDRefresh.m
//  alijkManager
//
//  Created by liangqiang on 15/9/16.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import "UIScrollView+AJRefreshBase.h"

@implementation UIScrollView (AJRefreshBase)

+ (void)load{
    [self swizzMethod:@"dealloc"];
}

-(void)swizz_dealloc{
    [self removeObserver]; //劫持dealloc，确保执行removeObserver
    [self swizz_dealloc];
}

#pragma mark- get/set方法
- (void)setRefreshHeaderView:(AJRefreshViewBase *)headerView {
    if( self.refreshHeaderView ){
        [self.refreshHeaderView removeFromSuperview];
    }
    objc_setAssociatedObject(self, @selector(refreshHeaderView),
                             headerView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (headerView) {
        [self addObserver];
        headerView.origin = CGPointMake(0, -headerView.height);
        [self addSubview:headerView];
        headerView.tag = tag(AJRefreshHeaderView);
    }
}

- (AJRefreshViewBase*)refreshHeaderView {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setRefreshFooterView:(AJRefreshViewBase *)footerView {
    if( self.refreshFooterView ){
        [self.refreshFooterView removeFromSuperview];
    }
    objc_setAssociatedObject(self, @selector(refreshFooterView),
                             footerView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (footerView) {
        [self addObserver];
        footerView.origin = CGPointMake(0, MAX(self.height, self.contentSize.height));
        [self addSubview:footerView];
        footerView.tag = tag(AJRefreshFooterView);
    }
}

- (AJRefreshViewBase*)refreshFooterView {
    AJRefreshViewBase *footer = objc_getAssociatedObject(self, _cmd);
    //ScrollView更新内容后，需要重新设置footerView的位置
    footer.origin = CGPointMake(0, MAX(self.height, self.contentSize.height));
    return footer;
}

#pragma mark- observer
- (void)removeObserver {
    if (self.hasObserver) {
        [self removeObserver:self forKeyPath:@"contentOffset"];
        self.hasObserver = NO;
    }
}

- (void)addObserver {
    if (!self.hasObserver) {
        self.hasObserver = YES;
        [self addObserver:self
               forKeyPath:@"contentOffset"
                  options:NSKeyValueObservingOptionNew context:nil];
    }
}

- (void)setHasObserver:(BOOL)hasObserver {
    objc_setAssociatedObject(self, @selector(hasObserver),
                             @(hasObserver),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)hasObserver {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

#pragma mark - Observing

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if([keyPath isEqualToString:@"contentOffset"]) {
        [self scrollViewDidScroll:[[change valueForKey:NSKeyValueChangeNewKey] CGPointValue]];
    }
}

- (void)scrollViewDidScroll:(CGPoint)contentOffset {
    //    NSLog(@"%@=%@", NSStringFromCGPoint(self.contentOffset), NSStringFromCGPoint(contentOffset));
    if (self.refreshHeaderView && !self.refreshHeaderView.hidden) {
        [self.refreshHeaderView scrollViewDidScroll];
    }
    if (self.refreshFooterView && !self.refreshFooterView.hidden) {
        [self.refreshFooterView scrollViewDidScroll];
    }
}

-(void)autoRefreshHeaderView{
    self.contentOffset = CGPointMake(0, -(self.refreshHeaderView.height + 15));
}

-(void)stopRefresh{
    if (self.refreshHeaderView.status == EStatusRefreshViewRefreshing) {
        [self.refreshHeaderView refreshFinishedWithDelay:0.5];
    }
    if (self.refreshFooterView.status == EStatusRefreshViewRefreshing) {
        [self.refreshFooterView refreshFinishedWithDelay:0.5];
    }
}

@end
