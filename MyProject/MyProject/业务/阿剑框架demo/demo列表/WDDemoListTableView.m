//
//  WDDemoListTableView.m
//  MyProject
//
//  Created by liangqiang on 16/3/1.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "WDDemoListTableView.h"

@implementation WDDemoListTableView

#pragma mark - 设置cell类
-(NSString*)cellIdentifier:(NSIndexPath*)indexPath{
    return @"Cell";
}

-(void)registerCellClasses{
    [self registerClass:NSClassFromString(@"WDDemoListTableViewCell") forCellReuseIdentifier:@"Cell"];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 48;
}

@end
