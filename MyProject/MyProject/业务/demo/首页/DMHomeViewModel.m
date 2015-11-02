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
    [DMNaviService setFirstViewController:@"DMHomeViewController"];
}

-(void)onSetTabRootClicked{
    [AJUtil toast:@"onGotoTabClicked"];
    [DMNaviService setFirstViewController:@"DMTabHomeViewController"];
}


-(void)onPushBlankClicked{
    AJScrollViewController *vc = (AJScrollViewController*)[DMNaviService pushViewController:@"DMHomeViewController"];
    __weak AJScrollViewController *weakVc = vc;
    //添加下拉上拉刷新
    [vc.scrollView setDMRefreshHeaderBlock:^{
        [AJUtil toast:@"aaaaa"];
        runBlockAfterDelay(2, ^{
            [weakVc.scrollView stopRefresh];
        });
    } footerBlock:^{
        [AJUtil toast:@"bbbb"];
        [weakVc.scrollView stopRefresh];
    } inHolder:vc];
}

-(void)onLoadingClicked{
    [AJUtil showLoading];
    runBlockAfterDelay(3, ^{
        [AJUtil hideLoading];
    });
    
    AJSettings *settings = [AJSettings sharedInstance];
    settings.defaultDict = @{@"key1":@"value1"};
    
    [AJSettings setObject:@"value2" forKey:@"key2"];
    [AJSettings setObject:@"value1111" forKey:@"key1"];
    [AJUtil toast:[AJSettings objectForKey:@"key1"]];
    
    runBlockAfterDelay(3, ^{
        [AJSettings removeAllKeys];
        [AJUtil toast:[AJSettings objectForKey:@"key1"]];
    });
    
}

@end
