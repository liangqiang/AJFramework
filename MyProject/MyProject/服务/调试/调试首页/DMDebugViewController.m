//
//  AJDebugViewController.m
//  alijkManager
//
//  Created by liangqiang on 15/9/14.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import "DMDebugViewController.h"
#import "DMDebugViewModel.h"

@interface DMDebugViewController ()
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) DMDebugViewModel   *viewModel;
@property (nonatomic,strong) UIButton *debugButton;
@end

@implementation DMDebugViewController

-(UIScrollView*)scrollView{
    if (!_scrollView) {
        _scrollView = [UIScrollView newAutoLayoutView];
        _scrollView.showsVerticalScrollIndicator = YES;
        _scrollView.backgroundColor = HEXCOLOR(0xF5F5F5); // 背景为灰色
        _scrollView.alwaysBounceVertical = YES;
        
        [self.view addSubview:_scrollView];
        [_scrollView autoPinEdgesToSuperviewEdges];
    }
    
    return _scrollView;
}

-(id)viewModel{
    if (!_viewModel) {
        _viewModel = [DMDebugViewModel new];
        _viewModel.holder = self;
        
        WEAKSELF
        [_viewModel setAjRefreshBlock:^{
            [weakSelf updateViews];
        }];
    }
    return _viewModel;
}


-(void)viewDidLoad{
    self.scrollView.backgroundColor = [UIColor whiteColor];
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

-(void)updateViews{
}

//设置环境
-(void)createEnvSection{
    UILabel *label = [self createSectionLabel:@"环境"];
    
    NSArray *segmentedArray = @[@"日常",@"预发",@"线上"];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray];
    segmentedControl.frame = CGRectMake(16+17*3+16, (40-33)/2, 160, 33);
    segmentedControl.tag = tag(DebugSegment);
    
//    [self.scrollView addSection:64 subviews:@[]];
    UIView *container = createSection(40, @[label, segmentedControl], ELineNone);
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

    UIView *container = createSection(8+btn.height+8, @[btn], ELineNone);
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

    UIView *container = createSection(8+btn.height+8, @[btn], ELineNone);
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

    UIView *container = createSection(8+btn.height+8, @[btn], ELineNone);
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

    UIView *container = createSection(8+btn.height+8, @[btn], ELineNone);
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


@end
