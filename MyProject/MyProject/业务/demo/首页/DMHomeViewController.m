//
//  DMHomeViewController.m
//  MyProject
//
//  Created by liangqiang on 15/10/26.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import "DMHomeViewController.h"
#import "DMHomeViewModel.h"
#import "DMHomeButton.h"
#import "DMHomeTableView.h"

@interface DMHomeViewController ()
@property (nonatomic,strong) DMHomeViewModel *viewModel;

@property (nonatomic,strong) DMHomeTableView *tableView;
@property (nonatomic,strong) DMHomeButton *demoButton;
@end

@implementation DMHomeViewController

-(void)dealloc{
    NSLog(@"");
}

-(instancetype)init{
    if (self=[super init]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        [self updateViews];
    }
    return self;
}

-(void)viewDidLoad{
    [self.viewModel loadTableData];
    self.tableView.sectionArray = self.viewModel.sectionArray;
    
    WEAKSELF
    [self.tableView setClickBlock:^(NSIndexPath *indexPath) {
        [weakSelf.viewModel onCellClicked:indexPath];
    }];
    
    self.navigationController.navigationBar.translucent = NO; // 设置不透明，否则可能会引起scrollView的高度异常
    self.navigationController.navigationBarHidden = NO;

    if ([DMNaviService navigationController].viewControllers[0] != self) {
        self.title = [NSString stringWithFormat:@"%u", arc4random()];
        self.hidesBottomBarWhenPushed = YES;
        [self dmDefaultLeftNaviButton];
        //        [self.dmLeftNaviButton setTitle:@"取消" forState:UIControlStateNormal];
        
        [self.dmRightNaviButton setTitle:@"保存" forState:UIControlStateNormal];
        [self.dmRightNaviButton handleClick:^(UIView *view) {
            [AJUtil toast:@"保存"];
        }];
    }
}

-(void)updateViews{
//    self.demoButton.titleLabel.text = @"回到20年前";
}

-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"%@", self.view);
}

#pragma mark - getter

-(DMHomeViewModel*)viewModel{
    if (!_viewModel) {
        _viewModel = [DMHomeViewModel new];
        _viewModel.holder = self;
        WEAKSELF
        [_viewModel setAjRefreshBlock:^{
            [weakSelf updateViews];
        }];
        
    }
    return _viewModel;
}

-(DMHomeTableView*)tableView{
    if (!_tableView) {
        _tableView = [DMHomeTableView newAutoLayoutView];
        
        [self.view addSubview:_tableView];
        [_tableView autoPinEdgesToSuperviewEdges];
    }
    return _tableView;
}

-(DMHomeButton*)demoButton{
    if (!_demoButton) {
        _demoButton = [DMHomeButton newAutoLayoutView];
        
        [self.tableView addSubview:_demoButton];
        [_demoButton autoSetDimensionsToSize:CGSizeMake(200, 50)];
    }
    return _demoButton;
}

//-(void)createViews{
//    [super createViews];
//    self.demoButton = [DMHomeButton newAutoLayoutView];
//    [self.demoButton autoSetDimensionsToSize:CGSizeMake(200, 50)];
//    [self.view addSubview:self.demoButton];
//    self.demoButton.titleLabel.text = @"回到20年前";
//
//    if ([DMNaviService navigationController].viewControllers[0] != self) {
//        self.title = [NSString stringWithFormat:@"%u", arc4random()];
//        self.hidesBottomBarWhenPushed = YES;
//        [self dmDefaultLeftNaviButton];
////        [self.dmLeftNaviButton setTitle:@"取消" forState:UIControlStateNormal];
//
//        [self.dmRightNaviButton setTitle:@"保存" forState:UIControlStateNormal];
//        [self.dmRightNaviButton handleClick:^(UIView *view) {
//            [AJUtil toast:@"保存"];
//        }];
//    }
//
//    for (DMHomeButtonItem *item in self.viewModel.buttons) {
//        [self.scrollView addBlankSection:15];
//        [self createSection:item.title clickSel:item.clickSel];
//    }
//}
//
//-(UIView*)createSection:(NSString*)title clickSel:(NSString*)clickSel{
//    UILabel *label = createLabel(title, kFont14, kBlackTextColor);
//    UILabel *label2 = createLabel(@"V", kFont12, [UIColor redColor]);
//    UIView *container = createSection(30, @[label, label2], ELineTop|ELineBottom);
//    
//    layoutInParent(label, 50, EAuto, EAuto, EAuto);
//    layoutInParent(label2, label.right+10, EAuto, label.top+10-label2.height, EAuto);
//    
//    WEAKSELF
//    [container handleClick:^(UIView *view) {
//        runSelector(weakSelf.viewModel, NSSelectorFromString(clickSel));
//    }];
//    
//    [self.scrollView addSection:container];
//    return container;
//}

@end
