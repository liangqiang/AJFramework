//
//  DMHomeTableView.m
//  MyProject
//
//  Created by liangqiang on 16/1/15.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "DMHomeTableView.h"
#import "DMHomeTableViewCell.h"
#import "DMHomeCellItem.h"

@implementation DMHomeTableView

-(NSString*)cellIdentifier:(NSIndexPath*)indexPath{
    return @"Cell";
}

-(void)registerCellClasses{
    [self registerClass:[DMHomeTableViewCell class] forCellReuseIdentifier:@"Cell"];
}

-(void)updateCell:(UITableViewCell*)tableCell atIndexPath:(NSIndexPath*)indexPath{
    DMHomeTableViewCell *cell = (DMHomeTableViewCell*)tableCell;
    DMHomeCellItem *item = [self cellData:indexPath];
    
    cell.mainButton.titleLabel.text = item.title;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.0;
}

@end
