//
//  DMHomeViewController.m
//  MyProject
//
//  Created by liangqiang on 15/10/26.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import "DMHomeViewController.h"
#import "DMHomeViewModel.h"
@interface DMHomeViewController ()
@property (nonatomic,strong) DMHomeViewModel *viewModel;
@end

@implementation DMHomeViewController
@dynamic viewModel;

-(void)dealloc{
    NSLog(@"");
}

-(void)createViews{
    [super createViews];
//    [DMNaviService navigationController].viewControllers[0] == self
//    if (self.title == nil) {
    if ([DMNaviService navigationController].viewControllers[0] != self) {
        self.title = [NSString stringWithFormat:@"%u", arc4random()];
        self.hidesBottomBarWhenPushed = YES;
        [self setDefaultDMNaviButton];
        [self setRightDMNaviButton];
    }
    
    for (DMHomeButtonItem *item in self.viewModel.buttons) {
        [self.scrollView addBlankSection:15];
        [self createSection:item.title clickSel:item.clickSel];
    }
}


-(UIView*)createSection:(NSString*)title clickSel:(NSString*)clickSel{
    CGRect rect = CGRectMake(15, 0, APP_SCREEN_WIDTH-30, 30);
    UILabel *label = createLabel(rect, title, kFont14, kBlackTextColor);
    UIView *container = createContainer(30, @[label], ELineTop|ELineBottom);

    WEAKSELF
    [container handleClick:^(UIView *view) {
        runSelector(weakSelf.viewModel, NSSelectorFromString(clickSel));
    }];
    
    [self.scrollView addSection:container];
    return container;
}

@end
