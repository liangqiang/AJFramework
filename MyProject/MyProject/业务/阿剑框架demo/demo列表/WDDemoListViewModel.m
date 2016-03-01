//
//  WDAJDemoListViewModel.m
//  MyProject
//
//  Created by liangqiang on 16/3/1.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "WDDemoListViewModel.h"
#import "WDButtonItem.h"

@interface WDDemoListViewModel ()

@end

@implementation WDDemoListViewModel
-(instancetype)init{
    if (self=[super init]) {
        _sectionArray = [NSMutableArray arrayWithObject:[AJSectionItem new]];
    }
    return self;
}

-(void)loadData{
    AJSectionItem *sectionItem = [self.sectionArray firstObject];
    [sectionItem.cellDataArray removeAllObjects];
    
    for (NSInteger i=0; i<10; i ++) {
        NSString *title = [NSString stringWithFormat:@"标题 %zd", i+1];
        WDButtonItem *item = [WDButtonItem newWithTitle:title selector:@selector(onItemClicked)];
        [sectionItem.cellDataArray addObject:item];
    }
    [self refresh];
}

-(void)onCellClicked:(NSIndexPath*)indexPath{
    AJSectionItem *sectionItem = [self.sectionArray safeObjectAtIndex:indexPath.section];
    WDButtonItem *item = [sectionItem.cellDataArray safeObjectAtIndex:indexPath.row];
    [AJUtil toast:item.title];
}

-(void)onItemClicked{
    
}

@end
