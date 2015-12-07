//
//  AJTableDataSource.m
//  alijkManager
//
//  Created by liangqiang on 15/9/14.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import "AJTableDataSource.h"
#import "AJTableSectionItem.h"

@interface AJTableDataSource()
@end

@implementation AJTableDataSource

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    AJTableSectionItem *sectionItem = [self.sectionArray safeObjectAtIndex:section];
    return sectionItem.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:[self cellIdentifier:indexPath]];
    if (!cell) {
        cell = [self createCell:(UITableView *)tableView atIndexPath:indexPath];
    }
    
    [self updateCell:cell atIndexPath:indexPath];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];// 取消选中状态；避免弹出alert窗口后，一直在选中状态
    if (self.clickBlock) {
        self.clickBlock(indexPath);
    }
}

#pragma mark - 子类重载
//子类重载
-(NSString*)cellIdentifier:(NSIndexPath*)indexPath{
    return @"Cell";
}

//子类重载
-(UITableViewCell*)createCell:(UITableView *)tableView atIndexPath:(NSIndexPath*)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[self cellIdentifier:indexPath]];
    
    cell.width = tableView.width; //cell创建时默认为320，此处需指定宽度，否则布局不对
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

//子类重载
-(void)updateCell:(UITableViewCell*)cell atIndexPath:(NSIndexPath*)indexPath{
}

@end
