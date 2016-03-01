//
//  AJDebugViewController.m
//  alijkManager
//
//  Created by liangqiang on 15/9/14.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import "WDDebugViewController.h"
#import "WDDebugViewModel.h"

@interface WDDebugViewController ()
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) WDDebugViewModel   *viewModel;
@property (nonatomic,strong) UIButton *debugButton;
@end

@implementation WDDebugViewController

-(instancetype)init{
    if (self=[super init]) {
        self.title = @"调试";
    }
    return self;
}

-(void)loadView{
    [super loadView];
    
    [self.view addSubview:self.scrollView];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    WEAKSELF
    self.viewModel = [self createViewModel];
    [self.viewModel setRefreshBlock:^{
        [weakSelf updateViews];
    }];
    [AJUtil runAfterDelay:0 block:^{
        [weakSelf.viewModel loadData];
    }];
}

-(void)updateViews{
    [self.scrollView removeAllSections];
    
    [self.scrollView addBlankSection:64];
    [self createEnvSection];
    if (self.viewModel.isPageDebug) {
        [self createPageReleaseSection];
    }else{
        [self createPageDebugSection];
    }
    [self createTabPageBackSection];
    [self createCloseSection];
}

//设置环境
-(void)createEnvSection{
    UILabel *label = [self createSectionLabel:@"环境"];
    
    NSArray *segmentedArray = @[@"日常",@"预发",@"线上"];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray];
    segmentedControl.frame = CGRectMake(16+17*3+16, (40-33)/2, 160, 33);
    segmentedControl.tag = tag(DebugSegment);
    
//    [self.scrollView addSection:64 subviews:@[]];
    UIView *container = [UIView new];
    container.size = CGSizeMake(self.scrollView.width, 40);
    [container addSubviews:label, segmentedControl, nil];
//    createSection(40, @[label, segmentedControl], ELineNone);
    [self.scrollView addSection:container];
//    [self.scrollView addSection:40 subviews:@[label, segmentedControl]];
}

-(void)createTabPageBackSection{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, 8, APP_SCREEN_WIDTH-100, 50);
    [btn setTitle:@"Tab页返回上一页面" forState:UIControlStateNormal];
    [btn setBackgroundImage:[AJUtil createImageWithColor:HEXCOLOR(0x5a5a5a) size:btn.size] forState:UIControlStateNormal];
    
    WEAKSELF
    [btn handleEvent:UIControlEventTouchUpInside withBlock:^(UIControl *control) {
        [weakSelf.viewModel onTabPageBackButtonClicked];
    }];

    UIView *container = [UIView new];
    container.size = CGSizeMake(self.scrollView.width, 8+btn.height+8);
    [container addSubviews:btn, nil];
//    createSection(8+btn.height+8, @[btn], ELineNone);
    [self.scrollView addSection:container];
//    [self.scrollView addSection:8+btn.height+8 subviews:@[btn]];
}

-(void)createPageDebugSection{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, 8, APP_SCREEN_WIDTH-100, 50);
    [btn setTitle:@"开始页面调试" forState:UIControlStateNormal];
    [btn setBackgroundImage:[AJUtil createImageWithColor:HEXCOLOR(0x5a5a5a) size:btn.size] forState:UIControlStateNormal];
    
    WEAKSELF
    [btn handleEvent:UIControlEventTouchUpInside withBlock:^(UIControl *control) {
        [weakSelf.viewModel onPageDebugButtonClicked];
    }];
    
    UIView *container = [UIView new];
    container.size = CGSizeMake(self.scrollView.width, 8+btn.height+8);
    [container addSubviews:btn, nil];
//    UIView *container = createSection(8+btn.height+8, @[btn], ELineNone);
    [self.scrollView addSection:container];
//    [self.scrollView addSection:8+btn.height+8 subviews:@[btn]];
}

-(void)createPageReleaseSection{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, 8, APP_SCREEN_WIDTH-100, 50);
    [btn setTitle:@"关闭页面调试" forState:UIControlStateNormal];
    [btn setBackgroundImage:[AJUtil createImageWithColor:HEXCOLOR(0x5a5a5a) size:btn.size] forState:UIControlStateNormal];
    
    WEAKSELF
    [btn handleEvent:UIControlEventTouchUpInside withBlock:^(UIControl *control) {
        [weakSelf.viewModel onPageReleaseButtonClicked];
    }];

    UIView *container = [UIView new];
    container.size = CGSizeMake(self.scrollView.width, 8+btn.height+8);
    [container addSubviews:btn, nil];
//    UIView *container = createSection(8+btn.height+8, @[btn], ELineNone);
    [self.scrollView addSection:container];
//    [self.scrollView addSection:8+btn.height+8 subviews:@[btn]];
}


-(void)createCloseSection{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, 8, APP_SCREEN_WIDTH-100, 50);
    [btn setTitle:@"关闭" forState:UIControlStateNormal];
    [btn setBackgroundImage:[AJUtil createImageWithColor:HEXCOLOR(0x5a5a5a) size:btn.size] forState:UIControlStateNormal];
    
    WEAKSELF
    [btn handleEvent:UIControlEventTouchUpInside withBlock:^(UIControl *control) {
        [weakSelf.viewModel onCloseButtonClicked];
    }];

    UIView *container = [UIView new];
    container.size = CGSizeMake(self.scrollView.width, 8+btn.height+8);
    [container addSubviews:btn, nil];
//    UIView *container = createSection(8+btn.height+8, @[btn], ELineNone);
    [self.scrollView addSection:container];
//    [self.scrollView addSection:8+btn.height+8 subviews:@[btn]];
}

-(UILabel*)createSectionLabel:(NSString*)text{
    CGRect rect = CGRectMake(16, 0, 17*3, 40);
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    label.font = [UIFont boldSystemFontOfSize:17];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = HEXCOLOR(0x000000);
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentLeft;
    label.text = text;
    return label;
}

-(UIScrollView*)scrollView{
    if (!_scrollView) {
        _scrollView = [UIScrollView new];
        _scrollView.backgroundColor = kLightGrayColor;
        _scrollView.frame = self.view.bounds;
        _scrollView.alwaysBounceVertical = YES;
        _scrollView.autoresizingMask =  UIViewAutoresizingFlexibleHeight;
    }
    
    return _scrollView;
}

//-(id)viewModel{
//    if (!_viewModel) {
//        _viewModel = [DMDebugViewModel new];
//        _viewModel.holder = self;
//        
//        WEAKSELF
//        [_viewModel setRefreshBlock:^{
//            [weakSelf updateViews];
//        }];
//    }
//    return _viewModel;
//}



@end
