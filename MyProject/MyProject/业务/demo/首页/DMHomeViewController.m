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

@interface DMHomeViewController ()
@property (nonatomic,strong) DMHomeViewModel *viewModel;
@property (nonatomic,strong) DMHomeButton *demoButton;
@end

@implementation DMHomeViewController
@dynamic viewModel;

-(void)dealloc{
    NSLog(@"");
}

-(void)createViews{
    [super createViews];
    self.demoButton = [DMHomeButton newAutoLayoutView];
    [self.demoButton autoSetDimensionsToSize:CGSizeMake(200, 50)];
    [self.view addSubview:self.demoButton];
    self.demoButton.titleLabel.text = @"回到20年前";

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
    
    for (DMHomeButtonItem *item in self.viewModel.buttons) {
        [self.scrollView addBlankSection:15];
        [self createSection:item.title clickSel:item.clickSel];
    }
}

-(UIView*)createSection:(NSString*)title clickSel:(NSString*)clickSel{
    UILabel *label = createLabel(title, kFont14, kBlackTextColor);
    UILabel *label2 = createLabel(@"V", kFont12, [UIColor redColor]);
    UIView *container = createSection(30, @[label, label2], ELineTop|ELineBottom);
    
    layoutInParent(label, 50, EAuto, EAuto, EAuto);
    layoutInParent(label2, label.right+10, EAuto, label.top+10-label2.height, EAuto);
    
    WEAKSELF
    [container handleClick:^(UIView *view) {
        runSelector(weakSelf.viewModel, NSSelectorFromString(clickSel));
    }];
    
    [self.scrollView addSection:container];
    return container;
}

@end
