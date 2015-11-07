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
//    CGRect rect = CGRectMake(15, 0, APP_SCREEN_WIDTH-30, 30);
    UILabel *label = createLabel(title, kFont14, kBlackTextColor);
    UILabel *label2 = createLabel(@"V", kFont12, [UIColor redColor]);
    UIView *container = createSection(30, @[label, label2], ELineTop|ELineBottom);
    
//    label.origin = CGPointMake(15, 10);
//    label.center = container.center;
    dmPosInParent(label, 50, POS_AUTO, POS_AUTO, 1);
    dmPosByBrother(label2, label, POS_AUTO, 10, -10, POS_AUTO);
    
    WEAKSELF
    [container handleClick:^(UIView *view) {
        runSelector(weakSelf.viewModel, NSSelectorFromString(clickSel));
    }];
    
    [self.scrollView addSection:container];
    return container;
}

@end
