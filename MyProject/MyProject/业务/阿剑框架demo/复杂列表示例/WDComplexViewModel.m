//
//  WDComplexListViewModel.m
//  MyProject
//
//  Created by liangqiang on 16/3/2.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "WDComplexViewModel.h"
#import "WDComplexCellItem.h"

@implementation WDComplexViewModel

-(instancetype)init{
    if (self=[super init]) {
        _sectionArray = [NSMutableArray array];
    }
    return self;
}

-(void)loadFirstPage{
    //模拟网络请求
    WEAKSELF
    [AJUtil runAfterDelay:0.5 block:^{
        [weakSelf loadPageAtIndex:1];
    }];
}

-(void)loadNextPage{
    //模拟网络请求
    WEAKSELF
    [AJUtil runAfterDelay:0.5 block:^{
        [weakSelf loadPageAtIndex:weakSelf.pageIndex+1];
    }];
}

-(void)loadPageAtIndex:(NSInteger)index{
    if (index == 1) {
        [self.sectionArray removeAllObjects];
    }
    AJSectionItem *sectionItem = [AJSectionItem new];
    [self.sectionArray addObject:sectionItem];
    for (NSInteger i=0; i<10; i ++) {
        WDComplexCellItem *item = [WDComplexCellItem new];
//        item.cellType = arc4random_uniform(2); //0-1
        item.cellType = i % 2; //0-1
        NSInteger titleLen = arc4random_uniform(50);
        NSInteger contentLen = arc4random_uniform(500);
        item.title = [NSString stringWithFormat:@"标题 %@", [self randomStringWithLen:titleLen]];
        item.content = [NSString stringWithFormat:@"内容 %@", [self randomStringWithLen:contentLen]];
        [sectionItem.cellDataArray addObject:item];
    }
    self.pageIndex = index;
    
    [self refresh];
}

-(NSString*)randomStringWithLen:(NSInteger)len{
    NSMutableString *str = [NSMutableString string];
    for (NSInteger i=0; i<len; i ++) {
        [str appendString:[NSString stringWithFormat:@"%c", arc4random_uniform(26) + 'a']];
    }
    return str;
}

@end
