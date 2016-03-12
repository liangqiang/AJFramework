//
//  TDDRefreshView.h
//  alijkManager
//
//  Created by liangqiang on 15/9/16.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AJRefreshViewBlock)();

typedef enum {
    EStatusRefreshViewInit,
    EStatusRefreshViewInvisible,
    EStatusRefreshViewPartVisible,
    EStatusRefreshViewAllVisible,
    EStatusRefreshViewRefreshing,
} EStatusRefreshView;

@interface AJRefreshViewBase : UIView

@property (nonatomic, copy) AJRefreshViewBlock   refreshBlock;
@property (nonatomic, assign) EStatusRefreshView   status;
@property (nonatomic, assign) BOOL isHeader;

-(void)scrollViewDidScroll;
-(void)refreshFinished;
-(void)refreshFinishedWithDelay:(NSTimeInterval)delay;

//子类需重载函数
-(void)updateViewWithStatus:(EStatusRefreshView)status;

@end


