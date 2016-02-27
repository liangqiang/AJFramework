//
//  NSObject+AJViewModel.h
//  MyProject
//
//  Created by liangqiang on 16/1/14.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^AJRefreshBlock)();

@interface NSObject (AJViewModel)

@property (nonatomic,copy) AJRefreshBlock ajRefreshBlock;
-(void)setAjRefreshBlock:(AJRefreshBlock)ajRefreshBlock;

-(void)ajRefresh;

@property (nonatomic,weak) id holder;

@end
