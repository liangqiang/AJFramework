//
//  AJTableDataSource.h
//  alijkManager
//
//  Created by liangqiang on 15/9/14.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AJTableDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) NSArray *sectionArray;
@property (nonatomic,copy) AJTableClickBlock clickBlock;

//子类重载
-(NSString*)cellIdentifier:(NSIndexPath*)indexPath; //有不同cell时重载
-(UITableViewCell*)createCell:(UITableView *)tableView atIndexPath:(NSIndexPath*)indexPath;
-(void)updateCell:(UITableViewCell*)cell atIndexPath:(NSIndexPath*)indexPath;

-(void)setClickBlock:(AJTableClickBlock)clickBlock;

@end
