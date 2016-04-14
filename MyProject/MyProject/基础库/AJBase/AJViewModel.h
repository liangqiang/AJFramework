//
//  AJViewModel.h
//  MyProject
//
//  Created by liangqiang on 16/4/14.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^AJRefreshBlock)();

typedef enum {
    ELoadNotStart,
    ELoadding,
    ELoadFailed,
    ELoadDone,
}ELoadState;


@interface AJViewModel : NSObject

@property (nonatomic,weak) id holder;

@property (nonatomic,copy) AJRefreshBlock refreshBlock;
-(void)setRefreshBlock:(AJRefreshBlock)refreshBlock;

-(void)notifyToRefresh;

// 列表数据
@property (nonatomic,strong) NSMutableArray *sectionArray; // AJSectionItem
@property (nonatomic,assign) NSInteger pageIndex; // 当前页数（数据已完成加载的）
@property (nonatomic,assign) BOOL hasMore; // 是否有加载下一页

// 通常用于加载网络数据的状态
@property (nonatomic,assign) ELoadState loadState; //加载状态

@end

