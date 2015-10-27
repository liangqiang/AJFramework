//
//  AJDebugViewController.m
//  alijkManager
//
//  Created by liangqiang on 15/9/14.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import "DMDebugViewController.h"
#import "AJDebugViewModel.h"

@interface DMDebugViewController ()
@property (nonatomic,strong) AJDebugViewModel   *viewModel;
@property (nonatomic,strong) UIButton *debugButton;
@end

typedef enum {
    tagStart = 90000,
    tagEnvrioment,
} Tag;

@implementation DMDebugViewController
@dynamic viewModel;

-(id)init{
    self = [super init];
    if (self) {
    }
    return self;
}

-(void)createViews{
    [super createViews];
    
    [self.scrollView addBlank:64];
//    [self createEnvSection];
    if (self.viewModel.isPageDebug) {
        [self createPageReleaseSection];
    }else{
        [self createPageDebugSection];
    }
    [self createTabPageBackSection];
    [self createCloseSection];
}

-(void)updateViews{
    [super updateViews];
}

//设置环境
-(void)createEnvSection{
    UILabel *label = [self createSectionLabel:@"环境"];
    
    NSArray *segmentedArray = @[@"日常",@"预发",@"线上"];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray];
    segmentedControl.frame = CGRectMake(16+17*3+16, (40-33)/2, 160, 33);
    segmentedControl.tag = tagEnvrioment;
    
//    [self.scrollView addSection:64 subviews:@[]];
    [self.scrollView addSection:40 subviews:@[label, segmentedControl]];
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

    [self.scrollView addSection:8+btn.height+8 subviews:@[btn]];
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

    [self.scrollView addSection:8+btn.height+8 subviews:@[btn]];
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

    [self.scrollView addSection:8+btn.height+8 subviews:@[btn]];
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

    [self.scrollView addSection:8+btn.height+8 subviews:@[btn]];
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
