//
//  DMHomeTableView.m
//  MyProject
//
//  Created by liangqiang on 16/1/15.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "DMHomeTableView.h"
#import "DMHomeCell.h"
#import "DMHomeCellItem.h"

@implementation DMHomeTableView

-(NSString*)cellIdentifier:(NSIndexPath*)indexPath{
    return @"Cell";
}

-(void)registerCellClasses{
    [self registerClass:[DMHomeCell class] forCellReuseIdentifier:@"Cell"];
}

-(void)updateCell:(UITableViewCell*)tableCell atIndexPath:(NSIndexPath*)indexPath{
    DMHomeCell *cell = (DMHomeCell*)tableCell;
    DMHomeCellItem *item = [self cellData:indexPath];
    
    cell.titleLabel.text = item.title;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.0;
}

@end
