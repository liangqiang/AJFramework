//
//  TDDRefreshView.m
//  alijkManager
//
//  Created by liangqiang on 15/9/16.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import "AJRefreshViewBase.h"

@interface AJRefreshViewBase ()
@property (nonatomic,weak,readonly) UIScrollView* scrollView;
@end

@implementation AJRefreshViewBase

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.status = EStatusRefreshViewInit;
    }
    return self;
}

-(void)scrollViewDidScroll{
    if (self.status == EStatusRefreshViewRefreshing) {
        return;
    }
    
    self.status = [self calculateStatus];
    if (self.status == EStatusRefreshViewRefreshing) {
        [self callRefreshBlock];
    }
    [self updateViewWithStatus:self.status];
}

-(EStatusRefreshView)calculateStatus{
     CGFloat y = 0.0;
    if (self.isHeader) {
        y = self.scrollView.contentOffset.y;
    }else{
        y = MAX(self.scrollView.contentSize.height, self.scrollView.size.height) - (self.scrollView.contentOffset.y + self.scrollView.size.height);
    }
    
    if (!self.scrollView.dragging && y < -self.height)
        return EStatusRefreshViewRefreshing; //触发
    
    if (y >= 0)
        return EStatusRefreshViewInvisible; //不可见
    
    //全部露出，比高度再多一点，否则松开手指时，界面回滚，导致不能达成触发条件
    if( y <= -(self.height+8))
        return EStatusRefreshViewAllVisible;
    
    return EStatusRefreshViewPartVisible; //部分可见
}

-(UIScrollView*)scrollView{
    return (UIScrollView*)self.superview;
}

-(void)callRefreshBlock{
    //刷新过程中让refreshView保持显示
    [UIView animateWithDuration:0.25f animations:^{
        if (self.isHeader) {
            self.scrollView.contentInset = UIEdgeInsetsMake(self.height, 0.0f, 0, 0.0f);
        }else{
            self.scrollView.contentInset = UIEdgeInsetsMake(0.0f, 0.0f, self.scrollView.height - MIN(self.scrollView.height, self.scrollView.contentSize.height) + self.height, 0.0f);
        }
    } completion:^(BOOL finished) {
    }];
    
    if (self.refreshBlock) {
        self.refreshBlock();
    }
}

-(void)refreshFinishedWithDelay:(NSTimeInterval)delay{
    WEAKSELF
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC*delay), dispatch_get_main_queue(), ^{
        if (weakSelf.status == EStatusRefreshViewRefreshing) {
            [weakSelf refreshFinished];
        }else{
            [weakSelf resetRefresh];
        }
    });
}

-(void)refreshFinished{
    [UIView animateWithDuration:0.25f animations:^{
        self.scrollView.contentInset = UIEdgeInsetsMake(0.0f, 0.0f,0.f, 0.0f);
    } completion:^(BOOL finished) {
        [self resetRefresh];
    }];
}

-(void)resetRefresh{
//    [self.scrollView.layer removeAllAnimations];
    self.scrollView.contentInset = UIEdgeInsetsMake(0.0f, 0.0f,0.f, 0.0f);
    self.status = EStatusRefreshViewInit;
}

#pragma mark- 子类需重载
-(void)updateViewWithStatus:(EStatusRefreshView)status{
}


@end
