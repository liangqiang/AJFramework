//
//  WDComplexListViewModel.h
//  MyProject
//
//  Created by liangqiang on 16/3/2.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDComplexViewModel : NSObject

@property (nonatomic,assign) NSInteger pageIndex;
@property (nonatomic,strong) NSMutableArray *sectionArray;

-(void)loadFirstPage;
-(void)loadNextPage;
@end
