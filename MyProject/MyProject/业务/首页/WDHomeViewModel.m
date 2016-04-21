//
//  WDHomeViewModel.m
//  MyProject
//
//  Created by liangqiang on 16/2/29.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "WDHomeViewModel.h"

@implementation WDHomeViewModel

-(void)loadData
{
    NSArray *array = @[@[@"阿剑框架功能Demo", @"WDDemoListViewController"],
                       @[@"iPhone课件Demo", @"Y000ViewController"]];
    self.itemArray = [AJNormalItem createArray:array withType:@"PushVC"];
    
    [self notifyToRefresh];
}

-(void)onItemClicked:(AJNormalItem*)item
{
    [item pushViewController];
}

@end
