//
//  WDHomeViewController.m
//  MyProject
//
//  Created by liangqiang on 16/2/29.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "WDHomeViewController.h"
#import "WDHomeViewModel.h"

@interface WDHomeViewController ()
@property (nonatomic,strong) WDHomeViewModel *viewModel;
@property (nonatomic,strong) UIScrollView *scrollView;
@end

@implementation WDHomeViewController

-(instancetype)init{
    if (self=[super init]) {
        self.title = @"首页";
    }
    return self;
}

-(void)loadView{
    [super loadView];
    
    self.scrollView = [self createScrollView];
    
    [self.view addSubview:self.scrollView];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    WEAKSELF
    self.viewModel = [self createViewModel];
    [self.viewModel setRefreshBlock:^{
        [weakSelf updateViews];
    }];

    [self.scrollView setRefreshHeaderBlock:^{
        [weakSelf.viewModel loadData];
    }];
    [self.scrollView setRefreshFooterBlock:^{
        [weakSelf.viewModel loadData];
    }];
    
    [AJUtil runAfterDelay:0 block:^{
        [weakSelf.viewModel loadData];
    }];
}

-(void)updateViews{
    [self.scrollView stopRefresh];
    [self.scrollView removeAllSections];
    for (WDButtonItem *item in self.viewModel.buttonArray) {
        UIView *section = [self createSectionWithItem:item];
        [self.scrollView addSection:section];
    }
}

-(UIView*)createSectionWithItem:(WDButtonItem*)item{
    UIView *section = [UIView newWith:kWhiteColor, nil];
    section.size = CGSizeMake(self.scrollView.width, 64);
    
    UIButton *button = [UIButton newWith:kFont16, kLightGrayColor, item.title, nil];
    [button setCornerRadiusWith:@(4), nil];
    [button setBgColorWith:kPrimaryNormalColor, kPrimaryDarkColor, nil];
    WEAKSELF
    [button handleClick:^(UIView *view) {
        [AJUtil performSelector:item.selector onTarget:weakSelf.viewModel];
    }];
    [section addSubview:button];
    [button layoutWithInsets:UIEdgeInsetsMake(10, 20, 10, 20)];
    
    return section;
}


#pragma mark - Getter
//-(UIScrollView*)scrollView{
//    if (!_scrollView) {
//        _scrollView = [UIScrollView new];
//        _scrollView.backgroundColor = kNormalBgColor;
//        _scrollView.frame = self.view.bounds;
//        _scrollView.alwaysBounceVertical = YES;
//        _scrollView.autoresizingMask =  UIViewAutoresizingFlexibleHeight;
//    }
//    return _scrollView;
//}

@end
