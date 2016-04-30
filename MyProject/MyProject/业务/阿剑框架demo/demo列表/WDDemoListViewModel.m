//
//  WDAJDemoListViewModel.m
//  MyProject
//
//  Created by liangqiang on 16/3/1.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "WDDemoListViewModel.h"

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
    
    NSArray *array = @[@[@"toast当前时间", @"onToastItemClicked"],
                         @[@"弹出ActionSheet", @"onActionSheetItemClicked"],
                         @[@"弹出AlertView", @"onAlertViewItemClicked"],
                         @[@"复杂列表示例", @"onComplexTableDemoClicked"],
                         ];
    NSArray *itemArray = [AJNormalItem createArray:array withType:@"SEL"];
    [sectionItem.cellDataArray addObjectsFromArray:itemArray];
    
    [self notifyToRefresh];
}


-(void)onCellClicked:(NSIndexPath*)indexPath{
    AJSectionItem *sectionItem = [self.sectionArray safeObjectAtIndex:indexPath.section];
    AJNormalItem *item = [sectionItem.cellDataArray safeObjectAtIndex:indexPath.row];
    [item runSelectorWithTarget:self];
}

-(void)onToastItemClicked{
    NSString *now = [AJUtil stringFromDate:[NSDate date] format:kDateFormatLong];
    [AJUtil toast:now];
}

-(id)onActionSheetItemClicked{
    NSArray *buttons = @[@"男", @"女", @"取消"];
    
    [AJUtil actionSheet:@"请选择您的性别" buttons:buttons block:^(NSInteger buttonIndex) {
        NSString *info = [NSString stringWithFormat:@"您选择了：%@", [buttons safeObjectAtIndex:buttonIndex]];
        [AJUtil toast:info];
    }];
    return @"aaaaaa";
}

-(void)onAlertViewItemClicked{
    NSArray *buttons = @[@"确定", @"取消"];
    [AJUtil alertMessage:@"亲，你搞错了吧？" buttons:@[@"确定", @"取消"] block:^(NSInteger buttonIndex) {
        NSString *info = [NSString stringWithFormat:@"您选择了：%@", [buttons safeObjectAtIndex:buttonIndex]];
        [AJUtil toast:info];
    }];
}

-(void)onComplexTableDemoClicked{
    [AJNavi pushViewController:@"WDComplexViewController"];
}

@end
