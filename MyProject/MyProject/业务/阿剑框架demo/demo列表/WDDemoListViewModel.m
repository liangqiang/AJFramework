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
        self.sectionArray = [NSMutableArray arrayWithObject:[AJSectionItem new]];
    }
    return self;
}

-(void)loadData{
    AJSectionItem *sectionItem = [self.sectionArray firstObject];
    [sectionItem.cellDataArray removeAllObjects];
    
    [sectionItem.cellDataArray addObject:[WDButtonItem newWithTitle:@"toast当前时间" selector:@selector(onToastItemClicked)]];
    [sectionItem.cellDataArray addObject:[WDButtonItem newWithTitle:@"弹出ActionSheet" selector:@selector(onActionSheetItemClicked)]];
    [sectionItem.cellDataArray addObject:[WDButtonItem newWithTitle:@"复杂列表示例" selector:@selector(onComplexTableDemoClicked)]];

    [self notifyToRefresh];
}

-(void)onCellClicked:(NSIndexPath*)indexPath{
    AJSectionItem *sectionItem = [self.sectionArray safeObjectAtIndex:indexPath.section];
    WDButtonItem *item = [sectionItem.cellDataArray safeObjectAtIndex:indexPath.row];
    [AJUtil performSelector:item.selector onTarget:self];
}

-(void)onToastItemClicked{
    NSString *now = [AJUtil stringFromDate:[NSDate date] format:kDateFormatLong];
    [AJUtil toast:now];
}

-(void)onActionSheetItemClicked{
    NSArray *buttons = @[@"男", @"女", @"取消"];
    
    [AJUtil actionSheet:@"请选择您的性别" buttons:buttons block:^(NSInteger buttonIndex) {
        NSString *info = [NSString stringWithFormat:@"您选择了：%@", [buttons safeObjectAtIndex:buttonIndex]];
        [AJUtil toast:info];
    }];
}

-(void)onComplexTableDemoClicked{
    [AJNavi pushViewController:@"WDComplexViewController"];
}

@end
