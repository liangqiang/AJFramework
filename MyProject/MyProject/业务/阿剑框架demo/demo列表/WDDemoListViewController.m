//
//  WDAJDemoListViewController.m
//  MyProject
//
//  Created by liangqiang on 16/3/1.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "WDDemoListViewController.h"
#import "WDDemoListViewModel.h"
#import "WDDemoListTableView.h"
@interface WDDemoListViewController ()
@property (nonatomic,strong) WDDemoListViewModel *viewModel;
@property (nonatomic,strong) WDDemoListTableView *tableView;
@end

@implementation WDDemoListViewController

-(instancetype)init{
    if (self=[super init]) {
        self.title = @"阿剑框架Demo";
    }
    return self;
}

-(void)loadView{
    [super loadView];
    
    self.viewModel = [self createViewModel];
    self.tableView = [self createTableView];
    
    [self.view addSubview:self.tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    WEAKSELF
    self.tableView.sectionArray = self.viewModel.sectionArray;
    [self.tableView setRefreshHeaderBlock:^{
        [weakSelf.viewModel loadData];
    }];
    [self.tableView setRefreshFooterBlock:^{
        [weakSelf.viewModel loadData];
    }];
    [self.tableView setClickBlock:^(NSIndexPath *indexPath) {
        [weakSelf.viewModel onCellClicked:indexPath];
    }];
    
    [self.viewModel setRefreshBlock:^{
        [weakSelf updateViews];
    }];
    [AJUtil runAfterDelay:0 block:^{
        [weakSelf.viewModel loadData];
    }];
}

-(void)updateViews{
    [self.tableView stopRefresh];
    [self.tableView reloadData];
}

@end
