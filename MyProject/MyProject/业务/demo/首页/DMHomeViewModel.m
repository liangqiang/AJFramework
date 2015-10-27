//
//  DMHomeViewModel.m
//  MyProject
//
//  Created by liangqiang on 15/10/26.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import "DMHomeViewModel.h"
#import "AJScrollViewController.h"

@implementation DMHomeViewModel

-(void)onGotoTabClicked{
    [AJUtil toast:@"onGotoTabClicked"];
    [DMNaviService pushViewController:@"DMTabHomeViewController"];
}

-(void)onPushBlankClicked{
    AJScrollViewController *vc = (AJScrollViewController*)[DMNaviService pushViewController:@"DMHomeViewController"];
    [vc.scrollView setDeallocParent:vc];
    [vc.scrollView setDMHeaderViewRefreshBlock:^(AJRefreshViewCompleteBlock completion) {
        [AJUtil toast:@"aaaaa"];
        completion(2);
    }];
    [vc.scrollView setDMFooterViewRefreshBlock:^(AJRefreshViewCompleteBlock completion) {
        [AJUtil toast:@"bbbb"];
        completion(2);
    }];
}

@end
