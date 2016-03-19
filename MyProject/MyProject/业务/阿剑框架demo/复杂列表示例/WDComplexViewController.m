//
//  WDComplexListViewViewController.m
//  MyProject
//
//  Created by liangqiang on 16/3/2.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "WDComplexViewController.h"
#import "WDComplexViewModel.h"
#import "WDComplexTableView.h"

@interface WDComplexViewController ()
@property (nonatomic,strong) WDComplexViewModel *viewModel;
@property (nonatomic,strong) WDComplexTableView *tableView;
@end

@implementation WDComplexViewController

-(instancetype)init{
    if (self=[super init]) {
        self.title = @"复杂列表示例";
    }
    return self;
}

-(void)loadView{
    [super loadView];
    
    self.tableView = [self createTableView];
    [self.view addSubview:self.tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    WEAKSELF
    self.viewModel = [self createViewModel];
    [self.viewModel setRefreshBlock:^{
        [weakSelf updateViews];
    }];
    
    self.tableView.sectionArray = self.viewModel.sectionArray;
    [self.tableView setRefreshHeaderBlock:^{
        [weakSelf.viewModel loadFirstPage];
    }];
    [self.tableView setRefreshFooterBlock:^{
        [weakSelf.viewModel loadNextPage];
    }];
    [self.tableView setClickBlock:^(NSIndexPath *indexPath) {
    }];
    
    [AJUtil runAfterDelay:0 block:^{
        [weakSelf.viewModel loadFirstPage];
    }];
}

-(void)updateViews{
    [self.tableView stopRefresh];
    [self.tableView reloadData];
//    [self.view setNeedsLayout];
}

//- (void)viewWillLayoutSubviews{
//    [super viewWillLayoutSubviews];
//    
//}

@end
