//
//  AJTableViewController.h
//  alijkManager
//
//  Created by liangqiang on 15/9/14.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import "AJViewController.h"
#import "AJTableDataSource.h"

@interface AJTableViewController : AJViewController

@property (nonatomic,strong) UITableView* tableView;
@property (nonatomic,strong) AJTableDataSource *dataSource;

-(void)createDataSource:(NSArray*)sectionArray;

@end
