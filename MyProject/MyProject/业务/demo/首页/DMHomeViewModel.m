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

-(void)onSetNaviRootClicked{
    [AJUtil toast:@"onGotoTabClicked"];
    [DMNaviService setRootViewController:@"DMHomeViewController"];
}

-(void)onSetTabRootClicked{
    [AJUtil toast:@"onGotoTabClicked"];
    [DMNaviService setRootViewController:@"DMTabHomeViewController"];
}


-(void)onPushBlankClicked{
    AJScrollViewController *vc = (AJScrollViewController*)[DMNaviService pushViewController:@"DMHomeViewController"];

    [vc.scrollView setDMHeaderViewInHolder:vc withRefreshBlock:^(AJRefreshViewCompleteBlock completion) {
        [AJUtil toast:@"aaaaa"];
        completion(2);
    }];
    [vc.scrollView setDMFooterViewInHolder:vc withRefreshBlock:^(AJRefreshViewCompleteBlock completion) {
        [AJUtil toast:@"bbbb"];
        completion(2);
    }];
}

-(void)onLoadingClicked{
    [AJUtil showLoading];
    runBlockAfterDelay(3, ^{
        [AJUtil hideLoading];
    });
}

@end
