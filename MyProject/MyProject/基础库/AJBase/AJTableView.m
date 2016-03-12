//
//  AJTableView.m
//  MyProject
//
//  Created by liangqiang on 16/1/15.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "AJTableView.h"
#import "AJSectionItem.h"

@interface AJTableView ()

@end

@implementation AJTableView

-(instancetype)init{
    if (self=[super init]) {
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.dataSource = self;
        self.delegate = self;
        [self registerCellClasses];
    }
    return self;
}

-(id)cellItem:(NSIndexPath*)indexPath{
    AJSectionItem *sectionItem = [self.sectionArray safeObjectAtIndex:indexPath.section];
    return [sectionItem.cellDataArray safeObjectAtIndex:indexPath.row];
}

-(void)updateCell:(UITableViewCell*)cell atIndexPath:(NSIndexPath*)indexPath{
    [cell updateWithItem:[self cellItem:indexPath]];
}

#pragma mark - 子类重载
//子类重载
-(NSString*)cellIdentifier:(NSIndexPath*)indexPath{
    return @"Cell";
}

-(void)registerCellClasses{
    [self registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    AJSectionItem *sectionItem = [self.sectionArray safeObjectAtIndex:section];
    return sectionItem.cellDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:[self cellIdentifier:indexPath]];
    [self updateCell:cell atIndexPath:indexPath];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];// 取消选中状态；
    if (self.clickBlock) {
        self.clickBlock(indexPath);
    }
}

@end

@implementation UITableViewCell (AJTableView)

-(void)updateWithItem:(id)cellItem{
    
}


@end